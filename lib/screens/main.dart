import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc_changes.dart';
import 'package:news_app/home_layout/home_screen.dart';
import 'package:news_app/style/my_theme.dart';
import 'package:news_app/style/splash_screen.dart';

void main() {
  Bloc.observer=MyBlocObserver();
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        SplashScreen.routeName : (context) => SplashScreen()
      },
    );
  }
}
