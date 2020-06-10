import 'package:flutter/material.dart';
import 'package:youtubefakeapp/api.dart';
import 'package:youtubefakeapp/model/Video.dart';

class Inicio extends StatefulWidget {

  String res;
  Inicio(this.res);
  @override
  InicioState createState() => InicioState();
}

class InicioState extends State<Inicio> {
  Api a = Api();

  listarVideos(String pesquisa) {
    return a.pesquisar(pesquisa);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
        future: listarVideos(widget.res),

        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                // ListView.separated separa por linha
                return ListView.separated(
                    itemBuilder: (context, indice) {
                      //converte na lista de videos
                List<Video> videos = snapshot.data;
                
                Video video = videos[indice];
                      return Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            //adicionando a imagem via url 
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(video.imagem),
                              fit: BoxFit.cover
                              
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(video.titulo),
                            subtitle: Text(video.canal),
                          )
                        ],
                        
                      );
                    },
                    //define cor e tamanho das linhas
                    separatorBuilder: (context, indice) => Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                    itemCount: snapshot.data.length);
              } else {
                return Center(
                  child: Text("Nenhum dado a ser Exibido!"),
                );
              }
              break;
          }
        });
  }
}
