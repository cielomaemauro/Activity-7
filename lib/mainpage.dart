import 'dart:math';
import 'package:mauro/main.dart';
import 'package:flutter/material.dart';
import 'end.dart';

int previous = 0;
List<Cards> listofCards = [];
List<Cards> guessedC = [];
String previousImg = "";
String img = "";
int score = 0;
int cardCount = 1;

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/images/start.jpg'), fit: BoxFit.cover)),
        child: Center(
          child: Container(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                children: [
                  Container(
                    width: 550,
                    padding:
                        const EdgeInsets.only(bottom: 5, top: 35, left: 120),
                    child: Text(
                      'Cards = ' + listofCards.length.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 227, 227, 233),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(bottom: 5, top: 35, right: 120),
                    child: Text(
                      'Score = ' + score.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 227, 227, 233),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding:
                          const EdgeInsets.only(top: 5, right: 10, left: 10),
                      child: TextButton(
                        child: Text(
                          'HI',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 193, 164, 79),
                            minimumSize: Size(80, 50)),
                        onPressed: () {
                          setState(() {
                            if (validateCard(1)) {
                              score++;
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GameOver()));
                            }
                            cardCount++;
                            viewFiveCard();
                          });
                        },
                      )),
                  CardsDeck(),
                  Container(
                    padding: const EdgeInsets.only(top: 5, right: 10, left: 10),
                    child: TextButton(
                      child: Text(
                        'LO',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 193, 164, 79),
                          minimumSize: Size(80, 50)),
                      onPressed: () {
                        setState(() {
                          if (validateCard(2)) {
                            score++;
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GameOver()));
                          }
                          cardCount++;
                          viewFiveCard();
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: lastFivecard,
              )
            ]),
          ),
        ),
      ),
    );
  }
}

var lastFivecard = <Container>[];
void viewFiveCard() {
  lastFivecard = <Container>[];
  var images = <String>[];
  images.add(
      guessedC.length > 0 ? guessedC[guessedC.length - 1].img : "joker.jfif");
  images.add(
      guessedC.length > 1 ? guessedC[guessedC.length - 2].img : "joker.jfif");
  images.add(
      guessedC.length > 2 ? guessedC[guessedC.length - 3].img : "joker.jfif");
  images.add(
      guessedC.length > 3 ? guessedC[guessedC.length - 4].img : "joker.jfif");
  images.add(
      guessedC.length > 4 ? guessedC[guessedC.length - 5].img : "joker.jfif");

  for (int i = 0; i < 5; i++) {
    lastFivecard.add(Container(
      padding: const EdgeInsets.only(top: 3, left: 5, right: 5, bottom: 1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.white,
          height: 100,
          width: 60,
          child: Image.asset('lib/images/' + images[i]),
        ),
      ),
    ));
  }
}

void components() {
  previous = 0;
  lastFivecard = <Container>[];
  guessedC = [];
  listofCards = [];
  int counter = 1;
  for (int i = 0; i < 52; i++) {
    var data = Cards();
    data.id = i + 1;
    data.img = (i + 1).toString() + ".png";

    if (counter <= 13) {
      data.value = counter;
      counter++;
    } else {
      counter = 1;
      data.value = counter;
      counter++;
    }
    listofCards.add(data);
  }
  validateCard(0);
  score = 0;
  cardCount = 1;
  viewFiveCard();
}

bool validateCard(int sender) {
  int shuffle = 0;
  int newCard = 0;
  bool isExist = false;
  while (!isExist) {
    Random rand = new Random();
    shuffle = rand.nextInt(listofCards.length - 1) + 1;
    for (int i = 0; i < listofCards.length; i++) {
      if (shuffle == listofCards[i].id) {
        isExist = true;
        previousImg = img == '' ? 'joker.jfif' : img;
        img = listofCards[i].img;
        newCard = listofCards[i].value;
        if (sender != 0) {
          guessedC.add(listofCards[i]);
        }
        listofCards.remove(listofCards[i]);
      }
    }
  }
  if (sender == 1) {
    if (newCard >= previous) {
      previous = newCard;
      return true;
    } else {
      previous = newCard;
      return false;
    }
  } else if (sender == 2) {
    if (newCard < previous) {
      previous = newCard;
      return true;
    } else {
      previous = newCard;
      return false;
    }
  } else {
    previous = newCard;
    return false;
  }
}

class CardsDeck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Container(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.white,
                height: 130,
                width: 90,
                child: Image.asset('lib/images/' + img),
              ),
            ),
          ),
        ),
        Container(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.white,
                height: 130,
                width: 90,
                child: Image.asset('lib/images/joker.png'),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
