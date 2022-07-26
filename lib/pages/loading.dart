import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../models/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String currentTime = 'Loading';

  void setupWorldTime() async {
    WorldTime worldTimeClassInstance = WorldTime(
      location: 'Kolkata',
      flag: 'india.png',
      apiUrl: 'Asia/Kolkata',
    );
    await worldTimeClassInstance.getTime();
    // print(worldTimeClassInstance.time);
    // setState(() {
    //   currentTime = worldTimeClassInstance.time;
    // });
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTimeClassInstance.location,
      'flag': worldTimeClassInstance.flag,
      'time': worldTimeClassInstance.time,
      'isDayTime': worldTimeClassInstance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: const Center(
          child: SpinKitFoldingCube(
            color: Colors.white,
            size: 80,
          ),
        ));
  }
}
