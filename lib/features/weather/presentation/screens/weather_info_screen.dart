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
      case 'light snow':
      case 'snow':
        return 'assets/animations/show.json';
      case 'clear':
        return 'assets/animations/clear_weather.json';

      case 'overcast clouds':
        return 'assets/animations/overcast_clouds.json';

      default:
        return 'assets/animations/clear_weather.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    double fahrenheitTemperature = widget.weatherModel.main?.temp ?? 0;
    double celsiusTemperature = (fahrenheitTemperature - 273.13);
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${widget.weatherModel.name}",
              style: TextStyle(color: Colors.white),
            ),
            Lottie.asset(
              getWeatherAnimation(widget.weatherModel.weather?.first.main),
              width: 300,
              height: 300,
            ),
            Text(
              "${celsiusTemperature.round()} °C",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
