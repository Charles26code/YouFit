import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [Background(), LogoSection()],
      ),
    );
  }
}

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
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
              image: const AssetImage('img/bg-loginscreen.jpg'),
              alignment: FractionalOffset.topCenter,
            ),
          ),
        ),
        
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('img/bg-circle.png'),
              alignment: FractionalOffset.topCenter,
            ),
          ),
        )
      ]
    );
  }
}

class LogoSection extends StatelessWidget {
  const LogoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: const Text('YOU',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Koulen',
                    fontSize: 50,
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
                    fontSize: 50,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
              
              Container(
                // padding: const EdgeInsets.only(top: 30),
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
          )
        
      ]
    );
  }
}

class LoaderSection extends StatelessWidget {
  const LoaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          size: 140,
          color: Color.fromARGB(1000, 238, 122, 43),
        ),
      ),
    );
  }
}
