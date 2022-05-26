import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youfit/reusable_widgets/widget_general.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              LogoSection(),
              MailSection(),
            ],
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
            image: const AssetImage('img/bg-forget-password.jpg'),
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

class MailSection extends StatelessWidget {
  const MailSection({Key ? key}) : super(key : key);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          champsTextes("Adresse Mail ou Nom d'utilisateur", Icons.person_outline, false),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(bottom: 450), 
            child: SizedBox(
              width: 325,
              child: FloatingActionButton.extended(
                backgroundColor: const Color.fromARGB(1000, 0, 232, 51),
                hoverColor: const Color.fromARGB(255, 0, 255, 55),
                onPressed: () {},
                label: const Text(
                  'CHANGER MON MOT DE PASSE',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'PT Sans',
                  ),
                ),
              ),
            ),
          )
          
        ],
      ),  
    );
  }
}