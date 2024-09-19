/// ERICKA GONZALEZ ROMERO #5

import 'package:flutter/material.dart';
import 'package:examen1egr/lib/utils/constans.dart' as  con;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List lista;
  @override
  void initState(){
    lista=List.from(con.listaExamen);
    super.initState();
  }
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: con.fondo,
      body: Stack(

      ),
    );
  }
}


