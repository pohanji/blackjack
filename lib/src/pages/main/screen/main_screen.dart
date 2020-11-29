import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(child: Text("BLACKJACK", style: TextStyle(fontSize: 35, color: Colors.white)),),
          SizedBox(height: 30,),
          OutlineButton(child: Text("ZAČÍT HRÁT", style: TextStyle(fontSize: 20)), color: Colors.white),
          OutlineButton(child: Text("PRAVIDLA", style: TextStyle(fontSize: 20)), padding: const EdgeInsets.only(left: 25, right: 25),),
          OutlineButton(child: Text("UKONČIT", style: TextStyle(fontSize: 20)), padding: const EdgeInsets.only(left: 30, right: 30)),
        ],
      )
    );
  }

}

class MainScreenState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }

}