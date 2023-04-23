import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/internet/internet_bloc.dart';
import 'package:weather_app/route_generator.dart';
import 'package:weather_app/weather/weather_bloc.dart';

Future<void> main() async {
  // Default filename is .env
  await dotenv.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetBloc>(create: (_) => InternetBloc()),
        BlocProvider<WeatherBloc>(create: (_) => WeatherBloc())
      ],
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          fontFamily: 'Code New Roman NF',
          primarySwatch: Colors.amber,
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
