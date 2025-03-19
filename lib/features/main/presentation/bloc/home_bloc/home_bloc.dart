import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app/core/constants/asset_res.dart';
import 'package:weather_app/features/main/data/data_source/service/base_client.dart';
import 'package:weather_app/features/main/data/model/weather_model.dart';
import 'package:weather_app/core/enum/locations_enum.dart';

import '../../../../../core/constants/constants.dart';
import '../../../data/data_source/service/api_exceptions.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final InternetConnectionChecker networkChecker =
      InternetConnectionChecker.instance;

  HomeBloc() : super(HomeState(backgroundImg: AssetRes.londonImg)) {
    on<GetWeatherEvent>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          backgroundImg: getBackground(event.locationEnum),
          locationEnum: event.locationEnum,
        ),
      );

      final bool hasNetwork = await networkChecker.hasConnection;

      if (!hasNetwork) {
        emit(state.copyWith(isNoNetwork: true));
        return;
      }

      await BaseClient.safeApiCall(
        Constants.forecastWeatherApiUrl,
        RequestType.get,
        queryParameters: {
          Constants.key: Constants.apiKey,
          Constants.q: event.locationEnum.name,
          Constants.days: 4,
          'aqi': 'no',
          'alerts': 'no',
        },
        onSuccess: (response) {
          WeatherModel weatherModel = WeatherModel.fromJson(response.data);

          emit(state.copyWith(weatherModel: weatherModel));
        },
        onError: (ApiException error) async {
          Constants.logger.e(BaseClient.handleApiError(error));

          emit(state.copyWith(errorMsg: BaseClient.handleApiError(error)));
        },
      );
    });
  }

  String getBackground(LocationEnum location) {
    return switch (location) {
      LocationEnum.london => AssetRes.londonImg,
      LocationEnum.paris => AssetRes.parisImg,
      LocationEnum.makkah => AssetRes.makkah,
      LocationEnum.istanbul => AssetRes.istanbul,
      LocationEnum.tashkent => AssetRes.tashkent,
    };
  }
}
