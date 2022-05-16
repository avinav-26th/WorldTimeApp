import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // this safe area widget is used when we are not  using the app bar at the top and do not want to get some of our content hidden behind the mobile phones app deafult bar
        child: Column(
          children: [
            FlatButton.icon(
                onPressed: (){
                  Navigator.pushNamed(
                    context,
                    '/location'
                  );
                },
                icon: Icon(Icons.edit_location),
                label: Text('Edit Location')
            )
          ],
        ),
      ),
    );
  }
}
