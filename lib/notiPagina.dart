import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:untitled1/iconWidget.dart';

import 'iconWidget.dart';

class notiPagina extends StatelessWidget {
  static const keyNov = 'key-nov';
  static const KeyAct = 'key-act';

  @override
  Widget build (BuildContext context) => SimpleSettingsTile (
    title: 'Notificaciones',
    subtitle: 'Actualizaciones, Novedades',
    leading: IconWidget(
      icon: Icons.notifications,
      color: Colors.redAccent,
    ),
    child: SettingsScreen(
      title: 'Notificaciones',
      children: <Widget>[
        buildNov(),
        buildAct(),
      ],
    ),
  );
      Widget buildNov()=> SwitchSettingsTile(
        settingKey: keyNov,
        leading: IconWidget(
            icon: Icons.message,
            color: Colors.blue
        ),
        title: 'Novedades',
  );
      Widget buildAct()=> SwitchSettingsTile(
        settingKey: KeyAct,
        leading: IconWidget(
            icon: Icons.update,
            color: Colors.orangeAccent
        ),
        title: 'Actualizaciones',
  );
}