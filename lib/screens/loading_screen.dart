import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screens/location_screen.dart';
import 'package:flutter_weather_app/services/location.dart';
import 'package:flutter_weather_app/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_weather_app/services/weather.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();

}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.blue,
        ),
      ),
    );
  }
  void getLocationData() async { /// marked async so won't complete this method until await just jumps to the next method
    WeatherModel model = WeatherModel();
    var weatherData = await model.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (builder){
      return LocationScreen(locationWeather: weatherData,);
    }));
  }
}

