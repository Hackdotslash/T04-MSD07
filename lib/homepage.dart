import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dotslash/symptoms/symptomsInput.dart';
import 'services/email_login.dart';
import 'package:dotslash/diseaseInfo/RemedyPage.dart';
import 'Symptoms/symptomsInput.dart';
import 'services/email_login.dart';
import 'package:dotslash/diseaseInfo/RemedyPage.dart';


import 'email_login.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aarogyaam Cure"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () => _auth.signOut().then(
              (res) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => EmailLogIn()),
                    (Route<dynamic> route) => false);
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        elevation: 10.0,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("${user?.displayName}"),
              accountEmail: Text("${user?.email}"),
              /*decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  //image: NetworkImage("${user?.photoUrl}"),
                ),
              ),*/
            ),
            ListTile(
              title: Text('Predict'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SymptomsInput()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                child: InkWell(
                    child: Text("Home Remedies"),
                    onTap: () {
                      Navigator.push(
                        this.context,
                        // ignore: missing_return
                        MaterialPageRoute(
                          builder: (context) => RemedyPage(),
                        ),
                      );
                    }),
              ),
            ]),
      ),
    );
  }
}
