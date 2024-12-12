import 'package:flutter/material.dart';

class Bell extends StatefulWidget {
  const Bell({super.key});

  @override
  State<Bell> createState() => _BellState();
}

class _BellState extends State<Bell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar:AppBar(
      backgroundColor:Colors.blue ,
    ),
      body: Center(child: Text("Notification",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold),)),
    );
  }
}
