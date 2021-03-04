import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://th.bing.com/th/id/OIP.Qk4hwcrbWt_z1s_3WIWWqgHaGG?pid=ImgDet&rs=1'),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('STP'),
              backgroundColor: Colors.amber.shade400,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade600,
        child: Icon(Icons.keyboard_return_outlined),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://www.laguiadelvaron.com/wp-content/uploads/2019/03/fondos-pantalla-naturaleza-www.laguiadelvaron-15.jpg'),
          placeholder: AssetImage('assets/loadingJ.gif'),
          fadeInDuration: Duration(microseconds: 200),
        ),
      ),
    );
  }
}
