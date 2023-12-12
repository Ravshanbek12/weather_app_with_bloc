part of 'get_weather_bloc.dart';

@immutable
sealed class GetWeatherEvent {}



class GetFullWeather extends GetWeatherEvent{
final Function() onSuccess;
final Function(String errorMessage) onFailure;

  GetFullWeather({required this.onSuccess, required this.onFailure});



}

