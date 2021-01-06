import 'package:flutter/material.dart';
import 'package:youtube/custom_search_delegate.dart';
import 'package:youtube/telas/biblioteca.dart';
import 'package:youtube/telas/emAlta.dart';
import 'package:youtube/telas/inicio.dart';
import 'package:youtube/telas/inscricao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;
  String resultado = '';
  @override
  Widget build(BuildContext context) {


    List<Widget> telas = [
      Inicio(resultado),
      emAlta(),
      Inscricao(),
      Biblioteca(),

    ];

    return Scaffold(
      appBar: AppBar(

        //cor dos ícones
        iconTheme: IconThemeData(color: Colors.grey),

        backgroundColor: Colors.white,
        title:  Image.asset('images/youtube.png',
          width: 98,
          height: 22,),
        actions: <Widget>[


          /*
          IconButton(
            icon: Icon(Icons.videocam),
              onPressed: (){
                print('Video cam ');
              }),

          IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: (){
                print('Conta ');
              }),*/
          IconButton(
              icon: Icon(Icons.search),
              onPressed: ()async{
                //TENHO O QUE FOI DIGITADO
               String res =  await showSearch(context: context, delegate: CustomSearchDelegate(),
                ) ;

               setState(() {
                 resultado = res;
               });
              }),

        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child:  telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
            setState(() {
                _indiceAtual = indice;
            });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.orange,
                label: 'início' ,
               // backgroundColor: Colors.blue,
                icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                backgroundColor: Colors.red,
                label: 'Em alta' ,
                icon: Icon(Icons.whatshot)),
            BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                label: 'Inscrições' ,
                icon: Icon(Icons.subscriptions)),
            BottomNavigationBarItem(
                backgroundColor: Colors.green,
                label: 'Biblioteca' ,
                icon: Icon(Icons.folder)),
          ],
      ),
    );
  }
}
