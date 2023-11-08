import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:theme_freight_ui/src/app.dart';
import 'package:theme_freight_ui/src/user/bloc/authentication_bloc.dart';
import 'package:theme_freight_ui/src/user/repository/authentication_repository.dart';

void main() async {
  await dotenv.load(fileName: '.env');

  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider<AuthenticationRepository>(
        create: (context) => AuthenticationRepositoryImpl(),
      ),
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(
            context.read<AuthenticationRepository>(),
          ),
        )
      ],
      child: const App(),
    )
  ));
}

