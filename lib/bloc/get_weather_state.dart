part of 'get_weather_bloc.dart';

class GetWeatherState {
  final LoadingStatus status;
  final List<BaseModel> baseModel;

  GetWeatherState({required this.status, required this.baseModel});

  GetWeatherState copyWith(
      {LoadingStatus? status, List<BaseModel>? baseModel}) {
    return GetWeatherState(
        status: status ?? this.status, baseModel: baseModel ?? this.baseModel);
  }
}
