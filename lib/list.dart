
import 'package:flutter/material.dart';
import 'package:olymetagame/menu.dart';

class ListSc extends StatelessWidget {
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
            'assets/bg.png',
            fit: BoxFit.fill,
          )),
          // Hình ảnh chính giữa màn hình
          // Loading circle nằm dưới màn hình
         Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Container(
            width: 300, // Đặt kích thước của hình ảnh
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/empty.png'), // Đường dẫn đến tập tin hình ảnh
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20,),
          Text("DANH SÁCH TRỐNG", style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),)

        
            ],
          )

        ),
     
        ],
      ),

      ),
    );
  }
}


