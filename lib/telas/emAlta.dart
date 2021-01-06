import 'package:flutter/material.dart';

class emAlta extends StatefulWidget {
  @override
  _emAltaState createState() => _emAltaState();
}

class _emAltaState extends State<emAlta> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text('Em alta',
            style: TextStyle(fontSize: 25),)),
    );
  }
}
