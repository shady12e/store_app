import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app_2/constens.dart';
import 'package:store_app_2/customs/elevated_buttom.dart';
import 'package:store_app_2/customs/text_fild_customs.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;

  String? password;

  bool isObserver = true;

  void toggleIsObservis() {
    setState(() {
      isObserver = !isObserver;
    });
  }

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
                const SizedBox(
                  height: 100,
                ),
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
                      'Login',
                      style: TextStyle(
                        color: KPriymryColor,
                        fontSize: 50,
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
                      return 'You must put your Email';
                    }
                  },
                  labelText: 'Email',
                  icon: Icons.email,
                  onchange: (data) {
                    email = data;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomtextField(
                  obscure: isObserver,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'You must put your Password';
                    }
                  },
                  seffixicon: IconButton(
                    onPressed: () {
                      toggleIsObservis();
                    },
                    icon: (isObserver == true
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility)),
                    color: KPriymryColor,
                  ),
                  labelText: 'Password',
                  icon: Icons.lock,
                  onchange: (data) {
                    password = data;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomElevatedButtoms(
                  ontap: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        await signInWithEmailAndPassworrd();
                        showSnakeBar(context, 'sucess', Colors.green);
                        Navigator.pushNamed(context, 'HomeScreenState');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnakeBar(
                              context, 'The Email Not found', Colors.red);
                        } else if (e.code == 'wrong-password') {
                          showSnakeBar(context, 'wrong password', Colors.red);
                        }
                      }
                    }
                  },
                  text: 'Login',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('if you did\'t have account ?'),
                    TextButton(
                      onPressed: () {
                        // press of navigate to register screen
                        Navigator.pushNamed(context, 'RegisterScreen');
                      },
                      child: const Text(
                        'RIGESTER HERE',
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

  Future<void> signInWithEmailAndPassworrd() async {
    // ignore: unused_local_variable
    UserCredential credential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
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
