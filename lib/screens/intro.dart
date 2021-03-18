import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key? key}) : super(key: key);

  @override
  IntroState createState() => IntroState();
}

class IntroState extends State<IntroPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Intro screen here',
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/menu");
              },
              child: Text('Start!'),
            ),
          ],
        ),
      ),
    );
  }
}
