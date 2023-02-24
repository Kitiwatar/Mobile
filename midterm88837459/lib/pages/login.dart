import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  // const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  String? fullname = '';
  String? Welcome = 'ยินดีต้อนรับ ...';

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Scaffold(
        body: ListView(
          children: [
            
            Image.network(
              "https://png.pngtree.com/png-vector/20191110/ourmid/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_1978396.jpg",
              width: 200,
            ),
           Text(
              'Login เข้าสู่ระบบ',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 25),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            TextField(
                controller: username,
                decoration: InputDecoration(
                    labelText: 'UserName', border: OutlineInputBorder())),
            SizedBox(height: 15),
            TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password', border: OutlineInputBorder())),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (username.text == "Kitiwat" && password.text == "1234") {
                  setState(() {
                    username.text = 'Kitiwat';
                    password.text = '1234';
                    fullname = 'Kitiwat Arunwong';
                    
                    setUsername(username.text);
                    setPassword(password.text);

                    Welcome = username.text;
        
                  });
                }
              },
              child: Text("เข้าสู่ระบบ"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(50, 20, 50, 20)),
                  textStyle:
                      MaterialStateProperty.all(TextStyle(fontSize: 30))),
            ),
          
            SizedBox(height: 20), 
            // Text(
            //   'ยินดีต้อนรับคุณ ...',
            //   style: const TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: Colors.blue,
            //       fontSize: 25),
            //   textAlign: TextAlign.center,
            // ),
            // SizedBox(height: 20), 
            Text(
              'ยินดีต้อนรับคุณ' + ' $fullname',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 25),
              textAlign: TextAlign.center,
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
