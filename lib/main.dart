import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_sample/features/auth/common/bloc/auth/auth_state.dart';
import 'package:flutter_clean_sample/features/auth/core/config/theme/app_theme.dart';
import 'package:flutter_clean_sample/features/auth/presentation/auth/pages/signup.dart';
import 'package:flutter_clean_sample/features/auth/presentation/home/pages/home.dart';
import 'features/auth/common/bloc/auth/auth_state_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/di/service_locator.dart';

void main() {
    SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black
    )
  );
    setupServiceLocator();
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    // return MaterialApp(
    //     theme: AppTheme.appTheme,
    //     debugShowCheckedModeBanner: false,
    //     home: SignupPage()
    // );

    return BlocProvider(
      create: (context) => AuthStateCubit()..appStarted(),
      child: MaterialApp(
          theme: AppTheme.appTheme,
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<AuthStateCubit,AuthState>(
            builder: (context, state) {
              if (state is Authenticated){
                return const HomePage();
              }
              if (state is UnAuthenticated){
                return SignupPage();
              }
              return Container();
            },
          )
      ),
    );
  }
}