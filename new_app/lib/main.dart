import 'package:flutter/material.dart';
import 'login_screen.dart'; // LoginScreen 클래스가 정의된 파일을 임포트합니다.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상태바'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 로고 위젯을 넣으세요.
            Image.asset('./assets/images/yonsei_MOA_logo.png'), // 'assets/logo.png'는 실제 이미지 경로로 변경해야 합니다.
            SizedBox(height: 50), // 로고와 버튼 사이의 공간을 위한 SizedBox
            // 로그인 버튼
            ElevatedButton(
              onPressed: () {
                // 로그인 로직을 추가하세요.
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('로그인'),
            ),
            SizedBox(height: 20), // 버튼 사이의 공간을 위한 SizedBox
            // 회원가입 버튼
            TextButton(
              onPressed: () {
                // 회원가입 로직을 추가하세요.
              },
              child: Text('회원가입'),
            ),
          ],
        ),
      ),
    );
  }
}
