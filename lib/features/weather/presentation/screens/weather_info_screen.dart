import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';

class WeatherInfoScreen extends StatelessWidget {
  final WeatherModel weatherModel;
  const WeatherInfoScreen({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Card(
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}
