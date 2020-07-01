import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider3/easypage.dart';
import 'package:provider3/harpage.dart';
import 'package:provider3/medium.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            RaisedButton(
              child: Text("EASY", style: TextStyle(
                color: Colors.white, fontSize: 25
              ),),
              color: Colors.black,
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EasyPage()
                ));
              },
            ),
            RaisedButton(
              child: Text("MEDIUM", style: TextStyle(
                  color: Colors.white, fontSize: 25
              ),),
              color: Colors.black,
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Medium()
                ));
              },
            ),
            RaisedButton(
              child: Text("HARD", style: TextStyle(
                  color: Colors.white, fontSize: 25
              ),),
              color: Colors.black,
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HardPage()
                ));
              },
            )
          ],
        ),
      )
    );
  }
}



