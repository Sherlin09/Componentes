import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  List<String> _lenguajes = [
    'Java',
    'Python',
    'JavaScript',
    'C++',
    'Ruby',
    'Dart'
  ];
  String _opcionSeleccionada = 'Java';

  TextEditingController _inputFieldDateController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entradas de texto'),
        backgroundColor: Colors.brown.shade500,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearEntrada(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearEntrada() {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Caracteres ${_nombre.length}'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Solo escribe el nombre',
          suffixIcon: Icon(
            Icons.accessibility,
            color: Colors.brown.shade700,
          ),
          icon: Icon(Icons.account_circle, color: Colors.brown.shade700)),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('El nombre es: $_nombre'),
      subtitle: Text('Email: $_email, Password: $_password'),
      trailing: Text('Lenguaje: $_opcionSeleccionada'),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Email de la persona',
          helperText: 'Solo escribe el email',
          labelText: 'Email',
          suffixIcon: Icon(
            Icons.alternate_email,
            color: Colors.brown.shade700,
          ),
          icon: Icon(Icons.email, color: Colors.brown.shade700)),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Password',
          helperText: 'Nuevo Password',
          labelText: 'Escribe tu contraseña',
          suffixIcon: Icon(
            Icons.lock_open,
            color: Colors.brown.shade700,
          ),
          icon: Icon(Icons.lock, color: Colors.brown.shade700)),
      onChanged: (valor) {
        setState(() {
          _password = valor;
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha de nacimiento',
          helperText: 'Fecha de nacimiento',
          labelText: 'Escribe tu fecha de nacimiento',
          suffixIcon: Icon(
            Icons.perm_contact_calendar,
            color: Colors.brown.shade700,
          ),
          icon: Icon(Icons.calendar_today, color: Colors.brown.shade700)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2022),
      locale: Locale('es', 'ES'),
    );
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  Widget _crearDropDown() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.code,
          color: Colors.brown.shade700,
        ),
        SizedBox(
          width: 30.0,
        ),
        Text('Lenguaje de programación'),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropDown(),
            onChanged: (opt) {
              // print(opt);
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropDown() {
    List<DropdownMenuItem<String>> lista = new List();
    _lenguajes.forEach((lenguaje) {
      lista.add(DropdownMenuItem(
        child: Text(lenguaje),
        value: lenguaje,
      ));
    });
    return lista;
  }
}
