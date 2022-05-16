import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  // void getData() async{
  //   // simulate a network request for a username
  //   String username = await Future.delayed(Duration(seconds: 3),(){
  //     print('avii');
  //     return 'avii';
  //   });
  //
  //   // simulate a network request for a biodata of the username
  //   String bio = await Future.delayed(Duration(seconds: 2),(){
  //     print('guitarist, coder, intelligent');
  //     return 'guitarist, coder, intelligent';
  //   });
  //
  //   print('$username - $bio');
  // }

  int count =0;

  @override
  void initState() {
    super.initState();
    print('initState function ran');
    // getData();
    print('hey there');
  }

  @override
  Widget build(BuildContext context) {
    print('Build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: Text('counter is $count'),
          )
        ],
      )
    );
  }
}