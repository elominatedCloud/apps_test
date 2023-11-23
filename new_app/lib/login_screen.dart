import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });
    
    // 여기에 서버의 로그인 API 엔드포인트를 넣으세요.
    var url = Uri.parse('https://your-api-url.com/login');

    try {
      var response = await http.post(
        url,
        body: json.encode({
          'username': _usernameController.text,
          'password': _passwordController.text,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        // 로그인 성공 시 토큰을 저장하고 다음 화면으로 이동 등의 로직을 구현하세요.
        // 예를 들어, 다음 화면으로 이동:
        // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => NextScreen()));
      } else {
        // 로그인 실패 처리
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Invalid username or password'),
        ));
      }
    } catch (e) {
      // 네트워크 오류 처리
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Network error'),
      ));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                  crossAxisAlignment: CrossAxisAlignment.stretch, // 가로로 꽉 채우기
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2), // 상단 여백 추가
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(labelText: '아이디'),
                    ),
                    SizedBox(height: 8.0), // 요소들 사이의 여백 추가
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(labelText: '비밀번호'),
                      obscureText: true,
                    ),
                    SizedBox(height: 24.0), // 요소들 사이의 여백 추가
                    ElevatedButton(
                      onPressed: () {}, // 로그인 로직을 구현하세요
                      child: Text('로그인'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}