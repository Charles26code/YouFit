import 'package:flutter/material.dart';
import 'package:youfit/screen/all_layout.dart';


class CardLanguage extends StatelessWidget {
  final String titre;
  final String niveau;
  final String numniveau;
  final String description;
  final String background;
  final bool pressed;
  final Function updatePressed;
  
  CardLanguage(
  {required this.titre,
  required this.niveau,
  required this.numniveau,
  required this.description,
  required this.background,
  required this.pressed,
  required this.updatePressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.black,
      
      child : InkWell(
        onTap: () {
          showDialogFunc(context, titre, niveau, description, background);
        },

        
        child: Container( 
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5), BlendMode.dstATop),
                image: const AssetImage('img/bg-programcard.jpg'),
            ),

            border: Border.all(
              width: 2,
              color: const Color.fromARGB(255, 108, 108, 108),
            ),
            
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            )

          ),
          height: 120,
          
          child: Container(
            margin: const EdgeInsets.all(8),
            child: Row( 
              children: <Widget>[
                
                Expanded(
                  flex: 8,
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            titre,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Koulen',
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                            )
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            niveau,
                            style: TextStyle(
                              color: numniveau == "1" ? Colors.blue : (numniveau == "2" ? Colors.yellow : Colors.red),
                              fontFamily: 'Koulen',
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            )
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 8,),
                      Row(
                        children: [
                          Expanded(child: 
                            Text(
                              description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Koulen',
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic
                                )
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FavoriteButton(
                            iconColor: Color.fromARGB(1000, 0, 232, 51),
                            isFavorite: pressed,
                            iconSize: 40,
                            //iconDisabledColor: Colors.white,
                            valueChanged: updatePressed,
                          ),
                        ],
                      ),
                      
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

showDialogFunc(context, titre, niveau, description, background){
  return showDialog(
    context: context,
    builder: (context){
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 208, 208, 208),
            ),
            padding: EdgeInsets.all(2),
            width: MediaQuery.of(context).size.width * 0.7,
            height: 420,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'img/bg-programcard.jpg',
                    width: 250,
                    height: 250,
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  titre,
                  style: const TextStyle( 
                    color: Colors.black,
                    fontFamily: 'Koulen',
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )
                ),
                const SizedBox(height: 10,),
                Text(
                  niveau,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 110, 72, 72),
                    fontFamily: 'Koulen',
                    fontSize: 17,
                    //fontWeight: FontWeight.bold
                    //fontStyle: FontStyle.italic
                  )
                ),
                const SizedBox(height: 20,),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Koulen',
                    fontSize: 15,
                    fontStyle: FontStyle.italic
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    }
  );
}