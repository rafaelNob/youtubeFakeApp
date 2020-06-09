import 'package:flutter/material.dart';
import 'package:youtubefakeapp/api.dart';

class Inicio extends StatefulWidget {
  @override
 InicioState createState() => InicioState();
}
class InicioState extends State<Inicio>{
  @override
  Widget build(BuildContext context) {
    Api a = Api();
    a.pesquisar("");
     return Container(
      child: Center(
        child: Text("Inicio"),
      ),
    );
  }
 
}