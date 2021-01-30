import 'package:flutter/material.dart';

class RemedyInfoPage extends StatefulWidget {
  @override
  _RemedyInfoPageState createState() => _RemedyInfoPageState();
}

class _RemedyInfoPageState extends State<RemedyInfoPage> {
  @override
  Widget build(BuildContext context) {
    final List<String> remedy = ModalRoute.of(context).settings.arguments;

    return Container(
      child: AlertDialog(
        contentPadding: EdgeInsets.all(8),
        insetPadding: EdgeInsets.all(8),
        title: Center(
          child: Text(
            "Plant Name : " + remedy[0],
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        content: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Common Name : " + remedy[1],
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Uses",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    remedy[2],
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: RaisedButton(
                    child: Text(
                      'Go Back',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
