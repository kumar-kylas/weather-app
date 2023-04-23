import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:weather_app/weather/weather_events.dart';
import 'package:weather_app/weather/weather_states.dart';

import 'weather_response_model.dart';

String baseUrl = dotenv.get('BASE_URL', fallback: '');
String apiKey = dotenv.get('API_KEY', fallback: '');

String placeName = 'Pune';
String requestUrl = '$baseUrl/weather?q=$placeName&APPID=$apiKey&units=metric';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherResponse? _result;
  String? _errMsg;

  void getWeather() async {
    print('baseUrl $baseUrl');
    print('apiKey $apiKey');
    print('Making new GET request');
    Response response = await get(Uri.parse(requestUrl));
    if (response.statusCode == 200) {
      _result = WeatherResponse.fromJson(jsonDecode(response.body));
      add(WeatherSuccessEvent());
    } else {
      _errMsg = 'Error: ${response.statusCode}\n${response.reasonPhrase}';
      print(_errMsg);
      add(WeatherFailureEvent());
    }
  }

  WeatherBloc() : super(WeatherLoadingState()) {
    on<WeatherSuccessEvent>(
      (event, emit) => emit(WeatherSuccessState(_result!)),
    );
    on<WeatherFailureEvent>(
      (event, emit) => emit(WeatherErrorState(_errMsg!)),
    );
    getWeather();
  }
}
