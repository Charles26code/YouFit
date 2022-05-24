import 'package:flutter/material.dart';
import 'package:youfit/screen/card_language.dart';

class ListExercice extends StatelessWidget {
  const ListExercice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(1000, 238, 122, 43),
            size: 20,
          ),
          onPressed: () {},
        ),
        title: const Text(
          'FitHub',
          style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
              fontFamily: 'Abel-Regular'),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite_outline_rounded,
              color: Color.fromARGB(1000, 238, 122, 43),
              size: 20,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Color.fromARGB(1000, 238, 122, 43),
              size: 20,
            ),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: const [
          Background(),
          MyCard(),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: <Widget>[
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
    ]);
  }
}

// Premier widget Stateful : ListView + constructeur nomm ́e
class MyCard extends StatefulWidget {
  const MyCard({Key? key}) : super(key: key);
// DATA FINAL (widget.name pour y acceder depuis le State)
  @override
  _MyCardState createState() {
    return _MyCardState();
  }
}

class _MyCardState extends State<MyCard> {
// DATA MODIFIABLE
  List cards = [
    {'m': 'Handstand', 'back': 'img/fitness.jpg', 'press': false},
    {'m': "Front Lever", 'back': 'img/fitness.jpg', 'press': false},
    {'m': "Push ups", 'back': 'img/img/fitness.jpg', 'press': false},
    {'m': "Pull ups", 'back': 'img/img/fitness.jpg', 'press': false},
    {'m': "Australian Pull ups", 'back': 'img/fitness.jpg', 'press': false},
    {'m': "Planche", 'back': 'img/img/fitness.jpg', 'press': false},
  ];
  void press(card) {
    int index = cards.indexOf(card);
    setState(() {
      cards[index]['press'] = !cards[index]['press'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 10, 20, 30),
// ListView.separated : Construction des widgets visibles + separateur
        child: ListView.separated(
          itemBuilder: (context, i) {
            return CardLanguage(
              message: cards[i]['m'],
              background: cards[i]['back'],
              pressed: cards[i]['press'],
              updatePressed: () {
                press(cards[i]);
              },
            );
          },
          itemCount: cards.length,
          separatorBuilder: (context, i) {
            return const Divider(
              height: 50,
              thickness: 5,
            );
          },
        ),
      ),
    );
  }
}
