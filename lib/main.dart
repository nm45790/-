// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'dart:convert';

List<Map<String, dynamic>>? keywords;
void main() async {
  // http.Response response =
  //     await http.get(Uri.parse('http://sobi.chonbuk.ac.kr/menu/week_menu.php'));
  // dom.Document document = parser.parse(utf8.decode(response.bodyBytes));

  // List<dom.Element> keywordElements = document.querySelectorAll('tbody');
  // // List<Map<String, dynamic>> keywords = [];
  // keywords = [];
  // for (var element in keywordElements) {
  //   dom.Element? name = element.querySelector('td');
  //   keywords?.add({
  //     'name': name?.text,
  //   });
  // }

  // print(keywords);
  final response = await http.Client()
      .get(Uri.parse('http://sobi.chonbuk.ac.kr/menu/week_menu.php'));

  if (response.statusCode == 200) {
    var document = parse(utf8.decode(response.bodyBytes));

    var link = document.getElementsByClassName('tblType03')[0].children[2];
    var text = link.text;
    print(text);
  } else {
    throw Exception();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
  int dayState = 0;
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
                  Text("이번주 식단입니다!!",
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
                          if (index == 0) {
                            dayState = 0;
                            print("dayState=$dayState");
                          } else if (index == 1) {
                            dayState = 1;
                            print("dayState=$dayState");
                          } else if (index == 2) {
                            dayState = 2;
                            print("dayState=$dayState");
                          } else if (index == 3) {
                            dayState = 3;
                            print("dayState=$dayState");
                          } else if (index == 4) {
                            dayState = 4;
                            print("dayState=$dayState");
                          }
                        }
                      }),
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              //월요일메뉴
              if (dayState == 0)
                Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: MondayLunchMenu(),
                ),
              if (dayState == 0) SizedBox(height: 16),
              if (dayState == 0)
                Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: MondayEveningMenu(),
                ),
              //화요일메뉴
              if (dayState == 1)
                Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: TuseLunchMenu(),
                ),
              if (dayState == 1) SizedBox(height: 16),
              if (dayState == 1)
                Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: TuesEveningMenu(),
                ),
              //수요일메뉴
              if (dayState == 2)
                Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: WedenesLunchMenu(),
                ),
              if (dayState == 2) SizedBox(height: 16),
              if (dayState == 2)
                Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: WednesEveningMenu(),
                ),
              //목요일메뉴
              if (dayState == 3)
                Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ThursLunchMenu(),
                ),
              if (dayState == 3) SizedBox(height: 16),
              if (dayState == 3)
                Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ThursEveningMenu(),
                ),
              //금요일메뉴
              if (dayState == 4)
                Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: FriLunchMenu(),
                ),
              if (dayState == 4) SizedBox(height: 16),
              if (dayState == 4)
                Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: FriEveningMenu(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class MondayLunchMenu extends StatelessWidget {
  const MondayLunchMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "중식",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
            Icon(Icons.food_bank)
          ],
        ),
        Text(
          "월1",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "월2",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "월3",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "월4",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}

class MondayEveningMenu extends StatelessWidget {
  const MondayEveningMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "석식",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
            Icon(Icons.food_bank)
          ],
        ),
        Text(
          "월1",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "월2",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "월3",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "월4",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}

class TuseLunchMenu extends StatelessWidget {
  const TuseLunchMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "중식",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
            Icon(Icons.food_bank)
          ],
        ),
        Text(
          "화1",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "화2",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "화3",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "화4",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}

class TuesEveningMenu extends StatelessWidget {
  const TuesEveningMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "석식",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
            Icon(Icons.food_bank)
          ],
        ),
        Text(
          "화1",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "화2",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "화3",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "화4",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}

class WedenesLunchMenu extends StatelessWidget {
  const WedenesLunchMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "중식",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
            Icon(Icons.food_bank)
          ],
        ),
        Text(
          "수1",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "수2",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "수3",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "수4",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}

class WednesEveningMenu extends StatelessWidget {
  const WednesEveningMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "석식",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
            Icon(Icons.food_bank)
          ],
        ),
        Text(
          "수1",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "수2",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "수3",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "수4",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}

class ThursLunchMenu extends StatelessWidget {
  const ThursLunchMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "중식",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
            Icon(Icons.food_bank)
          ],
        ),
        Text(
          "목1",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "목2",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "목3",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "목4",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}

class ThursEveningMenu extends StatelessWidget {
  const ThursEveningMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "석식",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
            Icon(Icons.food_bank)
          ],
        ),
        Text(
          "목1",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "목2",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "목3",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "목4",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}

class FriLunchMenu extends StatelessWidget {
  const FriLunchMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "중식",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
            Icon(Icons.food_bank)
          ],
        ),
        Text(
          "금1",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "금2",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "금3",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "금4",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}

class FriEveningMenu extends StatelessWidget {
  const FriEveningMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "석식",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
            Icon(Icons.food_bank)
          ],
        ),
        Text(
          "금1",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "금2",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "금3",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 16),
        Text(
          "금4",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}
