//
import 'package:flutter/material.dart';
import 'previous_posts.dart';
import 'upload_screen.dart';
// import 'package:price_pred/screens/user_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int val = 0;
  var navbar = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: Color.fromARGB(255, 28, 27, 27),
        ),
        label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.menu, color: Color.fromARGB(255, 17, 16, 16)), label: 'Previous Posts'),
    // const BottomNavigationBarItem(
    //     icon: Icon(Icons.person, color: Colors.white), label: 'User'),
  ];
  var navbody = [
    const Upload(),
    const Displayposts(),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // int val = 0;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const SignInScreen(),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: navbody[val],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: val,
          type: BottomNavigationBarType.fixed, // Fixed
          backgroundColor:  Color.fromARGB(255, 202, 195, 237),
          selectedItemColor: Color.fromARGB(255, 28, 26, 26),
          unselectedItemColor: Color.fromARGB(255, 113, 114, 115),
          selectedFontSize: 15,
          unselectedFontSize: 13,
          // fixedColor: Colors.black,
          items: navbar,
          onTap: (value) {
            setState(() {
              val = value;
            });
          },
        ),
      ),
    );
  }
}
