import 'package:flutter/material.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/pages/internet_page.dart';
import 'package:weather_app/pages/page_one.dart';
import 'package:weather_app/pages/page_two.dart';
import 'package:weather_app/pages/weather_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(),
        );

      case '/page-one':
        return MaterialPageRoute(
          builder: (_) => const PageOne(),
        );

      case '/page-two':
        return MaterialPageRoute(
          builder: (_) => const PageTwo(),
        );

      case '/internet':
        return MaterialPageRoute(
          builder: (_) => const InternetPage(),
        );
      case '/weather':
        return MaterialPageRoute(
          builder: (_) => const WeatherPage(),
        );

      // Validation of correct data type
      // if (args is String) {
      //   return MaterialPageRoute(
      //     builder: (_) => WeatherPage(
      //       // data: args,
      //     ),
      //   );
      // }
      // // You can also throw an exception while in development.
      // return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text(
              'Oops, could not locate that page',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ),
        );
      },
    );
  }
}
