import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:untitled1/paginaInicio.dart';
import 'package:untitled1/product.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class resultadoPagina extends StatefulWidget {
  const resultadoPagina({Key? key, required this.textProduct}) : super(key: key);

  final String textProduct;



  @override
  _resultadoPaginaState createState() => _resultadoPaginaState();

}

class _resultadoPaginaState extends State<resultadoPagina> {
  String _textProduct="";
  late Future<List<Product>> _listadoProduct;
  @override
  void initState(){
    super.initState();
    _listadoProduct = getProduct();
    _textProduct  = widget.textProduct;

  }


  Future <List<Product>> getProduct() async {

    final response = await http.get(Uri.parse('http://10.0.2.2:8000/products/${widget.textProduct}'));

    List<Product> products = [];

    if (response.statusCode == 200)
    {
      //para que se vean las tildes y la ñ
      String body = utf8.decode(response.bodyBytes);

      final jsonData = json.decode(body);

      for (var item in jsonData){

        String titulo = item["title"];
        String image = item["images"][0];
        String price = item["price"].toString();
        String url = item["url"].toString();
        //print(url.runtimeType);

        products.add(Product(titulo, image, price, url));

      }

      //comprobar
      /*for (var product in products) {
        product.printMethod();
      }*/
      return products;

    }
    else {
      throw Exception("Fallo la conexion");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Resultados'),
        ),
        body: FutureBuilder(
          future: _listadoProduct,
          builder: (context, snapshot){
            if (snapshot.hasData){

              return ListView(
                children: _listProduct(snapshot.data!),
              );
            }
            else if(snapshot.hasError){
              return Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Error al cargar los productos:',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      snapshot.error.toString(),
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => paginaInicio()));
                      },
                      child: Text('Volver'),
                    ),
                  ],
                ),
              );
            }
            return Center (
              child: CircularProgressIndicator(),
            );
          },
        ),
    );

  }
  List<Widget> _listProduct(List<Product> data) {
    List<Widget> products = [];

    for (var product in data){
      products.add(Card(child: Column(
        children: [
          InkWell(
            onTap: () => launch("https://wallapop.com/item/"+product.url),
            child: SizedBox(
              width: 400.0,
              height: 400.0,
              child: Image.network(product.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(12.0),
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    product.title,
                    style: TextStyle(fontSize: 20.0
                        ),
                    ),
                  SizedBox(height: 8.0),
                  Text(product.price+"€",
                    style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          )
        ],
        )
      )
      );
    }

    return products;
  }

}
