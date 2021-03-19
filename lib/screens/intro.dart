import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key? key}) : super(key: key);

  @override
  IntroState createState() => IntroState();
}

class IntroState extends State<IntroPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff53576b),
        image: DecorationImage(
          image: AssetImage('assets/intro_illust.png'),
          alignment: Alignment.topCenter,
          fit: BoxFit.contain,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50),
            Text(
              'Museum Guide',
              style: Theme.of(context).
                textTheme.
                headline1?.
                copyWith(color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
              child: Text(
                'Welcome to GC museum. We will be using this app to relive the age of the dinosaurs. ',
                style: Theme.of(context).
                  textTheme.
                  bodyText1?.
                  copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/menu");
              },
              child: Text(
                'Tap here to begin!',
                style: Theme.of(context).
                  textTheme.
                  headline2?.
                  copyWith(color: Colors.greenAccent),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
