import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar:AppBar(
      backgroundColor:Colors.blue ,
    ),
      body: Center(child: Text("Search",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold),)),
    );
  }
}
