import 'package:flutter/material.dart';

class ContextSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) => [];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.close),
        onPressed: () => Navigator.of(context).pop(),
      );

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Text('Suggestion');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> list = List();

    if (query.isNotEmpty) {
      list = ["zangado games","Android", "IOS desenvolvimento", "Grupo de apoio"].where(
          (element) => element.toLowerCase().startsWith(query.toLowerCase())).toList();
          return ListView.builder(
            
            itemCount:list.length ,
            itemBuilder: (context,indice){
              return ListTile(
                onTap: (){
                
                  close(context, list[indice]);
                
                },
                title: Text(list[indice]),
              );
            }
            );

    } else {
    return  Center(
        child: Text("Nenhum Resultado Encontrado!"),
      );
    }
  }
}
