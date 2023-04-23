// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/internet/internet_bloc.dart';
import 'package:weather_app/internet/internet_events.dart';
import 'package:weather_app/internet/internet_states.dart';
import 'package:weather_app/internet/show_internet.dart';
import 'package:weather_app/route_generator.dart';
import 'package:weather_app/weather/weather_bloc.dart';
import 'package:weather_app/weather/weather_events.dart';
import 'package:weather_app/weather/weather_states.dart';

class MockInternetBloc extends MockBloc<InternetEvent, InternetState>
    implements InternetBloc {}

class MockWeatherBloc extends MockBloc<WeatherEvent, WeatherState>
    implements WeatherBloc {}

Future pumper(WidgetTester wt) async {
  await wt.pumpWidget(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => internetBloc),
        BlocProvider(create: (_) => weatherBloc),
      ],
      child: const MaterialApp(
        home: ShowInternet(),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    ),
  );
  await wt.pump();
}

late InternetBloc internetBloc;
late WeatherBloc weatherBloc;

void main() {
  setUpAll(
    () {
      internetBloc = MockInternetBloc();
      weatherBloc = MockWeatherBloc();
    },
  );

  setUp(
    () {
      internetBloc = MockInternetBloc();
      when(() => internetBloc.state).thenReturn(
        InternetConnectedState(ConnectivityResult.wifi),
      );
    },
  );

  testWidgets('My tests', (WidgetTester tester) async {
    when(() => internetBloc.state).thenReturn(
      InternetConnectedState(ConnectivityResult.wifi),
    );

    when(() => weatherBloc.state).thenReturn(
      WeatherSuccessState(WeatherResponse()),
    );

    // Build our app and trigger a frame.
    await pumper(tester);

    expect(
      find.byKey(
        const Key('internet_bloc_builder'),
      ),
      findsOneWidget,
    );

    expect(
      find.byType(ElevatedButton),
      findsOneWidget,
    );

    expect(find.text('View Weather'), findsOneWidget);

    await tester.tap(
      find.byType(ElevatedButton),
    );
    await tester.pumpAndSettle();

    expect(
      find.byType(WeatherPage),
      findsOneWidget,
    );
  });
}
