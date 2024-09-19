/// ERICKA GONZALEZ ROMERO #5

import 'package:flutter/material.dart';
import 'package:examen1egr/lib/utils/constans.dart';

class MoreInfo extends StatefulWidget {
  const MoreInfo({super.key});
  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  List<List<Widget>> matrizRecuadros = [[]];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: botones,
                ),
                onPressed: agregaRecuadro,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add, color: Colors.white),
                    Text(
                      'Agregar',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: matrizRecuadros.map((recuadros) => Row(
                  children: recuadros,
                )).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
