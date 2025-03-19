import 'package:weather_app/core/constants/asset_res.dart';

extension IntAssetExtension on int {
  String getCustomIcon() {
    switch (this) {
      case 1000: // Clear sky
        return AssetRes.icSun;
      case 1003: // Partly cloudy
        return AssetRes.icPartlyCloudy;
      case 1006: // Cloudy
      case 1009: // Overcast
        return AssetRes.cloud;
      case 1030: // Mist
      case 1135: // Fog
        return AssetRes.icFoggy;
      case 1063: // rain and sun
        return AssetRes.icSunCloudRain;
      case 1183: // Light rain
        return AssetRes.icRainy;
      case 1186: // Moderate rain
        return AssetRes.icModerateRain;
      case 1189: // Heavy rain
        return AssetRes.icHeavyRain;
      case 1210: // Light snow
      case 1213: // Moderate snow
        return AssetRes.icModerateSnow;
      case 1216: // Heavy snow
        return AssetRes.icHeavySnow;
      case 1273: // Thunderstorm with rain
        return AssetRes.icThunderstormWithRain;
      case 1276: // Thunderstorm
        return AssetRes.icThunderstorm;
      default:
        return AssetRes.icPartlyCloudy; // Default icon
    }
  }
}
