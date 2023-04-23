import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:untitled1/iconWidget.dart';
import 'package:url_launcher/url_launcher.dart';

import 'cuentaPagina.dart';
import 'notiPagina.dart';

class paginaUsuario extends StatelessWidget {
  const paginaUsuario ({key}) : super(key: key);
  static const oscuro = 'Key-Oscuro';

  @override
  Widget build(BuildContext context) => Scaffold (
    appBar: AppBar(
      title: Text('Ajustes'),
    ),
      body: SafeArea(
        child: ListView (
            padding: EdgeInsets.all(24),
            children: [
              SettingsGroup(
                  title: 'General',
                  children: <Widget>[
                    //cuentaPagina(),
                    notiPagina(),
                    modoOscuro(context),
                    //buildLogout(context),
                  ],
              ),
              const SizedBox(height: 32),
              SettingsGroup(title: 'Feedback',
                  children: <Widget>[
                    const SizedBox(height: 8),
                    reportBug(context),
                    sendFeedback(context),
                  ]
              ),
            ] ,
        ),
      ),
  );

//Aqui creamos los ajustes
  Widget buildLogout(context)=> SimpleSettingsTile(
      title: 'Cerrar Sesion',
      subtitle: '',
      leading: IconWidget(icon: Icons.logout, color: Colors.blueAccent),
      onTap: (){},
  );
  Widget reportBug(context)=> SimpleSettingsTile(
    title: 'Reportar Bug',
    subtitle: '',
    leading: IconWidget(icon: Icons.bug_report, color: Colors.blueAccent),
    onTap: (){
      launch('mailto:wearethrift3r@gmail.com?subject=Bug');
    },
  );
  Widget sendFeedback(context)=> SimpleSettingsTile(
    title: 'Opinion',
    subtitle: '',
    leading: IconWidget(icon: Icons.thumb_up, color: Colors.purple),
    onTap: (){
      launch('mailto:wearethrift3r@gmail.com?subject=My_opinion');
    },
  );
  Widget modoOscuro(context)=> SwitchSettingsTile(
      settingKey: oscuro,
      leading: IconWidget(
        icon: Icons.dark_mode,
        color: Color(0xFF8c004b),
      ),
    title: 'Modo Oscuro',
    onChange: (_){},
  );
}
