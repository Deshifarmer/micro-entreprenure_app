import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

const String dummyImage =
    'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png';

bool checkDomain(String domain) {
  return domain.contains('192');
}

SizedBox widgetHeight(double h) =>
    SizedBox(height: getProportionateScreenHeight(h));
SizedBox widgetWeight(double w) =>
    SizedBox(width: getProportionateScreenWidth(w));

///! soil types
List<String> soilTypes = [
  'Sandy soil( বেলে মাটি)',
  'Loamy soil(দোআঁশ মাটি)',
  'Clay soil(কাঁদা মাটি)',
  'Alluvial soil(পলি মাটি)',
];

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  final screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  final screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}

///! HACK: Font sizes
const double normalFont = 14;
const double titleFont = 16;
const double titleFontLarge = 18;
const double smallFont = 12;
const double smallFont2 = 10;
const double smallest = 8;

///! PERF border radiusssssssssssssssssssssss
const double uiBorderRadius = 6;

///! PREF height 10

SizedBox height10 = SizedBox(
  height: getProportionateScreenHeight(10),
);

///? server or local
enum ServerOrLocal {
  server,
  local,
}
