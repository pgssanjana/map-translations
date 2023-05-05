import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:proj1/login.dart';
import 'package:proj1/home.dart';

class signup extends StatelessWidget {
  // var nameval = TextEditingController();
  // var emailval = TextEditingController();
  // var passval = TextEditingController();
  String nameval = '', emailval = '', passval = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SIGN UP PAGE'),
        backgroundColor: Colors.blueGrey,
        // debugShowCheckedModeBanner: false,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 300,
            child: TextField(
              // controller: nameval,
              onChanged: (value) {
                nameval = value;
              },
              decoration: InputDecoration(
                  hintText: 'Enter name',
                  prefixIcon: Icon(Icons.abc),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'E-Mail',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 300,
            child: TextField(
              // controller: emailval,
              onChanged: (value) {
                emailval = value;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Enter email id',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Password',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 300,
            child: TextField(
              obscureText: true,
              // controller: passval,
              onChanged: (value) {
                passval = value;
              },
              decoration: InputDecoration(
                  hintText: 'Enter password',
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
          Container(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () async {
                // String name = nameval.text;
                // String email = emailval.text;
                // String password = passval.text;
                // print("Name-$nameval, Email-$emailval, Password-$passval");
                try {
                  UserCredential userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: emailval, password: passval);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Text('Sign-Up'))
        ],
      ),
    );
  }
}