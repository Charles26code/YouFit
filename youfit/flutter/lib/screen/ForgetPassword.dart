import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youfit/reusable_widgets/widget_general.dart';
import 'package:provider/provider.dart';
import 'package:youfit/models/user_provider.dart';
import 'package:youfit/models/user_model.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? mailusername;
  String? mdp;
  String? confirmmdp;

  Future<void> submitForm() async{
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();
      if(mdp != confirmmdp){
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text("Les mots de passes de correspondent pas."),
            ),
        );
      }else{
        try{
          Map? result = await Provider.of<UserProvider>(
            context,
            listen: false,
          ).changePassword(mailusername, mdp);
          if(result != null){
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(result['message']),
                ),
            );
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LogoSection(),
                  MailSection(
                    mailcallback: (value) => mailusername = value,
                    mdpcallback: (value) => mdp = value,
                    confirmmdpcallback: (value) => confirmmdp = value,
                    submitcallback: () => submitForm(),
                  ),
                ],
              ),
            )
            
          ],
        ),
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
  final void Function(String?)? mailcallback;
  final void Function(String?)? mdpcallback;
  final void Function(String?)? confirmmdpcallback;
  final void Function()? submitcallback;


  const MailSection({Key ? key, required this.mailcallback, required this.submitcallback, required this.mdpcallback, required this.confirmmdpcallback}) : super(key : key);

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
            "Mot de passe", 
            Icons.lock_outlined, 
            true, 
            mdpcallback,
            (value){
              if(value == null || value.isEmpty){
                return "Renseignez un mot de passe";
              }
              if(value.length < 8){
                return "Le mot de passe doit contenir au moin 8 caractères.";
              }
              return null;
            }
          ),
          
          const SizedBox(height: 20,),
          champsTextes(
            "Confirmer le mot de passe", 
            Icons.lock_outlined, 
            true, 
            confirmmdpcallback,
            (value){
              if(value == null || value.isEmpty){
                return "Renseignez un mot de passe.";
              }
              if(value.length < 8){
                return "Le mot de passe doit contenir au moin 8 caractères.";
              }
              return null;
            } 
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(bottom: 450), 
            child: SizedBox(
              width: 325,
              child: FloatingActionButton.extended(
                backgroundColor: const Color.fromARGB(1000, 0, 232, 51),
                hoverColor: const Color.fromARGB(255, 0, 255, 55),
                onPressed: submitcallback,
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