part of 'home_bloc.dart';

class HomeState {
  final bool isLoading;
  final WeatherModel? weatherModel;
  final String? errorMsg;
  final String backgroundImg;
  final bool isNoNetwork;
  final LocationEnum locationEnum;
  bool get isDataReady => weatherModel != null && !isLoading;

  HomeState({this.isLoading = false, this.weatherModel, this.errorMsg, required this.backgroundImg, this.isNoNetwork = false, this.locationEnum = LocationEnum.london});

  HomeState copyWith({bool isLoading = false, WeatherModel? weatherModel, String? errorMsg, String? backgroundImg, bool? isNoNetwork, LocationEnum? locationEnum})
    => HomeState(
      isLoading: isLoading,
      weatherModel: weatherModel ?? this.weatherModel,
      errorMsg:  errorMsg,
      backgroundImg: backgroundImg ?? this.backgroundImg,
      isNoNetwork: isNoNetwork ?? false,
      locationEnum: locationEnum ?? this.locationEnum,
    );

  @override
  String toString() {
    return 'HomeState{isLoading: $isLoading, weatherModel: $weatherModel, errorMsg: $errorMsg, backgroundImg: $backgroundImg, isNoNetwork: $isNoNetwork, locationEnum: $locationEnum}';
  }


}