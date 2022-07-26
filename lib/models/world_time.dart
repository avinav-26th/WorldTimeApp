import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location = ''; //location name for the UI
  String time = ''; //this is the time in that location
  String flag = ''; //url to an asset flag icon
  String apiUrl = ''; //this is the location url for the api endpoint
  late bool isDayTime; //to check that currently it is day-time or night-time

  WorldTime({required this.location, required this.flag, required this.apiUrl});

  // void getData() async {
  //   Response response =
  //       await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  //   Map data = jsonDecode(response.body);
  //   print(data);
  //   print(data['title']);
  // }

  Future<void> getTime() async {
    try {
      //first we make the request
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$apiUrl'));
      Map data = jsonDecode(response.body);
      // print(data);

      //get properties from data
      String dateTime = data['datetime'];
      String offSetHours = data['utc_offset'].substring(1, 3),
          offSetMinutes = data['utc_offset'].substring(4, 6);
      // print(dateTime + '---' + offSet);

      //create a datetime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(
          hours: int.parse(offSetHours), minutes: int.parse(offSetMinutes)));
      // print(now);

      isDayTime = now.hour > 5 && now.hour < 19;

      //setting the time property
      time = DateFormat.jm().format(now);
    } catch (e) {
      if (kDebugMode) {
        print('caught error: $e');
      }
      time = 'Could not get time data';
    }
  }
}
