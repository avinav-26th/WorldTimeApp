import 'package:flutter/material.dart';
import '../models/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  // void getData() async{
  //   // simulate a network request for a username
  //   String username = await Future.delayed(const Duration(seconds: 3),(){
  //     print('avii');
  //     return 'avii';
  //   });
  //
  //   // simulate a network request for a bio-data of the username
  //   String bio = await Future.delayed(const Duration(seconds: 2),(){
  //     print('guitarist, coder, intelligent');
  //     return 'guitarist, coder, intelligent';
  //   });
  //
  //   print('$username - $bio');
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   print('initState function ran');
  //   getData();
  //   print('hey there');
  // }

  List<WorldTime> worldLocations = [
    WorldTime(apiUrl: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(apiUrl: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(apiUrl: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(apiUrl: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(apiUrl: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(apiUrl: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(
        apiUrl: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(apiUrl: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(
        apiUrl: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = worldLocations[index];
    await instance.getTime();

    //now we need to navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('Build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: worldLocations.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            child: Card(
              color: Colors.blue[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${worldLocations[index].flag}'),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      worldLocations[index].location,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
