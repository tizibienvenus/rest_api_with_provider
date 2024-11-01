import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest_api_with_provider/config/constants/constants.dart';


ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: kGrey100),
    textTheme: TextTheme(
      displayLarge: Theme.of(context).textTheme.displayLarge!.copyWith(
        fontFamily: 'Montserrat',

      ),
      displayMedium: Theme.of(context).textTheme.displayMedium!.copyWith(
        fontFamily: 'Montserrat',

      ),
      displaySmall: Theme.of(context).textTheme.displaySmall!.copyWith(
        fontFamily: 'Montserrat',

      ),

      headlineLarge: Theme.of(context).textTheme.headlineLarge!.copyWith(
        fontFamily: 'Montserrat',

      ),
      headlineMedium: Theme.of(context).textTheme.headlineMedium!.copyWith(
        fontFamily: 'Montserrat',

      ),
      headlineSmall: Theme.of(context).textTheme.headlineSmall!.copyWith(
        fontFamily: 'Montserrat',

      ),

      bodyLarge: Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: 'Montserrat',

      ),
      bodyMedium: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontFamily: 'Montserrat',

      ),
      bodySmall: Theme.of(context).textTheme.bodySmall!.copyWith(
        fontFamily: 'Montserrat',

      ),

      labelLarge: Theme.of(context).textTheme.labelLarge!.copyWith(
        fontFamily: 'Montserrat',

      ),
      labelMedium: Theme.of(context).textTheme.labelMedium!.copyWith(
        fontFamily: 'Montserrat',

      ),
      labelSmall: Theme.of(context).textTheme.labelSmall!.copyWith(
        fontFamily: 'Montserrat',

      ),

      titleLarge: Theme.of(context).textTheme.titleLarge!.copyWith(
        fontFamily: 'Montserrat',

      ),
      titleMedium: Theme.of(context).textTheme.titleMedium!.copyWith(
        fontFamily: 'Montserrat',

      ),
      titleSmall: Theme.of(context).textTheme.titleSmall!.copyWith(
        fontFamily: 'Montserrat',

      ),
    ),
   /* textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorLightTheme),*/
    colorScheme: const ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: kContentColorLightTheme.withOpacity(0.7),
      unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFF7F7F7),//F6F6F6 0xFFF8F8F9
      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: kDefaultPadding / 2.2),
      hintStyle: TextStyle(
        color: Color(0xFFB8B5C3),
      ),
      border: defaultOutlineInputBorder,
      enabledBorder: defaultOutlineInputBorder,
      focusedBorder: defaultOutlineInputBorder,
      prefixIconColor: kGrey100
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        minimumSize: const Size(double.infinity, 40),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.black.withOpacity(0),
        minimumSize: const Size(double.infinity, 40),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        side: BorderSide(
          width: 1,
          color: kBackColor.withOpacity(1)
        )
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: kTransparentColor,
        hoverColor: kTransparentColor
      )
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        foregroundColor: kWhiteColor,
        minimumSize: const Size(double.infinity, 40),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: kWhiteColor,
      foregroundColor: kPrimaryColor,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      elevation: 0.15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50)
      ),
    ),
    toggleButtonsTheme: const ToggleButtonsThemeData(
      selectedColor: Colors.white,
      //tapTargetSize: MaterialTapTargetSize.padded,
      color: Colors.black,
      fillColor: kPrimaryColor,
      //renderBorder: false,
      focusColor: kPrimaryColor,
      hoverColor: kPrimaryColor,
      disabledColor: kPrimaryColor,
      splashColor: kPrimaryColor,
      highlightColor: kPrimaryColor,
    ),
    dividerTheme: const DividerThemeData(
      color: kBackColor,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
        color: kSecondaryColor.withOpacity(0.2),
        //linearTrackColor: kPrimaryColor.withOpacity(0.2),
        //circularTrackColor: kSecondaryColor,
    ),
  );
}

// Definition de notre theme sombre
ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kContentColorLightTheme,  //kContentColorLightTheme,
    appBarTheme: appBarTheme.copyWith(backgroundColor: kContentColorLightTheme,),//kContentColorLightTheme),
    iconTheme: const IconThemeData(color: kContentColorDarkTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
      .apply(bodyColor: kWhiteColor),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kContentColorLightTheme,
      selectedItemColor: Colors.white70,
      unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: kSecondDark,
      contentPadding: EdgeInsets.symmetric(horizontal: elementSpacing, vertical: kDefaultPadding / 2.2),
      hintStyle: TextStyle(
        color: Color(0xFFB8B5C3),
      ),
      border: defaultOutlineInputBorder,
      enabledBorder: defaultOutlineInputBorder,
      focusedBorder: defaultOutlineInputBorder,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        minimumSize: const Size(double.infinity, 40),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.black.withOpacity(0),
        overlayColor: kTransparentColor,
        minimumSize: const Size(double.infinity, 40),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(80)),
        ),
        side: const BorderSide(
          color: kSecondDark,
          width: 1,
        )
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        foregroundColor: kWhiteColor,
        overlayColor: kTransparentColor,
        surfaceTintColor: kTransparentColor,
        shadowColor: kTransparentColor,
        minimumSize: const Size(double.infinity, 40),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(80)),
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: kPrimaryColor,
      foregroundColor: kWhiteColor,
      hoverColor: kTransparentColor,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      elevation: 0.15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50)
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: kTransparentColor,
        overlayColor: kTransparentColor,
        surfaceTintColor: kTransparentColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(80)),
        ),
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: kSecondaryColor,
      linearTrackColor: kPrimaryColor.withOpacity(0.2),
      circularTrackColor: kSecondaryColor
    ),
    dividerTheme: const DividerThemeData(
      color: kSecondDark,
    )
  );
}

const appBarTheme = AppBarTheme(centerTitle: false, elevation: 0, surfaceTintColor: null);