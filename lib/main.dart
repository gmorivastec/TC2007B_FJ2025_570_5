import 'package:flutter/material.dart';
import 'classes/example.dart';

void main() {
  // tenemos un entry point explicito 
  // un método main que podemos manipular
  runApp(const MainApp());
}

// la unidad básica de UI en flutter es llama Widget
// conceptualmente un Widget es muy similar a un componente

// los widgets pueden agregarse - crear un widget a partir de widgetss más sencillos
// una clase de widget debe extender otro widget

// cada widget se define en su propia clase
// es UN REQUISITO que tenga un método BUILD

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StatelessExampleWidget()
    );
  }
}
