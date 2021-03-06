import 'package:flutter/material.dart';


class CustomSearchDelegate extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: (){
            query = ''; //LIMPA A PESQUISA
          })
    ] ;
  }

  @override
  Widget buildLeading(BuildContext context) {
    return
      IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            close(context, '');
          });
  }



//FECHA A TELA E PEGA O QUE FOI DIGITADO
  @override
  Widget buildResults(BuildContext context) {
    //print('resultado, a pesquisa está sendo realizada ' );
    close( context, query);
    return Container()  ;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
  //  print('DIGITADO: '+query);
    return Container() ;
  }
  
}