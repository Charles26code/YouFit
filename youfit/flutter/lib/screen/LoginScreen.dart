import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:youfit/screen/Login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _page_visible = false;

  @override
  void initState(){
    super.initState();
    _navigatetohome();
    _pageanimation();
  }

  _pageanimation()async{
    await Future.delayed(const Duration(milliseconds: 300), () {});
    setState(() {
      _page_visible = !_page_visible;
    });
  }

  _navigatetohome()async{
    await Future.delayed(const Duration(milliseconds: 3500), () {});
    Navigator.pushReplacement(context, _createRoute());
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Login(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 2000), 
        opacity: _page_visible ? 1.0 : 0.0, 
        child: Scaffold(
          body: Stack(
            children: const [Background(), LogoSection()],
          ),
        ),
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


