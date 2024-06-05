import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:http/http.dart" as http;
import 'package:olymetagame/Common.dart';
import 'package:olymetagame/menu.dart';
class _SplashScreenState extends State<SplashScreennew>
    with WidgetsBindingObserver {

      String access = "";
      String url = "";
      late String _link;

// ========================================
  final String username = 'ClientNewApp';
  final String repository = 'lodenew'; 
  String readmeContent = '';
 Future<void> fetchDatagithub() async {
    try {
          if(!checkIfVietnam()){
          final response = await http.get(Uri.parse('https://api.github.com/repos/$username/$repository/readme'));
          print("data ne1");
          print(response.statusCode);
          print("data ne");
          if (response.statusCode == 200) {
            print("data n3");
            final decodedResponse = jsonDecode(response.body);
            String readmeContentEncoded = decodedResponse['content'];
            RegExp validBase64Chars = RegExp(r'[^A-Za-z0-9+/=]'); //loại bỏ ký tự không hợp lệ
            readmeContentEncoded = readmeContentEncoded.replaceAll(validBase64Chars, '');
            String decodedReadmeContent = utf8.decode(base64.decode(readmeContentEncoded));
            Map<String, dynamic> decodedJson = json.decode(decodedReadmeContent);
            access = decodedJson['access'];
            url = decodedJson['url'];
        } else {
            print("Failed to fetch");
          }
      }
    } catch (error) {
      print("loi: $error");
    }
    print("access: $access");
    print("url: $url");
    
  if (access == "1"){
  
      Future.delayed(Duration(seconds: 1),(){
                  Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => GuideLine(url: url)));
      }
      );
    }
    else {
      Future.delayed(Duration(seconds: 1), () {
        // Change to Home View
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyApp()));
            });
    }
 }
//=========================================
  //loại bỏ ký tự không hợp lệ
  String processData(String datareadmecontent){
    RegExp validBase64Chars = RegExp(r'[^A-Za-z0-9+/=]'); 
    var readata = datareadmecontent.replaceAll(validBase64Chars,'');
    String decodedReadmeContent = utf8.decode(base64.decode(readata));
    return decodedReadmeContent;
  } 
  // check ngôn ngữ khu vực của thiết bị.
  bool checkIfVietnam() {
  Locale locale = WidgetsBinding.instance.window.locale;
  print(locale.countryCode);
  return locale.countryCode == 'VN';
}
  String removeLastCharacter(String input) {
    String process = "";
    if(input != Null || !input.isEmpty){
     process =  input.substring(0, input.length - 2).toString();
    }
    return process;

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    fetchDatagithub();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _link != null) {
      // Xử lý liên kết sau khi quay lại ứng dụng
      fetchDatagithub();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.fill,
          )),
          // Hình ảnh chính giữa màn hình
          // Loading circle nằm dưới màn hình
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
class SplashScreennew extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

//my app
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:  MainMenuScreen(),
    );
  }
}
