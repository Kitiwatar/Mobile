import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:registerapp/pages/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  // const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Scaffold(
        body: ListView(
          children: [
            Text(
              'Login',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                  fontSize: 30),
              textAlign: TextAlign.center,
            ),
            Image.network(
              "https://png.pngtree.com/png-vector/20191110/ourmid/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_1978396.jpg",
              width: 200,
            ),
            TextField(
                controller: username,
                decoration: InputDecoration(
                    labelText: 'UserName', border: OutlineInputBorder())),
            SizedBox(height: 5),
            TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password', border: OutlineInputBorder())),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (username.text == "Kitiwat" && password.text == "1234") {
                  print('${username.text} = Admin Password ${password.text}');
                  setState(() {
                    username.text = 'Kitiwat';
                    password.text = '1234';

                    setUsername(username.text);
                    setPassword(password.text);
                    setStatus('Login Success');
                  });
                } else {
                  print('User = Other');
                  setStatus('Login Failed');
                }
              },
              child: Text("เข้าสู่ระบบ"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(50, 20, 50, 20)),
                  textStyle:
                      MaterialStateProperty.all(TextStyle(fontSize: 30))),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => ProfilePage())));
              },
              child: Text("Profile"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(124, 68, 164, 212)),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(50, 20, 50, 20)),
                  textStyle:
                      MaterialStateProperty.all(TextStyle(fontSize: 30))),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> setUsername(textUsername) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("username", textUsername);
  }

  Future<void> setPassword(textPassword) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("password", textPassword);
  }

  Future<void> setStatus(textStatus) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("status", textStatus);
  }
}
