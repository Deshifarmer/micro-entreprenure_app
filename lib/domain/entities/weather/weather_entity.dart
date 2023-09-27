/*

{
    "coord": {
        "lon": 10.99,
        "lat": 44.34
    },
    "weather": [
        {
            "id": 800,
            "main": "Clear",
            "description": "clear sky",
            "icon": "01n"
        }
    ],
    "base": "stations",
    "main": {
        "temp": 284.36,
        "feels_like": 283.91,
        "temp_min": 282.18,
        "temp_max": 287.06,
        "pressure": 1021,
        "humidity": 91,
        "sea_level": 1021,
        "grnd_level": 935
    },
    "visibility": 10000,
    "wind": {
        "speed": 1.88,
        "deg": 282,
        "gust": 1.96
    },
    "clouds": {
        "all": 5
    },
    "dt": 1695790196,
    "sys": {
        "type": 2,
        "id": 2044440,
        "country": "IT",
        "sunrise": 1695791302,
        "sunset": 1695834357
    },
    "timezone": 7200,
    "id": 3163858,
    "name": "Zocca",
    "cod": 200
}

*/
import 'package:deshifarmer/domain/entities/weather/clouds_weather.dart';
import 'package:deshifarmer/domain/entities/weather/coord_weather.dart';
import 'package:deshifarmer/domain/entities/weather/main_weather.dart';
import 'package:deshifarmer/domain/entities/weather/sys_weather.dart';
import 'package:deshifarmer/domain/entities/weather/weather_weather.dart';
import 'package:deshifarmer/domain/entities/weather/wind_weather.dart';
import 'package:json_annotation/json_annotation.dart';
part 'weather_entity.g.dart';

@JsonSerializable()
class WeatherEntity {
  const WeatherEntity({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });
  factory WeatherEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherEntityFromJson(json);

  final Coord coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;
}
