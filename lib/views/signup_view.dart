import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messangerme/controllers/auth_cubit/auth_cubit.dart';
import 'package:messangerme/views/widgets/button_in_welcome_view.dart';
import 'package:messangerme/views/widgets/constimage.dart';
import 'package:messangerme/views/widgets/rowtexts.dart';
import 'package:messangerme/views/widgets/textfield_item.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushNamed(context, 'chat');
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: context.read<AuthCubit>().formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstImage(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
                SizedBox(height: screenHeight * 0.02), // 2% of screen height
                TextfieldItem(
                  text: 'Email',
                  controller: context.read<AuthCubit>().emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: screenHeight * 0.02), // 2% of screen height
                TextfieldItem(
                  text: 'Password',
                  controller: context.read<AuthCubit>().passwordController,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: screenHeight * 0.02), // 2% of screen height
                ButtonInWlcomeview(
                  text: 'Signup',
                  color: Colors.blue,
                  onPressed: () {
                    context.read<AuthCubit>().signup();
                  },
                ),
                SizedBox(height: screenHeight * 0.02), // 2% of screen height
                Rowtexts(
                  text2: 'Already have an account?',
                  text1: 'Login',
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
