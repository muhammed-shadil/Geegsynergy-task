import 'package:flutter/material.dart';
import 'package:geeksynergy_mechine_task/Model/user_model.dart';
import 'package:geeksynergy_mechine_task/Utils/constants.dart';
import 'package:geeksynergy_mechine_task/View/LoginScreen/login_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>('userBox');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        listTileTheme: const ListTileThemeData(textColor: Colors.white),
        appBarTheme: const AppBarTheme(
            color: constants.backgroundColor, foregroundColor: constants.white),
        scaffoldBackgroundColor: constants.backgroundColor,
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: constants.white),
          bodyMedium: TextStyle(color: constants.white),
        )),
    home: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginScreenWrapper();
  }
}
