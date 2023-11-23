import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path/path.dart';
import 'package:theme_freight_ui/src/app.dart';
import 'package:theme_freight_ui/src/features/operate/bloc/operate_bloc.dart';
import 'package:theme_freight_ui/src/features/operate/repository/operate_repository.dart';
import 'package:theme_freight_ui/src/settings/observer.dart';
import 'package:theme_freight_ui/src/features/user/bloc/authentication_bloc.dart';
import 'package:theme_freight_ui/src/features/user/repository/authentication_repository.dart';
import 'package:theme_freight_ui/src/features/user/state/authentication_state.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  Bloc.observer = MyBlocObserver();
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider<AuthenticationRepository>(
        create: (context) => AuthenticationRepositoryImpl(),
      ),
      RepositoryProvider<OperateRepository>(
        create: (context) => OperateRepositoryImpl(),
       )
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(
            context.read<AuthenticationRepository>(),
          ),
        ),
        BlocProvider(create: (context) => OperateBloc(
          context.read<OperateRepository>(),
        ),
        ),
      ],
      child: const App(),
    )
  ));
}

