import 'package:mauro/mainpage.dart';
import 'package:flutter/material.dart';

class play extends StatefulWidget {
  @override
  _play createState() => _play();
}

class _play extends State<play> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/images/start.jpg'), fit: BoxFit.cover)),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'HIGHER LOWER CARD GAME',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: TextButton(
                  child: Text(
                    'PLAY',
                    style: TextStyle(
                        color: Color.fromARGB(255, 45, 12, 121),
                        fontSize: 35,
                        fontWeight: FontWeight.w900),
                  ),
                  style: TextButton.styleFrom(minimumSize: Size(180, 50)),
                  onPressed: () {
                    setState(() {
                      components();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainPage()));
                    });
                  },
                ),
              )
            ],
          )
        ],
      )),
    ));
  }
}
