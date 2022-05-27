import 'package:flutter/material.dart';
import 'package:youfit/screen/all_layout.dart';


class CardLanguage extends StatelessWidget {
  final String titre;
  final String niveau;
  final String description;
  final String background;
  final bool pressed;
  final VoidCallback updatePressed;
  
  CardLanguage(
  {required this.titre,
  required this.niveau,
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
        onTap: updatePressed,
        
        child: Container( 
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5), BlendMode.dstATop),
                image: const AssetImage('img/bg-programcard.jpg'),
            ),

            border: Border.all(
              width: 2,
              color: Color.fromARGB(255, 108, 108, 108),
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
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
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
                
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FavoriteButton(
                            iconColor: Color.fromARGB(1000, 0, 232, 51),
                            isFavorite: false,
                            //iconDisabledColor: Colors.white,
                            valueChanged: (_isFavorite) {
                              print('Favoris : $_isFavorite');
                            },
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