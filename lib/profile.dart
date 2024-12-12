import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.blue ,
      ),
      body: Center(child: Text("Profile",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold),)),
    );
  }
}
