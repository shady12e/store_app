// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app_2/constens.dart';
import 'package:store_app_2/customs/elevated_buttom.dart';
import 'package:store_app_2/customs/text_fild_customs.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  String? email;
  String? password;
  String? userName;
  String? LastName;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: KbackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(),
                Image.asset(
                  'assets/images/imag.png',
                  height: 200,
                  width: 200,
                ),
                const Text(
                  'SHADY STORE',
                  style: TextStyle(
                    fontSize: 40,
                    color: KPriymryColor,
                    fontFamily: Kprimaryfont,
                  ),
                ),
                const SizedBox(height: 40),
                const Row(
                  children: [
                    Text(
                      'REGISTER',
                      style: TextStyle(
                        color: KPriymryColor,
                        fontSize: 35,
                        fontFamily: Kprimaryfont,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomtextField(
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'you must put your lastName';
                    }
                  },
                  labelText: 'Name',
                  onchange: (data) {
                    userName = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomtextField(
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'you must put your lastName';
                    }
                  },
                  labelText: 'LastName',
                  onchange: (data) {
                    LastName = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomtextField(
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'you must put your Email';
                    }
                  },
                  labelText: 'Email',
                  onchange: (data) {
                    email = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomtextField(
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'you must put your Password';
                    }
                  },
                  labelText: 'Password',
                  onchange: (data) {
                    password = data;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomElevatedButtoms(
                  ontap: () async {
                    if (formKey.currentState!.validate()) 
                    {
                      try {
                          await createUser();
                          showSnakeBar(context, 'sucess', Colors.green);
                          Navigator.pop(context);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showSnakeBar(context, 'weak password', Colors.red);
                          } else if (e.code == 'email-already-in-use') {
                            showSnakeBar(context, 'The Email is already Taken',
                                Colors.red);
                          }
                        } catch (e) {
                          showSnakeBar(context, '$e', Colors.red);
                        }
                    }
                  },
                  text: 'Resgister',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('if you already have account ?'),
                    TextButton(
                      onPressed: () {
                        // press of navigate to register screen
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'LOGIN HERE',
                        style: TextStyle(
                          color: KPriymryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
Future<void> createUser() async {
    // ignore: unused_local_variable
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
  void showSnakeBar(BuildContext context, String massage, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(massage),
      ),
    );
  }
  
}

                      