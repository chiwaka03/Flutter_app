import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:untitled1/paginaUsuarios.dart';
import 'package:http/http.dart' as http;

class resultadoPagina extends StatelessWidget {
  static const String routeName = '/destination';
  final String textProduct;

  const resultadoPagina({Key? key, required this.textProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
        appBar: AppBar(
            title: Text('Resultados'),

        )
    );

  }
}