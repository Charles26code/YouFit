import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:youfit/reusable_widgets/widget_general.dart';
import 'package:youfit/screen/ListExercice.dart';
import 'package:youfit/screen/Login.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
  }


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
              image: AssetImage('img/bg-signup.jpg'),
              alignment: FractionalOffset.topCenter,
            ),
          ),
        ),
        
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('img/bg-circle.png'),
              alignment: FractionalOffset.topCenter,
            ),
          ),
        )
      ]
    );
  }
}

//Class déstinée au fonctionnement propre de la page d'inscription
class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formkey= GlobalKey<FormState>();
  
  final _confirmPasswordTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _userNameTextController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                          child: const Text('YOU',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Koulen',
                              fontSize: 35,
                              fontWeight: FontWeight.bold
                            )
                          ),
                        ),
                        
                        Container(
                          child: const Text('FIT',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromARGB(1000, 0, 232, 51),
                              fontFamily: 'Koulen',
                              fontSize: 35,
                              fontWeight: FontWeight.bold
                            )
                          ),
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
                  child: 
                  Column(
                    
                    children: <Widget>[
                      const SizedBox(height: 20,),
                      champsTextes("Nom d'utilisateur", Icons.person_outline, false, /*userNameTextController*/),
                      
                      const SizedBox(height: 20,),
                      champsTextes("Adresse Mail", Icons.person_outline, false, /*_emailTextController*/),
                      
                      const SizedBox(height: 20,),
                      champsTextes("Mot de passe", Icons.lock_outlined, true, /*_passwordTextController*/),
                      
                      const SizedBox(height: 20,),
                      champsTextes("Confirmer le mot de passe", Icons.lock_outlined, true, /*_confirmPasswordTextController*/),
                      
                      const SizedBox(height: 20,),

                      //Ancien test de bouton réaliser avec firebase//

                      //const SizedBox(height: 20,),
                      // firebaseUIButton(
                      //   context, "Inscription", () {
                      //     FirebaseAuth.instance
                      //         .createUserWithEmailAndPassword(
                      //           email: _emailTextController.text,
                      //           password: _passwordTextController.text,
                      //           confirmpassword: _confirmPasswordTextController)
                      //         .then((value) {
                      //           print("Nouveau compte créé");
                      //           Navigator.push(context,
                      //             MaterialPageRoute(
                      //               builder: (context) => ListExercice()));
                      //         }).onError((error, stackTrace) {
                      //         print("Error ${error.toString()}");
                      //       }
                      //     );
                      //   }
                      // )

                      SizedBox(
                        width: 325,
                        child: FloatingActionButton.extended(
                          backgroundColor: const Color.fromARGB(1000, 0, 232, 51),
                          hoverColor: Color.fromARGB(255, 0, 255, 55),
                          onPressed: () {},
                          label: const Text(
                            'INSCRIPTION',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'PT Sans',
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20,),
                      TextButton(
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()))
                        }, 
                        child: const Text(
                          " J'ai déjà un compte ->",
                          style: TextStyle(
                            color: Colors.white, 
                            fontSize: 12, 
                            fontFamily: 'PT Sans'
                          ),
                        )
                      )
                    ],

                  ),
                )
              )
            ],
          ),
        ],
      ),
    );
  }
}