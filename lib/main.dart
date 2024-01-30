import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/screens/search_location_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // localizationsDelegates: const [
      //       S.delegate,
      //       GlobalMaterialLocalizations.delegate,
      //       GlobalWidgetsLocalizations.delegate,
      //       GlobalCupertinoLocalizations.delegate,
      //     ],
      //     locale: const Locale('ru'),
      //     supportedLocales: S.delegate.supportedLocales,

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SearchLocationScreen(),
    );
  }
}
