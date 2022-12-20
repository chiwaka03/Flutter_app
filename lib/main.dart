import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:untitled1/notiPagina.dart';
import 'package:untitled1/paginaInicio.dart';
import 'package:untitled1/paginaUsuarios.dart';

Future main () async {
  await Settings.init(cacheProvider: SharePreferenceCache());
  runApp(MyApp());
}

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
    return ValueChangeObserver <bool>(
      cacheKey: paginaUsuario.oscuro,

      defaultValue: true,
        builder: (_, isDarkMode, __) => MaterialApp(
          debugShowCheckedModeBanner: false,//para quitar la etiqueta de debug
          theme: isDarkMode
            ?ThemeData.dark().copyWith(
              appBarTheme: AppBarTheme(
                color: const Color(0xFF501c5d),
              ),
              primaryColor: Colors.black,
              scaffoldBackgroundColor: Color(0xFF18171c),
              canvasColor: Color(0xFF18171c),
          )
          :ThemeData.light().copyWith(
              appBarTheme: AppBarTheme(
                color: const Color(0xFF501c5d),
              ),
              primaryColor: Color(0xFF501c5d),
              scaffoldBackgroundColor: Color(0xFFfafbfd),
              canvasColor: Color(0xFFfafbfd)
          ),
          home: Scaffold(
            body: paginas[paginaActual],
            //Botones de abajo
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Color(0xFF87CEFA),
                selectedItemColor: Color(0xFF501c5d),
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
      )
        )
    );
  }
}
