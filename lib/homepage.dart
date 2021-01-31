import 'package:dotslash/services/chatbot.dart';
import 'package:dotslash/services/maplauncher.dart';
import 'package:dotslash/services/ourteam.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dotslash/symptoms/symptomsInput.dart';
import 'services/disease_predict_model.dart';
import 'services/email_login.dart';
import 'package:dotslash/diseaseInfo/RemedyPage.dart';
import 'package:dotslash/displayEvents/showEvents.dart';

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
    user = _auth.currentUser;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aarogyam Cure"),
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
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: Image.asset(
                    "assets/logo.png",
                    width: 137,
                    height: 137,
                  ))
                ],
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(14, 49, 80, 1),
              ),
              // accountName: Text("${user?.displayName}"),
              // accountEmail: Text("${user?.email}"),
              /*decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  //image: NetworkImage("${user?.photoUrl}"),
                ),
              ),*/
            ),
            ListTile(
              title: Text('Symptoms Check'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SymptomsInput()),
                );
              },
            ),
            ListTile(
              title: Text('Events'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShowEvents()),
                );
              },
            ),
            ListTile(
              title: Text('doctor near me'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyMap()),
                );
              },
            ),
            ListTile(
              title: Text('chat with doctor'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyBot()),
                );
              },
            ),
            ListTile(
              title: Text('Home remedies'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RemedyPage()),
                );
              },
            ),
            ListTile(
              title: Text('About us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OurTeam()),
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
              SizedBox(
                height: 10,
              ),
              Card(
                child: InkWell(
                    child: Text("Skin Dieses Prediction"),
                    onTap: () {
                      Navigator.push(
                        this.context,
                        // ignore: missing_return
                        MaterialPageRoute(
                          builder: (context) => ML_Model(),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                child: InkWell(
                    child: Text("Doctor near me"),
                    onTap: () {
                      Navigator.push(
                        this.context,
                        // ignore: missing_return
                        MaterialPageRoute(
                          builder: (context) => MyMap(),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                child: InkWell(
                    child: Text("Chatbot"),
                    onTap: () {
                      Navigator.push(
                        this.context,
                        // ignore: missing_return
                        MaterialPageRoute(
                          builder: (context) => MyBot(),
                        ),
                      );
                    }),
              ),
            ]),
      ),
    );
  }
}
