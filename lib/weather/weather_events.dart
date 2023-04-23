abstract class WeatherEvent {}

class WeatherLoadingEvent extends WeatherEvent {}

class WeatherSuccessEvent extends WeatherEvent {}

class WeatherFailureEvent extends WeatherEvent {}
