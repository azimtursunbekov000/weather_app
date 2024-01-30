import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';

class WeatherInfoScreen extends StatefulWidget {
  final WeatherModel weatherModel;
  const WeatherInfoScreen({super.key, required this.weatherModel});

  @override
  State<WeatherInfoScreen> createState() => _WeatherInfoScreenState();
}

class _WeatherInfoScreenState extends State<WeatherInfoScreen> {
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/animation/clear_weather.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/animations/cloudy_weather.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/animations/show.json';
      case 'clear':
        return 'assets/animations/clear.json';

      default:
        return 'assets/animations/clear.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    double fahrenheitTemperature = widget.weatherModel.main?.temp ?? 0;
    double celsiusTemperature = (fahrenheitTemperature - 32) * 5 / 9;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${widget.weatherModel.name}"),
            Lottie.asset(
              getWeatherAnimation(widget.weatherModel.weather?.first.main),
              width: 300,
              height: 300,
            ),
            Text("${celsiusTemperature.round()} °C"),
          ],
        ),
      ),
    );
  }
}
