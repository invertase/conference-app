import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

enum ThemeType { light, dark }

extension CupertinoFromMaterial on ThemeData {
  CupertinoThemeData get cupertinoTheme => MaterialBasedCupertinoThemeData(
        materialTheme: this,
      ).copyWith(
        textTheme: CupertinoTextThemeData(textStyle: textTheme.bodyMedium),
      );
}

class AppTheme {
  const AppTheme(this.type);

  final ThemeType type;

  ThemeData get mainTheme => ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primaryColorMain,
        primaryColorLight: AppColors.primaryColorSecondary,
        primaryColorDark: AppColors.backgroundDark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColorMain,
          secondary: AppColors.secondaryColorMain,
          primary: AppColors.primaryColorMain,
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: AppColors.primaryColorMain,
            size: 25,
          ),
        ),
        scaffoldBackgroundColor: AppColors.backgroundWhite,
        cardColor: AppColors.backgroundWhite,
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(
            color: AppColors.textColorHighEmphacy,
            fontSize: 20,
          ),
          bodyMedium: GoogleFonts.poppins(
            color: AppColors.textColorHighEmphacy,
          ),
          bodySmall: GoogleFonts.poppins(
            color: AppColors.textColorHighEmphacy,
            fontSize: 10,
          ),
          titleMedium: GoogleFonts.poppins(
            color: AppColors.textColorHighEmphacy,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          titleLarge: GoogleFonts.poppins(
            color: AppColors.textColorHighEmphacy,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        dividerColor: const Color(0xffF1F1F1).withOpacity(0.5),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.backgroundWhite,
          selectedItemColor: AppColors.backgroundDark,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.textColorLowEmphacy,
          size: 25,
        ),
        tabBarTheme: TabBarTheme(
          splashFactory: NoSplash.splashFactory,
          overlayColor:
              MaterialStateColor.resolveWith((states) => Colors.transparent),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            enableFeedback: true,
            foregroundColor: MaterialStateColor.resolveWith(
                (states) => AppColors.primaryColorMain),
            splashFactory: NoSplash.splashFactory,
            elevation: MaterialStateProperty.all(0),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            minimumSize: MaterialStateProperty.all(
              const Size(180, 50),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            enableFeedback: true,
            foregroundColor: MaterialStateColor.resolveWith(
                (states) => AppColors.primaryColorMain),
            splashFactory: NoSplash.splashFactory,
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            side: MaterialStateProperty.all(
              const BorderSide(color: AppColors.primaryColorMain),
            ),
            minimumSize: MaterialStateProperty.all(
              const Size(180, 50),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            enableFeedback: true,
            foregroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white),
            splashFactory: NoSplash.splashFactory,
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            minimumSize: MaterialStateProperty.all(
              const Size(180, 50),
            ),
          ),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      );

  ThemeData get darkTheme => mainTheme.copyWith(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.backgroundDark,
        cardColor: AppColors.primaryColorSecondary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColorMain,
          secondary: AppColors.primaryColorMain,
          primary: AppColors.primaryColorMain,
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: AppColors.backgroundWhite,
            size: 25,
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
          ),
          bodySmall: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 10,
          ),
          bodyMedium: GoogleFonts.poppins(
            color: Colors.white,
          ),
          titleMedium: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          titleLarge: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.backgroundDarkCard,
          selectedItemColor: AppColors.backgroundDark,
        ),
        iconTheme: mainTheme.iconTheme.copyWith(
          color: AppColors.textColorLowEmphacy,
        ),
      );

  ThemeData getTheme() {
    switch (type) {
      case ThemeType.light:
        return mainTheme;
      case ThemeType.dark:
        return darkTheme;
      default:
        return mainTheme;
    }
  }
}
