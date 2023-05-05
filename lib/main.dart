// import 'package:flutter/material.dart';
// import 'package:proj1/login.dart';
// import 'package:proj1/signup.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Initialproj',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomePage(),
//     );
//   }
// }

// // class login extends StatefulWidget {
// //   const login({Key? key}) : super(key: key);

// //   @override
// //   State<login> createState() => _loginState();
// // }

// // class _loginState extends State<login> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       TextEditingController _emailcontroller = TextEditingController()
// //       appBar: AppBar(
// //         title: Center(child: Text('login')),
// //         backgroundColor: Color.fromARGB(255, 240, 132, 85),
// //       ),
// //       body: Center(
// //           child: Column(
// //         children: [
// //           SizedBox(
// //             height: MediaQuery.of(context).size.height / 8,
// //           ),
// //           Text(
// //             'Login',
// //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //           ),
// //           SizedBox(
// //             height: MediaQuery.of(context).size.height / 8,
// //           ),
// //           Text(
// //             'Enter email:',
// //             style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
// //           ),
// //           TextField(

// //             controller: _emailcontroller,
// //           )
// //         ],
// //       )),
// //     );
// //   }
// // }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Center(child: Text('Home')),
//       //   backgroundColor: Color.fromARGB(255, 76, 174, 250),
//       // ),
//       body: SafeArea(
//           child: Container(
//         width: double.infinity,
//         height: MediaQuery.of(context).size.height,
//         child: Column(
//               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               // crossAxisAlignment: CrossAxisAlignment.center,
//                children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height / 8,
//               ),
//               Text(
//                 'Welcome',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//               )
//             ]),
//             Container(
//               height: MediaQuery.of(context).size.height / 3,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                 image: AssetImage('assets/images/globe.png'),
//                 // fit: BoxFit.cover
//               )),
//             ),
//             Column(
//               children: [
//                 MaterialButton(
//                   minWidth: double.infinity,
//                   height: 60,
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => LoginPage()));
//                   },
//                   shape: RoundedRectangleBorder(
//                     side: BorderSide(
//                       color: Colors.black,
//                     ),
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   child: Text(
//                     'Login',
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,),
//                 Container(
//                   padding: EdgeInsets.only(top: 3, left: 3),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50),
//                       border: Border(
//                         bottom: BorderSide(color: Colors.black),
//                         top: BorderSide(color: Colors.black),
//                         left: BorderSide(color: Colors.black),
//                         right: BorderSide(color: Colors.black),
//                       )),
//                   child: MaterialButton(
//                     minWidth: double.infinity,
//                     height: 60,
//                     onPressed: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => signup()));
//                     },
//                     color: Color.fromARGB(255, 109, 173, 218),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(50),
//                     ),
//                     child: Text(
//                       'Sign up',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proj1/signup_screen.dart';
import 'package:proj1/loginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page',style: TextStyle(fontSize:30 ),),
        backgroundColor: Color.fromARGB(255, 185, 112, 177),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                'Map Translations',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            
            Container(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 3.1),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 185, 112, 177)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loginPage()));
                      },
                      child: Text('Login')),
                ),
                SizedBox(
                  width: 20,),
                Center(
                  child: Container(
                    width: 20,
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 185, 112, 177)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => signup_screen()));
                      },
                      child: Text('Sign-Up')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}