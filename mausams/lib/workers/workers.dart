import 'dart:convert';

import 'package:http/http.dart' as http;

class Worker {
  Worker({required this.location});
  String city = "Indor";
  String location = "";
  String temp = "";
  String humidity = "";
  String airSpeed = "";
  String description = "";
  String main = "";
  String icon = "";

  Future<void> getData() async {
    try {
      final response = await http.get(
        Uri.parse(
          "https://api.weatherapi.com/v1/current.json?key=157eff816c1c499db9c144023262001&q=$location",
        ),
      );

      final Map<String, dynamic> data = jsonDecode(response.body);
      location = data["location"]["name"].toString();
      temp = data["current"]["temp_c"].toString();
      print(data);

      humidity = data["current"]["humidity"].toString();
      airSpeed = data["current"]["wind_kph"].toString();
      description = data["current"]["condition"]["text"].toString();
      main = data["current"]["condition"]["text"].toString();
      icon = "https:${data["current"]["condition"]["icon"]}";

      print('Location:$location');
      print("Temp: $temp °C");
      print("Humidity:$humidity");

      print("Wind Speed: $airSpeed kph");
      print("Description: $description");
    } catch (e) {
      location = "Na";
      temp = "Na";

      humidity = "Na";
      airSpeed = "Na";
      description = "Na";
      main = "Na";
      icon = "Na";
    }
  }
}
