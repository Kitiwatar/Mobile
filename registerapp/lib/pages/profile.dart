import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? txtusername = "";
  String? txtpassword = "";
  String? txtstatus = "";

  @override
  void initState() {
    getUsername();
    getPassword();
    getStatus();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Center(
          child: Text("${txtusername} and Password ${txtpassword}"),
        )
      ],
    ));
  }

  Future<void> getUsername() async {
    var pref = await SharedPreferences.getInstance();
    var myStr = pref.getString('username');
    setState(() {
      txtusername = myStr;
    });
  }

  Future<void> getPassword() async {
    var pref = await SharedPreferences.getInstance();
    var myStr = pref.getString('password');
    setState(() {
      txtpassword = myStr;
    });
  }

  Future<void> getStatus() async {
    var pref = await SharedPreferences.getInstance();
    var myStr = pref.getString('status');
    setState(() {
      txtstatus = myStr;
    });
  }
}
