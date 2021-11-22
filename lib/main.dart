// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xffF4F7FC),
        backgroundColor: Color(0xffF4F7FC),
        canvasColor: Color(0xffF4F7FC),
        fontFamily: "Maplestory",
      ),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<bool> _buttonsState = List.generate(5, (index) => false);
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffF4F7FC),
        leading: Icon(
          Icons.house,
          color: Colors.black87,
        ),
        title: const Text(
          "진수원",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("이번주는 ${now.month}월${now.weekday}째주",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w900)),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  ToggleButtons(
                    renderBorder: false,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            right: BorderSide(
                              color: Color(0xffF4F7FC),
                              width: 3,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.18,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "월요일",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            right: BorderSide(
                              color: Color(0xffF4F7FC),
                              width: 3,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.18,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "화요일",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            right: BorderSide(
                              color: Color(0xffF4F7FC),
                              width: 3,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.18,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "수요일",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            right: BorderSide(
                              color: Color(0xffF4F7FC),
                              width: 3,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.18,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "목요일",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            right: BorderSide(
                              color: Color(0xffF4F7FC),
                              width: 3,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.18,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "금요일",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    ],
                    isSelected: _buttonsState,
                    onPressed: (int index) => {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < _buttonsState.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            _buttonsState[buttonIndex] = true;
                          } else {
                            _buttonsState[buttonIndex] = false;
                          }
                        }
                      }),
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                color: Colors.white,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "중식",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w900),
                        ),
                        Icon(Icons.food_bank)
                      ],
                    ),
                    Text(
                      "메뉴1",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "메뉴2",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "메뉴3",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "메뉴4",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                color: Colors.white,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "석식",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w900),
                        ),
                        Icon(Icons.food_bank)
                      ],
                    ),
                    Text(
                      "메뉴1",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "메뉴2",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "메뉴3",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "메뉴4",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
