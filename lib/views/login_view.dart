import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messangerme/controllers/auth_cubit/auth_cubit.dart';
import 'package:messangerme/views/widgets/button_in_welcome_view.dart';
import 'package:messangerme/views/widgets/constimage.dart';
import 'package:messangerme/views/widgets/rowtexts.dart';
import 'package:messangerme/views/widgets/textfield_item.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    final authCubit = context.read<AuthCubit>();
    
    // تعبئة emailController إذا كان هناك مستخدم مسجل مسبقاً
    final currentUser = authCubit.repositry.getuser();
    if (currentUser != null && currentUser.email != null) {
      authCubit.emailController.text = currentUser.email!;
    }

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
     if (state is AuthSuccess) {
    if (state.user != null) {
      Navigator.pushNamed(context, 'chat');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed: User not found')),
      );
    }
  }  else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: authCubit.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 if (currentUser != null && currentUser.email != null)
                    Text(
                      currentUser.email!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ConstImage(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                   TextfieldItem(
                    controller: authCubit.emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Invalid email format';
                      }
                      return null;
                    }, text: 'Email',
                  ),
                  SizedBox(height: screenHeight * 0.02),
                 TextfieldItem(
                    controller: authCubit.passwordController,
                    text: 'Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  if (state is AuthLoading)
                    const Center(child: CircularProgressIndicator())
                  else
                    ButtonInWlcomeview(
                      text: 'Login',
                      color: Colors.orange,
                      onPressed: () {
                        authCubit.signin();
                      },
                    ),
                  SizedBox(height: screenHeight * 0.02),
                  Rowtexts(
                    text2: 'Don\'t have an account?',
                    text1: 'Signup',
                    onPressed: () {
                      Navigator.pushNamed(context, 'register');
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
