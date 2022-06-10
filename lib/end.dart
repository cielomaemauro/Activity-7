import 'package:mauro/mainpage.dart';
import 'package:flutter/material.dart';
import 'start.dart';

class GameOver extends StatefulWidget {
  @override
  _GameOver createState() => _GameOver();
}

class _GameOver extends State<GameOver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/images/start.jpg'), fit: BoxFit.cover)),
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 5, top: 0, left: 10),
              child: Text(
                'GAME OVER!',
                style: TextStyle(
                    fontSize: 45,
                    color: Colors.red[900],
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 5, left: 10),
              child: Text(
                'Your score is : ' + score.toString(),
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(179, 139, 123, 123),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 0),
              child: TextButton(
                child: Text(
                  'Play again',
                  style: TextStyle(
                      color: Color.fromARGB(255, 37, 10, 87), fontSize: 40),
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
            ),
          ],
        ),
      ])),
    ));
  }
}
