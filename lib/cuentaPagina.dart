import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'iconWidget.dart';


class cuentaPagina extends StatelessWidget {
  static final Keylenguaje = 'key-lenguaje';

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
      title: 'Cuenta',
      subtitle: 'Privacidad, Seguridad, Mejora',
      leading: IconWidget(icon: Icons.person, color: Colors.green),
      child: SettingsScreen(
        title: 'Cuenta',
        children: <Widget>[
          privacidad(context),
          seguridad(context),
          mejorCuenta(context),
          lenguaje (context),
        ],
      ),
  );


  Widget privacidad(context)=> SimpleSettingsTile(
    title: 'Privacidad',
    subtitle: '',
    leading: IconWidget(icon: Icons.lock, color: Colors.blue),
    onTap: (){},
  );
  Widget seguridad(context)=> SimpleSettingsTile(
    title: 'Seguridad',
    subtitle: '',
    leading: IconWidget(icon: Icons.security, color: Colors.red),
    onTap: (){},
  );
  Widget mejorCuenta(context)=> SimpleSettingsTile(
    title: 'Mejorar Cuenta',
    subtitle: '',
    leading: IconWidget(icon: Icons.account_balance_wallet, color: Colors.amber),
    onTap: (){},
  );
  Widget lenguaje(context)=> DropDownSettingsTile(
    settingKey: Keylenguaje,
    title: 'Lenguaje',
    selected: 1,
    values: <int, String> {
      1: 'Spanish',
      2: 'English',
    },
    onChange: (lenguaje){},
  );
}