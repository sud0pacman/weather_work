part of 'home_bloc.dart';


class HomeEvent {}

class GetWeatherEvent extends HomeEvent {
  final LocationEnum locationEnum;

  GetWeatherEvent({this.locationEnum = LocationEnum.london});
}