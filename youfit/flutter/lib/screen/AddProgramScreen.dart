import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:youfit/reusable_widgets/widget_general.dart';
import 'package:youfit/screen/Card/program_screen.dart';
import 'package:youfit/screen/Login.dart';
import 'package:provider/provider.dart';
import 'package:youfit/models/exercice_provider.dart';
import 'package:youfit/models/user_model.dart';
import 'package:email_validator/email_validator.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:image_picker/image_picker.dart';

class AddProgramScreen extends StatefulWidget {
  const AddProgramScreen({Key? key}) : super(key: key);

  @override
  State<AddProgramScreen> createState() => _AddProgramScreen();
}

//Class déstinée au fonctionnement propre de la page d'inscription
class _AddProgramScreen extends State<AddProgramScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool valEasy = false;
  bool valMedium = false;
  bool valHard = false;
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

  // Future<void> exoForm() async {
  //   if (formKey.currentState!.validate()) {
  //     formKey.currentState?.save();
  //     if (mdp != confirmmdp) {
  //       ScaffoldMessenger.of(context)
  //         ..removeCurrentSnackBar()
  //         ..showSnackBar(
  //           const SnackBar(
  //             content: Text("Les mots de passes de correspondent pas."),
  //           ),
  //         );
  //     } else {
  //       try {
  //         Map? result = await Provider.of<ExercicesProvider>(
  //           context,
  //           listen: false,
  //         ).addExercice(name, description, difficulty;
  //         if (result != null) {
  //           ScaffoldMessenger.of(context)
  //             ..removeCurrentSnackBar()
  //             ..showSnackBar(
  //               SnackBar(
  //                 content: Text(result['message']),
  //               ),
  //             );
  //         }
  //       } catch (e) {
  //         ScaffoldMessenger.of(context)
  //           ..removeCurrentSnackBar()
  //           ..showSnackBar(
  //             SnackBar(
  //               content: Text(e.toString()),
  //             ),
  //           );
  //       }
  //     }
  //   }
  // }

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
                      champsTextes("Nom", Icons.border_color_rounded, false,
                          (value) => name = value, (value) {
                        if (value == null || value.isEmpty) {
                          return "Renseigner un nom d'exercice.";
                        }
                        return null;
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: TextStyle(color: Colors.white.withOpacity(0.9)),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.chat_bubble_rounded,
                            color: Colors.white70,
                          ),
                          labelText: 'Ajouter une description',
                          labelStyle:
                              TextStyle(color: Colors.white.withOpacity(0.9)),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none)),
                          filled: true,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // [easy] checkbox
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "EASY",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              CustomCheckBox(
                                value: valEasy,
                                shouldShowBorder: true,
                                borderColor:
                                    const Color.fromARGB(1000, 0, 232, 51),
                                checkedFillColor:
                                    const Color.fromARGB(1000, 0, 232, 51),
                                borderRadius: 8,
                                borderWidth: 1,
                                checkBoxSize: 25,
                                onChanged: (bool value) {
                                  setState(() {
                                    valEasy = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 30,
                          ),

                          // [intermediaire] checkbox
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "MEDIUM",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              CustomCheckBox(
                                value: valMedium,
                                shouldShowBorder: true,
                                borderColor:
                                    const Color.fromARGB(1000, 0, 232, 51),
                                checkedFillColor:
                                    const Color.fromARGB(1000, 0, 232, 51),
                                borderRadius: 8,
                                borderWidth: 1,
                                checkBoxSize: 25,
                                onChanged: (bool value) {
                                  setState(() {
                                    valMedium = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 30,
                          ),

                          // [hard] checkbox
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "HARD",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              CustomCheckBox(
                                value: valHard,
                                shouldShowBorder: true,
                                borderColor:
                                    const Color.fromARGB(1000, 0, 232, 51),
                                checkedFillColor:
                                    const Color.fromARGB(1000, 0, 232, 51),
                                borderRadius: 8,
                                borderWidth: 1,
                                checkBoxSize: 25,
                                onChanged: (bool value) {
                                  setState(() {
                                    valHard = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                        ],
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

                      // champsTextes("Description", Icons.chat_bubble_rounded,
                      //     false, (value) => description = value, (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Ajouter une description.";
                      //   }
                      //   return null;
                      // }),
                      const SizedBox(
                        height: 20,
                      ),
                      //stylebouton(context, picture!, onTap()),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 325,
                        child: FloatingActionButton.extended(
                          backgroundColor:
                              const Color.fromARGB(1000, 0, 232, 51),
                          hoverColor: Color.fromARGB(255, 0, 255, 55),
                          onPressed: () => {},
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
