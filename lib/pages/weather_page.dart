import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/weather_bloc.dart';
import 'package:weather_app/weather/weather_states.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Page'),
      ),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherSuccessState) {
              return Container(
                padding: const EdgeInsets.all(15),
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.yellow[200],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Weather Info: ',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'Place: ${state.weatherData?.name}'
                      '\nTemperature: ${state.weatherData?.main?.temp}'
                      '\nDescription: ${state.weatherData?.weather?.main}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.indigo,
                        fontFamily: 'Code New Roman NF',
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is WeatherErrorState) {
              return Text('Could not fetch weather.\n${state.errMsg}');
            }
            if (state is WeatherLoadingState) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Loading '),
                  CircularProgressIndicator(),
                ],
              );
            }
            return const SizedBox();
            // return const Text('Unknown WeatherBloc State');
          },
        ),
      ),
    );
  }
}
