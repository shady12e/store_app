import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app_2/firebase_options.dart';
import 'package:store_app_2/provider/card_provider.dart';
import 'package:store_app_2/provider/favorite_provider.dart';
import 'package:store_app_2/screens/login_screen.dart';
import 'package:store_app_2/screens/register_screen.dart';
import 'package:store_app_2/screens/update_screen.dart';
import 'package:store_app_2/state/home_screen_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => CardProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'LoginScreen': (context) => LoginScreen(),
          'RegisterScreen': (context) => RegisterScreen(),
          'HomeScreenState': (context) => HomeScreenState(),
          'UpdateScreen': (context) => UpdateScreen(),
        },
        initialRoute: 'LoginScreen',
      ),
    );
  }
}
