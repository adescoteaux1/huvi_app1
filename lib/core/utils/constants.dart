// constants.dart

import 'dart:async';

import 'package:huvi_app1/core/models/weather_models.dart';
import 'package:huvi_app1/core/services/weather_service.dart';

final _weatherService = WeatherService('2cab5c5e69ebafa5c4a0557e156831a2');
  Weather? _weather;
  late String condition;

late int userID;
int uvIndex = 3;
String uvText = getUvText(uvIndex);
String sunscreen = getSunscreenTime(uvIndex);

String getSunscreenTime(int uvIntex) {
  String text;
  if (uvIndex < 6) {
    text = '2 hours';
  } else if (uvIndex < 8) {
    text = '1 to 2 hours';
  } else if (uvIndex < 11) {
    text = '1 to 1.5 hours';
  } else {
    text = '1 hour or more';
  }
  return text;
}

String getUvText(int uvIndex) {
  String text;
  if (uvIndex < 3) {
    text = 'UV Index $uvIndex means minimal danger from the sun’s UV rays for the average person. Most people can stay in the sun for up to one hour during peak sun (10 am to 4 pm) without burning. However, people with very sensitive skin and infants should always be protected from prolonged sun exposure.';
  } else if (uvIndex < 6) {
    text = 'UV Index $uvIndex means low risk of harm from unprotected sun exposure. Fair-skinned people, however, may burn in less than 20 minutes. Wearing a hat with a wide brim and sunglasses will protect your eyes. Always use a broad-spectrum sunscreen with an SPF of at least 30, and wear long-sleeved shirts when outdoors';
  } else if (uvIndex < 8) {
    text = 'UV Index $uvIndex means moderate risk of harm from unprotected sun exposure. Fair-skinned people, however, may burn in less than 20 minutes. Wearing a hat with a wide brim and sunglasses will protect your eyes. Always use a broad-spectrum sunscreen with an SPF of at least 30 and wear long-sleeved shirts when outdoors. Remember to protect sensitive areas like the nose and the rims of the ears. Sunscreen prevents sunburn and some of the sun’s damaging effects on the immune system. Use a lip balm or lip cream containing a sunscreen.';
  } else if (uvIndex < 11) {
    text = 'UV Index $uvIndex means high risk of harm from unprotected sun exposure. Fair-skinned people may burn in less than 10 minutes. Minimize sun exposure during midday hours of 10 am to 4 pm. Protect yourself by liberally applying a broad-spectrum sunscreen of at least SPF 30. Wear protective clothing and sunglasses to protect the eyes. When outside, seek shade. Don’t forget that water, sand, pavement, and glass reflect UV rays even under a tree, near a building or beneath a shady umbrella. Wear long-sleeved shirts and trousers made from tightly-woven fabrics. UV rays can pass through the holes and spaces of loosely knit fabrics.';
  } else {
    text = 'UV Index of $uvIndex means a very high risk of harm from unprotected sun exposure. Fair skinned people may burn in less than 5 minutes. Outdoor workers and vacationers who can receive very intense sun exposure are especially at risk. Minimize sun exposure during midday hours of 10 am to 4 pm. Apply broad-spectrum SPF 30+ sunscreen every 2 hours, more frequently if you are sweating or swimming. Avoid being in the sun as much as possible and wear sunglasses that block out 99-100% of all UV rays (UVA and UVB). Wear a hat with a wide brim which will block roughly 50% of UV radiation from reaching the eyes.';
  }
  return text;
}


void setUser(id) {
  userID = id;
}


class AppConstants {
  final _weatherService = WeatherService('2cab5c5e69ebafa5c4a0557e156831a2');
  Weather? _weather;
  late var city;
  late var curWeather;
  late String temperature;
  late String condition;
  

  AppConstants() {
    fetchWeather();
    temperature = '${((_weather?.temperature ?? 0) * 9 / 5 + 32).round()}';
    condition = (_weather?.mainCondition ?? '');
    city = _weatherService.getCurrentCity();
    
    
  }

  fetchWeather() async {
      //gett current city
      city = await _weatherService.getCurrentCity();
      curWeather = await _weatherService.getWeather(city);
      print(city);
      //get weather for city
      try {
        
        _weather = curWeather;
      } catch (e) {
        print(e);
      }
    }

}