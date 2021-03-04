// import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu_providers.dart';
import 'package:componentes/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Componentes'),
          backgroundColor: Colors.amber.shade400,
        ),
        body: _lista(),
        backgroundColor: Colors.grey.shade300);
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapShot) {
        // print('builder: ');
        // print(snapShot.data);
        return ListView(children: _listaItems(snapShot.data, context));
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.amber.shade800),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }
}
