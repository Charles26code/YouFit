import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:youfit/reusable_widgets/widget_general.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:youfit/models/exercice_provider.dart';
import 'package:youfit/screen/Login.dart';
import 'package:youfit/screen/Card/program_screen.dart';
import 'package:youfit/models/user_model.dart';

class AddProgramScreen extends StatefulWidget {
  final User user;
  const AddProgramScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<AddProgramScreen> createState() => _AddProgramScreen();
}

//Class déstinée au fonctionnement propre de la page d'inscription
class _AddProgramScreen extends State<AddProgramScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? name;
  String? description;
  String? difficulty;
  String? picture;
  File? image;

  Future pickImage(ImageSource gallery) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image = $e');
    }
  }

  Future<void> submitForm() async{
    if (formKey.currentState!.validate()) {
      try{
        formKey.currentState?.save();
        difficulty ??= "1";
        String message = await Provider.of<ExerciceProvider>(
          context,
          listen: false,
        ).createExercice(name, description, difficulty, "img/fitness.jpg"); //L'image est en dure car on ne gère pas encore l'upload des images. Ce sera disponible dans une prochaine release
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(message),
            ),
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProgramScreen(user: widget.user, isFavoritePage: false)));

      }catch(e){
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(e.toString()),
            ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        title: Image.asset('img/logoapp.png'),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Stack(
          children: [
            const Background(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: const Text('AJOUTER UN ',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Koulen',
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            child: const Text('EXERCICE',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromARGB(1000, 0, 232, 51),
                                    fontFamily: 'Koulen',
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            child: RotationTransition(
                              turns: const AlwaysStoppedAnimation(135 / 360),
                              child: SvgPicture.asset(
                                "img/dumbbell.svg",
                                color: const Color.fromARGB(1000, 0, 232, 51),
                                width: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                    child: Padding(
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      champsTextes(
                        "Nom", 
                        Icons.border_color_rounded, 
                        false,
                        (value) => name = value, 
                        (value) {
                          if (value == null || value.isEmpty) {
                            return "Renseigner un nom d'exercice.";
                          }
                          return null;
                        }
                      ), 
                      const SizedBox(
                        height: 20,
                      ),
                      champsTextes(
                        "Ajouter un description", 
                        Icons.chat_bubble_rounded, 
                        false,
                        (value) => description = value, 
                        (value) {
                          if (value == null || value.isEmpty) {
                            return "Renseigner une description";
                          }
                          return null;
                        }
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.white,
                        ), 
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ListTile(
                              title: const Text("DEBUTANT", style: TextStyle(color: Colors.blue),),
                              leading: Radio<String>(
                                value: "1",
                                groupValue: difficulty,
                                onChanged: (value){
                                  setState(() {
                                    difficulty = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text("INTERMEDIAIRE", style: TextStyle(color: Colors.yellow),),
                              leading: Radio<String>(
                                value: "2",
                                groupValue: difficulty,
                                onChanged: (value){
                                  setState(() {
                                    difficulty = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text("AVANCE", style: TextStyle(color: Colors.red),),
                              leading: Radio<String>(
                                value: "3",
                                groupValue: difficulty,
                                onChanged: (value){
                                  setState(() {
                                    difficulty = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FloatingActionButton.extended(
                        backgroundColor: const Color.fromARGB(1000, 0, 232, 51),
                        icon: const Icon(Icons.image),
                        hoverColor: const Color.fromARGB(255, 0, 255, 55),
                        onPressed: () => pickImage(ImageSource.gallery),
                        label: const Text(
                          'PHOTO',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'PT Sans',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 325,
                        child: FloatingActionButton.extended(
                          backgroundColor:
                              const Color.fromARGB(1000, 0, 232, 51),
                          hoverColor: Color.fromARGB(255, 0, 255, 55),
                          onPressed: () => submitForm(),
                          label: const Text(
                            'AJOUTER',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'PT Sans',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ],
        ),
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
                  fontWeight: FontWeight.bold
                )
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProgramScreen(user: widget.user, isFavoritePage: false)));
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProgramScreen(user: widget.user, isFavoritePage: true)));
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
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddProgramScreen(user: widget.user)));
              },
            ),
            const Divider(
              thickness: 2,
              indent: 15,
              endIndent: 15,
              color: Color.fromARGB(255, 108, 108, 108),
            ),
            ListTile(
              title: const Text('Se déconnecter',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Koulen',
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                )
              ),
              
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Login()), (route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}

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
            image: AssetImage('img/bg-signup.jpg'),
            alignment: FractionalOffset.topCenter,
          ),
        ),
      ),
    ]);
  }
}
