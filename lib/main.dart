import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:movieapp/constant.dart';
import 'package:movieapp/features/home_screen/page/home_screen.dart';
import 'package:movieapp/features/home_screen/provider/movie_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MovieProvider>(
            create: (context) => MovieProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kBackGroundColor,
            appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: kBackGroundColor,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        ),
      ),
    );
  }
}
