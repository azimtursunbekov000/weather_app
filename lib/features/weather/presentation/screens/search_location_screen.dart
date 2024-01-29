import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/features/weather/domain/use_cases/weather_use_case.dart';
import 'package:weather_app/features/weather/presentation/logic/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/screens/weather_info_screen.dart';

class SearchLocationScreen extends StatelessWidget {
  const SearchLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherBloc weatherBloc = WeatherBloc(
      weatherUseCase: WeatherUseCase(
        weatherRepository: WeatherRepositoryImpl(),
      ),
    );
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff48319D),
      body: Container(
        alignment: Alignment.topCenter,
        width: 400,
        decoration: BoxDecoration(
          color: Color(0xff48319D),
          image: DecorationImage(
              image: AssetImage("assets/icons/bacgroundImage.png"),
              fit: BoxFit.cover),
        ),
        child: ListView(
          children: [
            BlocListener<WeatherBloc, WeatherState>(
              bloc: weatherBloc,
              listener: (context, state) {
                if (state is WeatherLoadedState) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeatherInfoScreen(
                        weatherModel: state.weatherModel,
                      ),
                    ),
                  );
                }
                if (state is WeatherErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error.message.toString())));
                }
              },
              child: SizedBox(height: 200),
            ),
            Container(
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/icons/House.png'),
                    fit: BoxFit.fill),
              ),
            ),
            Container(
              // width: 200,
              height: 300,
              decoration: BoxDecoration(
                color: Color(0XFF48319D),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    spreadRadius: 2,
                    color: Color(0xff7B61FF),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'введите город',
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.clear();
                          },
                          icon: Icon(Icons.clear),
                        ),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      controller: controller,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        weatherBloc.add(
                          GetWeatherInfoEvent(
                            location: controller.text,
                          ),
                        );
                      },
                      child: Text(
                        "Поиск",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
