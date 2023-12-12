import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_with_bloc/routs/app_routs.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(218,471),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,child){
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouts.router,
        );
      },
    );
  }
}
