import 'package:flutter/material.dart';
import 'package:youfit/screen/all_layout.dart';
import 'package:youfit/screen/SignUpScreen.dart';

//Classe destinée au fond d'écran
class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: <Widget>[
      Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
            image: AssetImage('img/bg-programscreen.jpg'),
            alignment: FractionalOffset.topCenter,
          ),
        ),
      ),
    ]);
  }
}

//Classe ayant pour but d'afficher l'ensemble des programmes disponible
class ProgramScreen extends StatefulWidget {
  const ProgramScreen({Key? key}) : super(key: key);

  @override
  _ProgramScreenState createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {
  List cards = [
    {
      't': 'CARDIO CIRCUIT',
      'n': 'DEBUTANT',
      'd':
          "Renforcer votre cardio en 8 semaines et gagner en explosivité, voici un test pour l'extension du texte",
      'back': '',
      'press': false
    },
    {
      't': "RENFORCEMENT",
      'n': 'INTERMEDIAIRE',
      'd': "Renforcer votre cardio en 8 semaines et gagner en explosivité",
      'back': '',
      'press': false
    },
    {
      't': "PERTE DE POIDS",
      'n': 'AVANCE',
      'd': "Renforcer votre cardio en 8 semaines et gagner en explosivité",
      'back': '',
      'press': false
    },
    {
      't': "MUSCULATION",
      'n': 'INTERMEDIAIRE',
      'd':
          "Renforcer votre cardio en 8 semaines et gagner en explosivité, voici un test pour l'extension du texte",
      'back': '',
      'press': false
    },
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
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 30, 30),
        title: Image.asset('img/logoapp.png'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          const Background(),

          //Partie permettant d'afficher les programmes les uns à la suite des autres
          Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: ListView.separated(
              itemBuilder: (context, i) {
                return CardLanguage(
                  titre: cards[i]['t'],
                  niveau: cards[i]['n'],
                  description: cards[i]['d'],
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
                  height: 10,
                  thickness: 5,
                );
              },
            ),
          ),
        ],
      ),

      //Menu gauche de l'application pouvant etre ouvert en glissant ou via l'icone
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: Colors.black,
              child: DrawerHeader(
                child: Stack(alignment: Alignment.center, children: <Widget>[
                  // Ajout de l'image de fond
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('img/bg-programscreen.jpg'),
                        alignment: FractionalOffset.topCenter,
                      ),
                    ),
                  ),

                  // Affiche le logo au dessus de l'image
                  Container(
                    decoration: const BoxDecoration(
                      //color: Colors.black,
                      image: DecorationImage(
                        //fit: BoxFit.cover,
                        //colorFilter: ColorFilter.mode(
                        //Colors.black.withOpacity(0.5), BlendMode.dstATop),
                        image: AssetImage('img/logoapp.png'),
                        alignment: FractionalOffset.center,
                      ),
                    ),
                  ),
                ]),
              ),
            ),

            // Ajout des différents menus dans une liste
            ListTile(
              title: const Text('Programmes',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Koulen',
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                // Navigation vers la page à ajouter
                // ...
                // Fermeture du drawer
                Navigator.pop(context);
              },
            ),

            const Divider(
              thickness: 2,
              indent: 15,
              endIndent: 15,
              color: Color.fromARGB(255, 108, 108, 108),
            ),

            ListTile(
              title: const Text('Favoris',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Koulen',
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                // Navigation vers la page à ajouter
                // ...
                // Fermeture du drawer
                Navigator.pop(context);
              },
            ),

            const Divider(
              thickness: 2,
              indent: 15,
              endIndent: 15,
              color: Color.fromARGB(255, 108, 108, 108),
            ),

            ListTile(
              title: const Text('Créer un programme',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Koulen',
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                // Navigation vers la page à ajouter
                // ...
                // Fermeture du drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
