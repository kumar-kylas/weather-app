import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/internet/internet_bloc.dart';
import 'package:weather_app/internet/internet_states.dart';

const TextStyle myTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.indigo,
  fontFamily: 'Code New Roman NF',
);

class ShowInternet extends StatelessWidget {
  const ShowInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetBloc, InternetState>(
      key: const Key('internet_bloc_builder'),
      builder: (context, state) {
        if (state is InternetConnectedState) {
          return Column(
            children: [
              RichText(
                text: TextSpan(
                  style: myTextStyle,
                  children: [
                    TextSpan(
                        style: myTextStyle,
                        text: 'Connected to ${state.connectionType}'),
                    const WidgetSpan(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(
                          Icons.check_box,
                          color: Colors.green,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/weather');
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.orange),
                  textStyle: MaterialStatePropertyAll(
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                child: const Text(
                  'View Weather',
                ),
              )
            ],
          );
        }
        if (state is InternetDisconnectedState) {
          return RichText(
            text: const TextSpan(
              style: myTextStyle,
              children: [
                TextSpan(style: myTextStyle, text: 'No Internet'),
                WidgetSpan(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(
                      Icons.close_rounded,
                      color: Colors.red,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return RichText(
          text: const TextSpan(
            style: myTextStyle,
            children: [
              TextSpan(style: myTextStyle, text: 'Unknown Internet Status'),
              WidgetSpan(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    Icons.question_mark_rounded,
                    color: Colors.blue,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
