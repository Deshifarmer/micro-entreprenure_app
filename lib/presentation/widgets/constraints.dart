import 'dart:math';

import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

const String dummyImage =
    'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png';

bool checkDomain(String domain) {
  return domain.contains('192');
}

const List<String> units = <String>[
  'KG',
  'Ton',
  'Mon',
  'PSC',
  'Ati',
  'Palla',
];
SizedBox widgetHeight(double h) =>
    SizedBox(height: getProportionateScreenHeight(h));
SizedBox widgetWeight(double w) =>
    SizedBox(width: getProportionateScreenWidth(w));

///! soil types
List<String> soilTypes = [
  '----------',
  'Sandy soil( বেলে মাটি)',
  'Loamy soil(দোআঁশ মাটি)',
  'Clay soil(কাঁদা মাটি)',
  'Alluvial soil(পলি মাটি)',
];

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

/// get random color
Color getRandomColor() {
  final _random = Random();
  return Color.fromARGB(
    255,
    _random.nextInt(256),
    _random.nextInt(256),
    _random.nextInt(256),
  );
}
