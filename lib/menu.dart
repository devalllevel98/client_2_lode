import 'package:flutter/material.dart';
import 'package:olymetagame/Common.dart';
import 'dart:async';
import 'dart:math';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olymetagame/gui.dart';
import 'package:olymetagame/homepagecontroller.dart';
import 'package:get/get.dart';
import 'package:olymetagame/list.dart';
class MainMenuScreen extends StatefulWidget {
  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {

  @override
  void initState() {
    super.initState();
    // Khởi tạo audioPlayer ở đây
// Bắt đầu phát nhạc nền khi màn hình được tạo ra
  }

  @override
  void dispose() {
    // Giải phóng bộ nhớ khi không cần thiết

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/bgmenu.png',
                fit: BoxFit.fill,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 200,),
                Expanded(
                  child: Center(
                    child: GridView.count(
                      crossAxisCount: 2, // Số cột trong grid
                      crossAxisSpacing: 20.0, // Khoảng cách giữa các cột
                      mainAxisSpacing: 20.0, // Khoảng cách giữa các dòng
                      padding: EdgeInsets.all(20.0), // Khoảng cách lề xung quanh grid
                      children: <Widget>[
                        _buildMenuItem(
                          label: 'Xổ Số',
                          imagePath: 'assets/start1.png',
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen()),
                            );
                          },
                        ),
                        _buildMenuItem(
                          label: 'Danh Sách Số',
                          imagePath: 'assets/scoreboard1.png',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ListSc()),
                            );
                          },
                        ),
                        _buildMenuItem(
                          label: 'Quy Tắc Trò Chơi',
                          imagePath: 'assets/rule1.png',
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Guiline()),
                            );
                          },
                        ),
                        _buildMenuItem(
                          label: 'Thoát Trò Chơi',
                          imagePath: 'assets/quit1.png',
                          onTap: () {
                            exit(0);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({required String label, required String imagePath, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0), // Độ cong của viền
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // Màu và độ mờ của shadow
              blurRadius: 5, // Độ mờ của shadow
              offset: Offset(0, 2), // Độ dịch chuyển của shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 130,
              height: 130,
            ),
            // SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
