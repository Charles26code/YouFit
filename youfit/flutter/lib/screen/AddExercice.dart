import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddExercice extends StatelessWidget {
  const AddExercice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(1000, 238, 122, 43),
            size: 20,
          ),
          onPressed: () {},
        ),
        title: const Text(
          'FitHub',
          style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
              fontFamily: 'Abel-Regular'),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite_outline_rounded,
              color: Color.fromARGB(1000, 238, 122, 43),
              size: 20,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Color.fromARGB(1000, 238, 122, 43),
              size: 20,
            ),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          LoginText(),
          PhotoSection(),
          InfoSection(),
        ],
      ),
    );
  }
}

// class Background extends StatelessWidget {
//   const Background({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(alignment: Alignment.center, children: <Widget>[
//       Container(
//         decoration: BoxDecoration(
//           color: Colors.black,
//           image: DecorationImage(
//             fit: BoxFit.fill,
//             colorFilter: ColorFilter.mode(
//                 Colors.black.withOpacity(0.2), BlendMode.dstATop),
//             image: const AssetImage('img/fitness.jpg'),
//             alignment: FractionalOffset.topCenter,
//           ),
//         ),
//       ),
//     ]);
//   }
// }

class LoginText extends StatelessWidget {
  const LoginText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60, left: 10),
      child: const Text(
        'Add your own exercise : ',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Color.fromARGB(1000, 238, 122, 43),
          fontFamily: 'Abel-Regular',
          fontSize: 35,
        ),
      ),
    );
  }
}

class PhotoSection extends StatelessWidget {
  const PhotoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // const SizedBox(height: 150),
        Center(
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            height: 150,
            width: 150,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 4,
                  offset: Offset(0, 4),
                )
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: const Icon(
                Icons.photo_camera,
                size: 70,
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 24, 23, 23),
                shape: const CircleBorder(),
                // padding: const EdgeInsets.all(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class InfoSection extends StatelessWidget {
  bool value = false;
  InfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
          child: Column(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 24, 23, 23),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Abel-Regular',
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Abel-Regular',
                        fontSize: 20,
                      ),
                      contentPadding: EdgeInsets.only(left: 20),
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 24, 23, 23),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Abel-Regular',
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Abel-Regular',
                        fontSize: 20,
                      ),
                      contentPadding: EdgeInsets.only(left: 20),
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Difficulty :',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(1000, 238, 122, 43),
                  fontFamily: 'Abel-Regular',
                  fontSize: 30,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CheckboxListTile(
                    activeColor: const Color.fromARGB(1000, 238, 122, 43),
                    title: const Text(
                      'Easy',
                      style: TextStyle(
                        color: Color.fromARGB(255, 24, 23, 23),
                        fontFamily: 'Abel-Regular',
                        fontSize: 20,
                      ),
                    ),
                    value: value,
                    onChanged: (value) => this.value = value!,
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
