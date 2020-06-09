import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  HomeState createState() => HomeState();

}
class HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey
        ),
        title: Image.asset("img/youtube.png",width: 100,height: 50),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.videocam), onPressed: (){print("camera");}),
          IconButton(icon: Icon(Icons.videocam), onPressed: (){print("camera");}),
          IconButton(icon: Icon(Icons.account_circle), onPressed: (){print("conta");})
        ],
      ),
    );
  }

}