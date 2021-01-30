import 'package:dotslash/diseaseInfo/HomeRemediesInfo.dart';
import 'package:dotslash/diseaseInfo/RemedyInfoPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemedyPage extends StatefulWidget {
  @override
  RemedyPageState createState() => RemedyPageState();
}

class RemedyPageState extends State<RemedyPage> {
  row_of_remedy_list(int _index) {
    List<String> remedy = [
      homeRemedy[_index][0],
      homeRemedy[_index][1],
      homeRemedy[_index][2],
    ];
    return Card(
      child: InkWell(
        child: Container(
          padding: EdgeInsets.all(0),
          // height: 50.0,
          width: MediaQuery.of(this.context).size.width - 20,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                remedy[1],
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Color.fromRGBO(229, 33, 103, 0.52),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onTap: () {
          Navigator.push(
            this.context,
            // ignore: missing_return
            MaterialPageRoute(
              builder: (context) => RemedyInfoPage(),
              settings: RouteSettings(arguments: remedy),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                row_of_remedy_list(0),
                row_of_remedy_list(1),
                row_of_remedy_list(2),
                row_of_remedy_list(3),
                row_of_remedy_list(4),
                row_of_remedy_list(5),
                row_of_remedy_list(6),
                row_of_remedy_list(7),
                row_of_remedy_list(8),
                row_of_remedy_list(9),
                row_of_remedy_list(10),
                row_of_remedy_list(11),
                row_of_remedy_list(12),
                row_of_remedy_list(13),
                row_of_remedy_list(14),
                row_of_remedy_list(15),
                row_of_remedy_list(16),
                row_of_remedy_list(17),
              ]),
        ),
      ),
    );
  }
}
