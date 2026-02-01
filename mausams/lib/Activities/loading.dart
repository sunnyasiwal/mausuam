import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mausam/workers/workers.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String city = "Indore";

  String? temp;
  String? humidity;
  String? airSpeed;
  String? description;
  String? main;
  String? icon;

  void startApp() async {
    Worker instance = Worker(location: city);
    await instance.getData();

    temp = instance.temp;
    humidity = instance.humidity;
    airSpeed = instance.airSpeed;
    description = instance.description;
    main = instance.main;
    icon = instance.icon;

    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        "temp_value": temp,
        "hum_value": humidity,
        "airSpeed_value": airSpeed,
        "des_value": description,
        "main_value": main,
        "icon_value": icon,
        "city_value": city,
      },
    );
  }

  @override
  void initState() {
    super.initState();

    // ✅ READ SEARCHED CITY HERE
    Future.microtask(() {
      final args = ModalRoute.of(context)?.settings.arguments as Map?;

      if (args != null &&
          args['searchText'] != null &&
          args['searchText'].toString().isNotEmpty) {
        city = args['searchText'];
      }

      startApp(); // ✅ CALL ONCE
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(image: AssetImage("clouds.jpeg")),
              SizedBox(height: 10),
              Text("Mausum App", style: TextStyle(color: Colors.white)),
              SizedBox(height: 10),
              Text("Created by sunny", style: TextStyle(color: Colors.white)),
              SpinKitSpinningLines(color: Colors.black, size: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
