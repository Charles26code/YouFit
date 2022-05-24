// ignore_for_file: unnecessary_const

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          Background(),
          LogoSection(),
          LoginText(),
          LoginSection(),
          QuestionSection(),
        ],
      ),
    );
  }
}

// class Background extends StatelessWidget {
//   const Background({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ShaderMask(
//       shaderCallback: (bounds) => const LinearGradient(
//               colors: [Colors.black, Colors.black12],
//               begin: Alignment.bottomCenter,
//               end: Alignment.center)
//           .createShader(bounds),
//       blendMode: BlendMode.darken,
//       child: Container(
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('img/fitness.jpg'),
//                   fit: BoxFit.cover,
//                   colorFilter:
//                       ColorFilter.mode(Colors.black45, BlendMode.darken)))),
//     );
//   }
// }

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
          padding: const EdgeInsets.only(top: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // padding: const EdgeInsets.only(top: 30),
                child: Image.asset(
                  "img/peach.png",
                  height: 100,
                  width: 100,
                  //color: Color.fromARGB(1000, 238, 122, 43),
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

class LoginText extends StatelessWidget {
  const LoginText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 200, left: 10),
      child: const Text(
        'Sign In ',
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Color.fromARGB(1000, 238, 122, 43),
            fontFamily: 'Rock3D-Regular',
            fontSize: 35,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class LoginSection extends StatelessWidget {
  const LoginSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            children: [
              Expanded(
                  flex: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Colors.white,
                        Color.fromARGB(1000, 238, 122, 43)
                      ]),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                          hintText: 'Username',
                          suffixIcon: Icon(Icons.email),
                          contentPadding: EdgeInsets.only(left: 10, top: 14),
                          border: InputBorder.none),
                    ),
                  )),
              const SizedBox(height: 20),
              Expanded(
                flex: 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Colors.white,
                      Color.fromARGB(1000, 238, 122, 43)
                    ]),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: Icon(Icons.visibility_off),
                        contentPadding: EdgeInsets.only(left: 10, top: 14),
                        border: InputBorder.none),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FloatingActionButton.extended(
                backgroundColor: const Color.fromARGB(1000, 238, 122, 43),
                hoverColor: Colors.deepOrangeAccent,
                onPressed: () {},
                label: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontFamily: 'Abel-Regular',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class QuestionSection extends StatelessWidget {
  const QuestionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(top: 600),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Don\'t have any account ?',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontFamily: 'Abel-Regular', fontSize: 10),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'CREATE ONE',
                style: TextStyle(
                    color: Color.fromARGB(1000, 238, 122, 43),
                    fontFamily: 'Abel-Regular',
                    fontSize: 10),
              )),
        ],
      ),
    ));
  }
}
