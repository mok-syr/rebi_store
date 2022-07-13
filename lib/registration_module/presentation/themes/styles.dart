import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

ThemeData theme(BuildContext context) => ThemeData(
      textTheme: GoogleFonts.lemonadaTextTheme(
        Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
              displayColor: Colors.black38,
              fontSizeFactor: 0.7,
            ),
      ),
      brightness: Brightness.light,
      primarySwatch: Colors.deepPurple,
    );

ThemeData darkTheme(BuildContext context) => ThemeData(
      textTheme: GoogleFonts.lemonadaTextTheme(
        Theme.of(context).textTheme.apply(
              bodyColor: Colors.white ,
              displayColor: Colors.white38 ,
              fontSizeFactor: 0.7,
            ),
      ),
      brightness:Brightness.dark,
      primarySwatch: Colors.deepPurple,
    );

TextStyle mainStyle = GoogleFonts.lemonada();


TextStyle titleStyle = mainStyle.copyWith(
  fontSize: 30.0,
  color: mainTextColor,
  fontWeight: FontWeight.w800,
);

TextStyle buttonTextStyle = mainStyle.copyWith(
  fontSize: 16.0,
  fontWeight: FontWeight.w400,
  color: const Color(0xFF282828),
);

TextStyle titleTextStyle = mainStyle.copyWith(
  fontSize: 24.0,
  fontWeight: FontWeight.w500,
  color: const Color(0xFF282828),
);

TextStyle inputHintStyle({Color color = textColor1}) => mainStyle.copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: color,
    );
