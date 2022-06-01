import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:youfit/models/exercice_model.dart';
import 'package:youfit/models/exercice_provider.dart';
import 'package:youfit/models/user_model.dart';
// import 'model/exercices_provider.dart';

class FromView extends StatefulWidget {
  const FromView({Key? key}) : super(key: key);
  @override
  State<FromView> createState() => _FromViewState();
}

class _FromViewState extends State<FromView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  late Exercice newProfile;
  String? email;
  DateTime? birthdate;
  @override
  void initState() {
    newProfile = User(
      email: '',
      password: '',
      username: '',
    ) as Exercice;
    super.initState();
  }

  // void setDate() {
  //   showDatePicker(
  //     context: context,
  //     firstDate: DateTime(1900),
  //     initialDate: DateTime(1990),
  //     lastDate: DateTime.now(),
  //   ).then((pickDate) {
  //     if (pickDate != null) {
  //       setState(() {
  //         birthdate = pickDate;
  //         newProfile.birthdate = DateFormat('dd/MM/yyyy').format(birthdate!);
  //       });
  //     }
  //   });
  // }

// Modification du type de retour de la m ́ethode
  Future<void> submitForm() async {
    try {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        await Provider.of<ExercicesProvider>(
          context,
          listen: false,
        );
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text("Le profile de ${newProfile.id} a  été ajouté !"),
            ),
          );
      }
    } catch (e) {
      print("error !");
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(hintText: 'Email'),
                onSaved: (value) => newProfile.email = value!,
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Password'),
                onSaved: (value) => newProfile.password = value!,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('PHONE NUMBER'),
                  const SizedBox(width: 100),
                  // Expanded(
                  //   child: TextFormField(
                  //     keyboardType: TextInputType.phone,
                  //     autofillHints: const [
                  //       AutofillHints.telephoneNumberNational
                  //     ],
                  //     decoration: const InputDecoration(hintText: '0000000000'),
                  //     onSaved: (value) => newProfile.phonenumber = value!,
                  //   ),
                  // ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('EMAIL ADDRESS'),
                  const SizedBox(width: 100),
                  Expanded(
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.email],
                      decoration:
                          const InputDecoration(hintText: 'email@email.com'),
                      onSaved: (value) => email = value,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitForm,
                child: const Text("SAVE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
