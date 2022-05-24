import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    return Stack(alignment: Alignment.center, children: <Widget>[
      Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: const AssetImage('img/fitness.jpg'),
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
          padding: const EdgeInsets.only(top: 250),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  "img/peach.png",
                  height: 100,
                  width: 100,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: const Text('Fit',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Abel-Regular',
                        fontSize: 50)),
              ),
              Expanded(
                flex: 0,
                child: Container(
                  padding: const EdgeInsets.only(top: 8),
                  height: 80,
                  width: 80,
                  // padding: const EdgeInsets.only(top: 80),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(1000, 238, 122, 43),
                      borderRadius: BorderRadius.circular(20)),
                  //padding: const EdgeInsets.all(10),
                  child: const Text('hub',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Abel-Regular',
                          fontSize: 50,
                          fontWeight: FontWeight.bold)),
                ),
              )
            ],
          )),
    ]);
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
