import 'package:weather_app/weather/weather_response_model.dart';

abstract class WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  WeatherResponse? weatherData;

  WeatherSuccessState(WeatherResponse respData) {
    weatherData = respData;
  }
}

class WeatherErrorState extends WeatherState {
  String? errMsg;

  WeatherErrorState(String str) {
    errMsg = str;
  }
}
