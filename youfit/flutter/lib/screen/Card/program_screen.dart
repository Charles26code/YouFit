import 'package:flutter/material.dart';
import 'package:youfit/models/exercice_model.dart';
import 'package:youfit/screen/all_layout.dart';
import 'package:youfit/models/exercice_provider.dart';
import 'package:provider/provider.dart';
import 'package:youfit/models/user_model.dart';
import 'package:youfit/models/favoris_provider.dart';


//Classe destinée au fond d'écran
class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, children: <Widget>[
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
      ]
    );
  }
}


//Classe ayant pour but d'afficher l'ensemble des programmes disponible
class ProgramScreen extends StatefulWidget {
  final User user;
  final bool isFavoritePage;

  const ProgramScreen({Key? key, required this.user, required this.isFavoritePage}) : super(key: key);

  @override
  _ProgramScreenState createState() => _ProgramScreenState();

}

class _ProgramScreenState extends State<ProgramScreen> {
  List cards = [];
  @override
  void initState(){
    super.initState();
    fillCards(widget.user.id, widget.isFavoritePage);
  }

  Future<void> fillCards(String? userId, bool isFavoritePage) async{
    try{
      List exos = await Provider.of<ExerciceProvider>(
          context,
          listen: false,
        ).getAllExercices(); //Tout les exos
      List mesExos = await Provider.of<FavorisProvider>(
          context,
          listen: false,
        ).getExercicesFavorisForOneUser(userId!); //Les exos du user
      List myCards = [];
      if(isFavoritePage){
        for(int i = 0; i<mesExos.length; i++){
          Exercice unExo = mesExos[i];
          myCards.addAll([{
            't' : unExo.name, 
            'n' : unExo.difficultyToString(),
            'd' : unExo.description,
            'back': '', 
            'press': true,
            'difficulty': unExo.difficulty,
            'exerciceId': unExo.id
          }]);
        }
      }else{
        for(int i = 0; i<exos.length; i++){
          Exercice unExo = exos[i];
          bool pressed = false;
          mesExos.forEach((element) {
            if(element.id == unExo.id){
              pressed = true;
            }
          });
          myCards.addAll([{
            't' : unExo.name, 
            'n' : unExo.difficultyToString(),
            'd' : unExo.description,
            'back': '', 
            'press': pressed,
            'difficulty': unExo.difficulty,
            'exerciceId': unExo.id
          }]);
        }
      }
      setState(() {
        cards = myCards;
      });
    }catch(e){
      print(e);
    }
  }
    
  void press(card, bool isFavorite) async{
    int index = cards.indexOf(card);
    String message = "";
    if(isFavorite){
      message = await Provider.of<FavorisProvider>(
          context,
          listen: false,
        ).addToFavoris(widget.user.id!, cards[index]['exerciceId']);
    }else{
      message = await Provider.of<FavorisProvider>(
          context,
          listen: false,
        ).removeFromFavoris(widget.user.id!, cards[index]['exerciceId']);
    }
    
    ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(message),
            ),
        );
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
          
          //Partie permettant d'afficher les programme les uns à la suite des autres
          Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: ListView.separated(
              itemBuilder: (context, i) {
                return CardLanguage(
                  titre: cards[i]['t'],
                  niveau: cards[i]['n'],
                  numniveau: cards[i]['difficulty'],
                  description: cards[i]['d'],
                  background: cards[i]['back'],
                  pressed: cards[i]['press'],
                  updatePressed: (_isFavorite) {
                    press(cards[i], _isFavorite);
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
              child:DrawerHeader(
                child: Stack(
                    alignment: Alignment.center, 
                    children: <Widget>[
                      
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
                  ] 
                ),
              ),
            ),
            
            // Ajout des différents menus dans une liste
            ListTile(
              title: const Text('Programmes',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Koulen',
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                )
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProgramScreen(user: widget.user, isFavoritePage: false)));
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
                  fontWeight: FontWeight.bold
                )
              ),
              
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProgramScreen(user: widget.user, isFavoritePage: true)));
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
                  fontWeight: FontWeight.bold
                )
              ),
              
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