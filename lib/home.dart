import 'package:flutter/material.dart';
import 'package:youtubefakeapp/telas/EmAlta.dart';
import 'package:youtubefakeapp/telas/Incricao.dart';
import 'package:youtubefakeapp/telas/Inicio.dart';
import 'package:youtubefakeapp/telas/Pasta.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _bottomIconActive = 0;
  @override
  Widget build(BuildContext context) {
    //adicionado as telas
    List<Widget> telas = [
      Inicio(),
      EmAlta(),
      Inscricao(),
      Pasta(),
    ];
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Image.asset("img/youtube.png", width: 100, height: 50),
        actions: <Widget>[
          Text("Fake",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold
          ),
          ),
          IconButton(
              icon: Icon(Icons.videocam),
              onPressed: () {
                print("camera");
              }),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("pesquisa");
              }),
          IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                print("conta");
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_bottomIconActive],
      ),
      //barra de nevegação
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // type: BottomNavigationBarType.shifting, //usado com backgroundColor
          onTap: (int index) {
            // index capturado

            setState(() {
              print(index);
              _bottomIconActive = index;
            });
          },
          fixedColor: Colors.red, //cor fixo do icone
          currentIndex: _bottomIconActive,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("home"),
              //  backgroundColor: Colors.red[300]
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.whatshot),
              title: Text("Em Alta"),
              //   backgroundColor: Colors.green
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions),
              title: Text("Incrições"),
              //   backgroundColor: Colors.black
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder),
              title: Text("Biblioteca"),
              //   backgroundColor: Colors.orange
            )
          ]),
    );
  }
}
