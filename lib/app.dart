import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/splash/splash_view.dart';

class FitNestXApp extends StatelessWidget {
  const FitNestXApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              fontFamily: GoogleFonts.poppins().fontFamily,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: SplashView(),
          );
        });
  }
}
