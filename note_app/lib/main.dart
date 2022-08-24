import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/application/note/note_cubit.dart';
import 'package:note_app/core/themes.dart';
import 'package:note_app/presentation/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await configureInjection();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyAppThemes.lightTheme,
        home: HomeScreen(),
      ),
    );
  }
}
