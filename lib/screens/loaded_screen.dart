import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:weathernow/data_service/api/api.dart';
import 'package:weathernow/screens/search_screen.dart';

import 'home_screen.dart';

class LoadedScreen extends StatefulWidget {
  const LoadedScreen({Key? key}) : super(key: key);

  @override
  _LoadedScreenState createState() => _LoadedScreenState();
}

class _LoadedScreenState extends State<LoadedScreen> {
  @override
  void initState() {
    Api.getLocationNow(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final style= ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.black54),
    );
    return  SafeArea(
      child: Scaffold(
        body: ElevatedButton(
          style: style ,
          child:  const SpinKitSpinningLines(
            color: Colors.white,
            size: 100,
          ),
          onPressed:(){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoadedScreen(),
              ),
            );
            },
        ),
      ),
    );
  }
}
