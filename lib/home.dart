import 'package:examen1egr/more_info.dart';
import 'package:flutter/material.dart';
import 'package:examen1egr/lib/utils/constans.dart' as con;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List lista;

  @override
  void initState() {
    lista = List.from(con.listaExamen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: con.fondo,
      appBar: AppBar(
        title: const Text('Ericka Gonzalez Romero'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: lista.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return buildTitle();
          }

          var datos = lista[index - 1].toString().split('#');
          return Column(
            children: [
              if ((index - 1) % 2 == 0)
                CreateCard(
                  txtNegritas: datos[2],
                  txtNormal1: datos[3],
                  numero: datos[1],
                  id: datos[0],
                  stars: int.parse(datos[4]),
                  onDelete: (String id) {
                    eliminaCard(id, index - 1);
                  },
                )
              else
                CreateCard2(
                  txtNegritas: datos[2],
                  txtNormal1: datos[3],
                  numero: datos[1],
                  id: datos[0],
                  stars: int.parse(datos[4]),
                  onDelete: (String id) {
                    eliminaCard(id, index - 1);
                  },
                ),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }

  Widget buildTitle() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Center(
        child: Text(
          'Notificaciones de actividades',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: con.titulos,
            shadows: [
              Shadow(
                offset: Offset(1, 1),
                blurRadius: 2,
                color: con.efectos,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void eliminaCard(String id, int index) {
    if (['10', '15', '20', '23'].contains(id)) {
      showSnackBar(context, 'Se eliminó el elemento con el ID:$id', 5);
    } else {
      setState(() {
        lista.removeAt(index);
      });
      showSnackBar(context, 'Se eliminó el elemento con el ID: $id', 5);
    }
  }
}

void showSnackBar(BuildContext context, String texto, int duracion) {
  final snackBar = SnackBar(
    content: Text(texto),
    duration: Duration(seconds: duracion),
    action: SnackBarAction(
      onPressed: () {},
      label: 'Cerrar',
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class CreateCard extends StatelessWidget {
  final String txtNegritas;
  final String txtNormal1;
  final String numero;
  final String id;
  final int stars;
  final Function(String) onDelete;

  const CreateCard({
    super.key,
    required this.txtNegritas,
    required this.txtNormal1,
    required this.numero,
    required this.id,
    required this.stars,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      numero,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.eco, color: Colors.green),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  txtNegritas,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  txtNormal1,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < stars ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 18,
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 15),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MoreInfo()),
                    );
                  },
                  icon: const Icon(Icons.edit, size: 12),
                  label: const Text('Ver más'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(screenWidth * 0.25, 40),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () {
                    onDelete(id);
                  },
                  icon: const Icon(Icons.delete, size: 16),
                  label: const Text('Borrar'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(screenWidth * 0.25, 40),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CreateCard2 extends StatelessWidget {
  final String txtNegritas;
  final String txtNormal1;
  final String numero;
  final String id;
  final int stars;
  final Function(String) onDelete;

  const CreateCard2({
    super.key,
    required this.txtNegritas,
    required this.txtNormal1,
    required this.numero,
    required this.id,
    required this.stars,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onDelete(id);
      },
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        numero,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.eco, color: Colors.green),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    txtNegritas,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    txtNormal1,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Spacer(),
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < stars ? Icons.star : Icons.star_border,
                            color: Colors.amber,
                            size: 18,
                          );
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
