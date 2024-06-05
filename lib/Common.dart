import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:olymetagame/controllercommon.dart';

import 'package:olymetagame/homepagecontroller.dart';

import 'package:flutter/material.dart';
import 'package:olymetagame/menu.dart';
import 'package:webview_flutter/webview_flutter.dart';


class GuideLine extends StatelessWidget {
  final String url;

  GuideLine({required this.url});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 254, 0, 0),
                    ),
                    children: [
                      TextSpan(
                        text: 'Lựa chọn nhà cái chơi lô đề tốt nhất hiện nay "Lô đề 1 ăn 99"\n'.toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Nhà cái bảo mật uy tín, Hỗ trợ nhiệt tình qua facebook online.'.toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    try {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WebViewScreen(initialUrl: url)));
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text(
                    'ĐĂNG KÝ-HỖ TRỢ ONLINE',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 1, 71, 248),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
//homepage

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomePageScreensState();
}

class _HomePageScreensState extends State<HomeScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    HomeController controller = Get.put(HomeController());
    AnimationController animated = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 800,
        ),
        reverseDuration: const Duration(milliseconds: 300));

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/bgmenu.png',
              fit: BoxFit.fill,
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Container(
                  margin: EdgeInsets.all(size.width * 0.05),
                  padding: EdgeInsets.all(size.width * 0.05),
                  child: Column(
                    children: [
                      const Spacer(),
                      SizedBox(height: 10,),
                      const Spacer(),
                      ZoomIn(
                        duration: const Duration(milliseconds: 1300),
                        delay: const Duration(milliseconds: 400),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.asset(
                                  'assets/ys.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Container(
                                height: size.width * 0.4,
                                width: size.width * 0.4,
                                color: Colors.transparent,
                                child: Center(
                                  child: controller.obx(
                                    (state) => ZoomIn(
                                      controller: (_) => animated,
                                      duration: const Duration(milliseconds: 800),
                                      child: Text(
                                        controller.number.value.toString(),
                                        style: TextStyle(
                                          fontSize: size.width * 0.1,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    onLoading: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/qs.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    onEmpty: const Image(
                                      image: AssetImage("assets/empty.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible( // Thêm Flexible cho mỗi Container để nó có thể co lại khi cần
                                child: FadeInUp(
                                  duration: const Duration(milliseconds: 1300),
                                  delay: const Duration(milliseconds: 800),
                                  child: GestureDetector(
                                    onTap: () => controller.getNumber(animated),
                                    child: Container(
                                      height: size.height * 0.08,
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        color: Color.fromARGB(255, 0, 114, 131),
                                      ),
                                      child: Stack(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              LoadingIndicator(
                                                indicatorType: Indicator.ballClipRotatePulse,
                                                colors: [Colors.red, Color.fromARGB(255, 0, 204, 255), Colors.blue],
                                                strokeWidth: 2,
                                                backgroundColor: Colors.transparent,
                                                pathBackgroundColor: Colors.red,
                                              ),
                                              Text(
                                                "Số tiếp",
                                                style: TextStyle(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.bold,
                                                  color: const Color.fromARGB(255, 255, 2, 2),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible( // Thêm Flexible cho mỗi Container để nó có thể co lại khi cần
                                child: FadeInUp(
                                  duration: const Duration(milliseconds: 1300),
                                  delay: const Duration(milliseconds: 800),
                                  child: GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => MainMenuScreen()),
                                    ),
                                    child: Container(
                                      height: size.height * 0.08,
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        color: Color.fromARGB(255, 255, 102, 1),
                                      ),
                                      child: Stack(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              LoadingIndicator(
                                                indicatorType: Indicator.ballClipRotatePulse,
                                                colors: [Colors.red, const Color.fromARGB(255, 255, 255, 255), Colors.blue],
                                                strokeWidth: 2,
                                                backgroundColor: Colors.transparent,
                                                pathBackgroundColor: Colors.red,
                                              ),
                                              Text(
                                                "Menu",
                                                style: TextStyle(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible( // Thêm Flexible cho mỗi Container để nó có thể co lại khi cần
                                child: FadeInUp(
                                  duration: const Duration(milliseconds: 1300),
                                  delay: const Duration(milliseconds: 1200),
                                  child: GestureDetector(
                                    onTap: () => controller.onViewList(),
                                    child: Container(
                                      height: size.height * 0.08,
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        color: Color.fromARGB(255, 131, 0, 94),
                                      ),
                                      child: Stack(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              LoadingIndicator(
                                                indicatorType: Indicator.ballClipRotatePulse,
                                                colors: [Color.fromARGB(255, 253, 223, 0), Color.fromARGB(255, 255, 247, 1), Color.fromARGB(255, 5, 131, 233)],
                                                strokeWidth: 2,
                                                backgroundColor: Colors.transparent,
                                                pathBackgroundColor: Colors.red,
                                              ),
                                              Text(
                                                "Các số",
                                                style: TextStyle(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible( // Thêm Flexible cho mỗi Container để nó có thể co lại khi cần
                                child: FadeInUp(
                                  duration: const Duration(milliseconds: 1300),
                                  delay: const Duration(milliseconds: 1200),
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.onNewGame();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => HomeScreen()),
                                      );
                                    },
                                    child: Container(
                                      height: size.height * 0.08,
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        color: Color.fromARGB(202, 0, 55, 255),
                                      ),
                                      child: Stack(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              LoadingIndicator(
                                                indicatorType: Indicator.ballClipRotatePulse,
                                                colors: [const Color.fromARGB(255, 250, 250, 250), Color.fromARGB(255, 0, 255, 51), const Color.fromARGB(255, 249, 249, 249)],
                                                strokeWidth: 2,
                                                backgroundColor: Colors.transparent,
                                                pathBackgroundColor: Colors.red,
                                              ),
                                              Text(
                                                "Ván mới",
                                                style: TextStyle(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(255, 255, 255, 255),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//list
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: invalid_use_of_protected_member

class ListNumScreen extends StatelessWidget {
  const ListNumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> numbers = [11, 22, 33, 44, 55, 66];
    int n = 22;
    Size size = MediaQuery.of(context).size;
    ListNumControllers controllers = Get.put(ListNumControllers());
    return Scaffold(
      appBar: AppBar(
          title: const Text('Danh Sách Các Số',
              style: TextStyle(
                color: Color.fromARGB(255, 62, 1, 1),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          backgroundColor: Color.fromARGB(255, 110, 213, 251),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 62, 1, 1)),
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
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
                Container(
        margin: EdgeInsets.all(size.width * 0.05),
        padding: EdgeInsets.all(size.width * 0.05),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              sliver: Obx(
                () => SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return ZoomIn(
                      duration: const Duration(milliseconds: 1000),
                      delay: Duration(milliseconds: 200 * index),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              (controllers.listnum.value[index] == 11 ||
                               controllers.listnum.value[index] == 22 ||
                                controllers.listnum.value[index] == 33 ||
                                 controllers.listnum.value[index] == 44 ||
                                  controllers.listnum.value[index] == 55 ||
                                   controllers.listnum.value[index] == 66 ||
                                    controllers.listnum.value[index] == 77 ||
                                     controllers.listnum.value[index] == 88 ||
                                      controllers.listnum.value[index] == 99 )?
                                      'assets/tiger.png' 
                                       :
                              controllers.listnum.value[index] % 2 == 0 ? 
                              'assets/green.png' : 'assets/red.png'
                          ,
                          fit: BoxFit.fill,
                        )),
                      Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            color:controllers.listnum.value[index].isEven
                                ? Colors.transparent
                                : Colors.transparent),
                        child: Center(
                          child: Text(
                              controllers.listnum.value[index].toString(),
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 74, 255, 89))),
                        ),
                      ),
                    
                        ],
                      )

                    );
                  }, childCount: controllers.listnum.value.length),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    
        ],
      )

    );
  }
}


//ưebviewccdlcm
class WebViewScreen extends StatelessWidget {
  final String initialUrl;

  WebViewScreen({required this.initialUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(  
        // padding: EdgeInsets.only(top: 40),
        child: 
        WebView(
          initialUrl: initialUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      )
    );
  }
}



