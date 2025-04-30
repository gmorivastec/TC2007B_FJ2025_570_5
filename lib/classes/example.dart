// dart - lenguaje de programación a utilizar 
// lenguaje de uso general hecho por google

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


// POQUITO MÁS DE WIDGETS
// 2 tipos:
// 1. stateful
// 2. stateless

// stateless

class StatelessExampleWidget extends StatelessWidget {
  const StatelessExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EJEMPLO")),
      body: StatefulExampleWidget()
    );
  }
}

// stateful widget
// 1. puede tener varias UIs asociadas a un estado
// 2. puede utilizar variables de estado

class StatefulExampleWidget extends StatefulWidget {
  const StatefulExampleWidget({super.key});

  // la clase donde se define el stateful widget 
  // NO tiene un build
  // sin embargo, es requerido que  tenga un create state donde regresa
  // un estado basándose en algún criterio
  @override
  State<StatefulExampleWidget> createState() => _StatefulExampleWidgetState();
}

// los estados DEBEN heredar de la clase State con el widget específico asociado como
// argumento de tipo 
class _StatefulExampleWidgetState extends State<StatefulExampleWidget> {

  // para este ejemplo vamos a desplegar una lista con datos predefinidos
  final List<String> contenido = ["a", "b", "c", "d", "e"];
  final TextStyle textStyle = TextStyle(fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return buildList();
  }

  // NOTA A RECORDAR: estamos trabajando dentro de una clases 
  // podemos distribuir la lógica en diferentes métodos y tener organizado el código
  Widget buildList() {

    // utilizamos el patrón de diseño de fábrica
    // https://en.wikipedia.org/wiki/Factory_method_pattern 
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: contenido.length,
      itemBuilder: (context, i) {
        return buildRow(contenido[i]);
      }
    );
  }

  Widget buildRow(String value) {
    return ListTile(
      title: Text(
        value,
        style: textStyle
      ),
      onTap: () {
        Fluttertoast.showToast(
          msg: "TOCASTE EL TILE! $value",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1
        );
      },
    );
  }
}