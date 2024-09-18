import 'package:examen1egr/home.dart';
import 'package:examen1egr/more_info.dart';
import 'package:flutter/material.dart';
import 'package:examen1egr/lib/utils/constans.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usuario = TextEditingController();
  TextEditingController pass = TextEditingController();
  final List<Color> colors = [fondo, fondo2, fondo3, fondo4];
  String mensaje = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondo,
      body: Stack(
        children: [
          Column(
            children: [
              recuadro(numFlex: 4, color1: fondo2, color2: fondo, color3: fondo3, color4: fondo4),
              recuadro(numFlex: 4, color1: fondo3, color2: fondo4, color3: fondo2, color4: fondo),
              recuadro(numFlex: 4, color1: fondo4, color2: fondo3, color3: fondo, color4: fondo2),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Bienvenido a tu primer EXAMEN',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: titulos,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: usuario,
                      decoration: InputDecoration(
                        fillColor: Colors.white, filled: true,
                        hintText: 'Correo/Usuario',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(width: 2),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: pass,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white, filled: true,
                        hintText: 'Contraseña',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(width: 2),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    if (mensaje != "")
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          mensaje,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: botones,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fixedSize: const Size(200, 40),
                      ),
                      onPressed: validaUser,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(width: 10),
                          const Text('Iniciar Sesión',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    const Text('Mi primer examen, ¿estará sencillo?',
                      style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void validaUser() {
    setState(() {
      if (usuario.text.isEmpty || pass.text.isEmpty) {
        mensaje="Datos incompletos";
      } else if (usuario.text != 'test') {
        mensaje="Usuario incorrecto";
      } else if (pass.text != 'FDM1') {
        mensaje="Contraseña incorrecta";
      } else {
        mensaje="Ingreso Correctamente";
        Navigator.push(context,MaterialPageRoute(builder: (context)=>Home()));
      }
    });
  }
}


class recuadro extends StatelessWidget {
  final int numFlex;
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;

  const recuadro({
    super.key,
    required this.numFlex,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.color4,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: numFlex,
      child: Row(
        children: [
          expandedFuncion(colores: color1),
          expandedFuncion(colores: color2),
          expandedFuncion(colores: color3),
          expandedFuncion(colores: color4),
        ],
      ),
    );
  }
}

class expandedFuncion extends StatelessWidget {
  final Color colores;

  const expandedFuncion({
    super.key,
    required this.colores,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: colores,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

