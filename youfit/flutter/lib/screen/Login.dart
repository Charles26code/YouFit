// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youfit/reusable_widgets/widget_general.dart';
import 'package:youfit/screen/ForgetPassword.dart';
import 'package:youfit/screen/SignUpScreen.dart';
import 'package:provider/provider.dart';
import 'package:youfit/models/user_provider.dart';
import 'package:youfit/models/user_model.dart';
import 'package:youfit/screen/all_layout.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();

}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? mailusername;
  String? mdp;

  Future<void> submitForm() async{
    if (formKey.currentState!.validate()) {
      try{
        formKey.currentState?.save();
        Map result = await Provider.of<UserProvider>(
          context,
          listen: false,
        ).login(mailusername, mdp);
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(result['message']),
            ),
        );
        if(result['statusCode'] == 200){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ProgramScreen(user: result['user'], isFavoritePage: false,)), (route) => false);
        }
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
      body: Form(
        key: formKey,
        child: Stack(
          children:  [
            const Background(),
            Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('img/bg-circle.png'),
                alignment: FractionalOffset.topCenter,
              ),
            ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const LogoSection(),
                  LoginSection(
                    mailcallback:(value) => mailusername = value, 
                    mdpcallback: (value) => mdp = value,
                    submitcallback: () => submitForm(),
                  ),
                  const QuestionSection(),
                ],
              ),
            )
            ,
          ],
        ),
      )
      ,
    );
  }
}

class LoginSection extends StatelessWidget {
  final void Function(String?)? mailcallback;
  final void Function(String?)? mdpcallback;
  final void Function()? submitcallback;

  LoginSection({Key? key, required this.mailcallback, required this.mdpcallback, required this.submitcallback}) : super(key: key);


  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          champsTextes(
            "Adresse Mail ou Nom d'utilisateur", 
            Icons.person_outline, 
            false,
            mailcallback,
            (value) {
              if(value == null || value.isEmpty){
                return "Renseigner un nom d'utilisateur ou un email.";
              }
              return null;
            }
          ),
          const SizedBox(height: 20,),
          champsTextes(
            "Mot de passe ", 
            Icons.lock_outlined, 
            true,
            mdpcallback,
            (value) {
              if(value == null || value.isEmpty){
                return "Renseigner un mot de passe.";
              }
              return null;
            }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgetPassword()))
                }, 
                child: const Text(
                  'Mot de passe oublié ?',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'PT Sans',
                      fontSize: 13),
                ))
            ],
          ),
          const SizedBox(height: 20,),
          SizedBox(
            width: 325,
            child: FloatingActionButton.extended(
              backgroundColor: const Color.fromARGB(1000, 0, 232, 51),
              hoverColor: const Color.fromARGB(255, 0, 255, 55),
              onPressed: submitcallback,
              label: const Text(
                'CONNEXION',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'PT Sans',
                ),
              ),
            ),
          ),
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
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
            image: const AssetImage('img/bg-login.jpg'),
            alignment: FractionalOffset.topCenter,
          ),
        ),
      ),
    ]);
  }
}

class LogoSection extends StatelessWidget {
  const LogoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    width: 35,
                  ),
                ),
              ),
            ],
          )),
    ]);
  }
}

class QuestionSection extends StatelessWidget {
  const QuestionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding:  const EdgeInsets.only(bottom: 400), 
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
              },
              child: const Text(
                'Créer un compte ->',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'PT Sans',
                    fontSize: 13),
              )),
        ],
      ),
        )
        ,
    );
  }
}
