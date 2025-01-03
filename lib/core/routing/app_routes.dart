import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messangerme/controllers/auth_cubit/auth_cubit.dart';
import 'package:messangerme/core/di/getit.dart';
import 'package:messangerme/core/routing/routes.dart';
import 'package:messangerme/views/chat_view.dart';
import 'package:messangerme/views/login_view.dart';
import 'package:messangerme/views/signup_view.dart';
import 'package:messangerme/views/welcome_view.dart';

class AppRoutes {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const WelcomeView());
      case Routes.login:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => sl<AuthCubit>(),
                child: const LoginView(),
              ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => sl<AuthCubit>(),
                child: const SignupView(),
              ),
        );
      case Routes.chat:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => sl<AuthCubit>(),
                child: ChatView(),
              ),
        );
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                appBar: AppBar(title: const Text("Page not found")),
                body: const Center(child: Text("404 - Page not found")),
              ),
        );
    }
  }
}
