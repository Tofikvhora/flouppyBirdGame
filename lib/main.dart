import 'package:fluppebirdgame/provider/GameLogic.dart';
import 'package:fluppebirdgame/view/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FlappyBirdLogic()),
      ],
      builder: (context, child) {
        return ScreenUtilInit(
          scaleByHeight: true,
          minTextAdapt: true,
          designSize: const Size(400,850),
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const HomePage(),
            );
          },

        );
      },

    );
  }
}
