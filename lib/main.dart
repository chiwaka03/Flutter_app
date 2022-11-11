import 'package:flutter/material.dart';
import 'package:untitled1/paginaInicio.dart';
import 'package:untitled1/paginaUsuarios.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State <MyApp> {

  int paginaActual = 0;
  List<Widget> paginas = [
    paginaInicio(),
    paginaUsuario(),
  ];

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,//para quitar la etiqueta de debug
        theme: ThemeData(primarySwatch: Colors.purple),
          home: Scaffold(


            body: paginas[paginaActual],
            //Botones de abajo
            bottomNavigationBar: BottomNavigationBar(
                onTap: (introducido){
                  setState(() {
                    paginaActual = introducido;
                  });
                },
                currentIndex: paginaActual,
                items: [
                //Siempre poner un nombre/label
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
                BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle_rounded), label: "Ajustes"),
              ],
            ),
      ));
  }
}
