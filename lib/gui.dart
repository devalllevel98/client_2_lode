
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:olymetagame/menu.dart';


class Guiline extends StatefulWidget {
  // const Guiline({Key? key}) : super(key: key);

  @override
  State<Guiline> createState() => _GuilineState();
}

class _GuilineState extends State<Guiline> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hướng Dẫn',
          style: TextStyle(color: Color.fromARGB(255, 254, 4, 0),fontWeight: FontWeight.bold, fontFamily: "impact", fontSize: 25),

              ),
          backgroundColor: Color.fromARGB(255, 110, 213, 251),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 18, 18, 18)),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainMenuScreen()),
              );
            },
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
              "assets/gui.png",
              fit: BoxFit.fill,
            ))
          ],
        ),
      ),
    );
  }
}
