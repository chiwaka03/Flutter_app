import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:untitled1/paginaUsuarios.dart';
import 'package:untitled1/resultadoPagina.dart';

class paginaInicio extends StatelessWidget {

  const paginaInicio({key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    //guardo el producto que quiere buscar
    final producto = TextEditingController();
    String textProduct = "";

    //empieza la estructura de arriba abajo
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
            title: Text('Thrift3r'),
        ),


        body: Padding (
          padding: const EdgeInsets.all(30.0),

          //Para que no haya overflow con el cuadrado de la busqueda
          child: SingleChildScrollView (

          child: Column (
            children: [
            SizedBox(height: 50, width: 300),
            Align(alignment: Alignment.centerLeft,),
            Image.asset('asset/caja4.png'),


             TextField(
                controller: producto,
                decoration: InputDecoration (
                hintText: 'Escribe el producto a buscar',
                border: OutlineInputBorder(),
                  suffixIcon: IconButton (onPressed: () {
                      textProduct = producto.text;

                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => resultadoPagina(textProduct: textProduct)),
                    );
                  }, icon: Icon(Icons.search),)
            ),
          ),
        ],
        ),

    ),
        ),
    );

  }
}