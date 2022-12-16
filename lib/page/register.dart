import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:uas_aplikasi_toko/page/login.dart';
import 'dart:async';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterState createState() => _RegisterState();
}


  class _RegisterState extends State<Register> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future register() async {
          var url = Uri.http("10.0.2.2", '/my_store/register.php', {'q': '{http}'});
          var response = await http.post(url, body: {
          "username": user.text.toString(),
          "password": pass.text.toString(),
  });
          var data = json.decode(response.body);
          if (data == "Error") {
          Fluttertoast.showToast(
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          msg: 'error!',
          toastLength: Toast.LENGTH_SHORT,
  );
  } else {
          Fluttertoast.showToast(
          backgroundColor: Colors.blueAccent,
          textColor: Colors.white,
          msg: 'Berhasil Registrasi',
          toastLength: Toast.LENGTH_SHORT,
  );
            // ignore: use_build_context_synchronously
            Navigator.push(context,
            MaterialPageRoute(
            builder: (context) =>  Login(),
  ),
  );
  }
  }
          bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      body: Container(
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                  gradient: LinearGradient(
                  colors: [Colors.indigo.shade600, Colors.yellow.shade700])),
        child: SingleChildScrollView(
          child: Column(
                  children: [
              Align(
                  alignment: Alignment.topRight,
                  child: Container(
                  height: 100,
                  width: 300,
                  decoration: const BoxDecoration(
                  gradient:
                  LinearGradient(colors: [Colors.purple, Colors.orange]),
                  boxShadow: [
                  BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 3,
                  color: Colors.black12)
                  ],
                  borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200))),
                  child: Padding(
                  padding: const EdgeInsets.only(bottom: 35, left: 65),
                  child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [

                 Text(
                  ' Register',
                  style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                  Shadow(
                  color: Colors.black45,
                  offset: Offset(1, 1),
                  blurRadius: 5)
                  ]),
                  ),
                  ],
                  ),
                  ),
                  ),
                  ),
                  const SizedBox(
                  height: 40,
                  ),
          Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30)
                      .copyWith(bottom: 10),
                  child: TextField(
                  controller: user,
                  style:  TextStyle(color: Colors.white, fontSize: 14.5),
                  decoration: InputDecoration(
                  prefixIconConstraints:
                   BoxConstraints(minWidth: 45),
                  prefixIcon:  Icon(
                  Icons.alternate_email_outlined,
                  color: Colors.white70,
                  size: 22,
                  ),
                  border: InputBorder.none,
                  hintText: 'Masukkan Username',
                  hintStyle:  TextStyle(
                  color: Colors.white60, fontSize: 14.5),
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100).copyWith(
                  bottomRight:  Radius.circular(0)),
                  borderSide:
                   BorderSide(color: Colors.white38)),
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100).copyWith(
                  bottomRight:  Radius.circular(0)),
                  borderSide:
                   BorderSide(color: Colors.white70))),
                  ),
                  ),
                  const SizedBox(
                  height: 20,
                  ),
                  Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30)
                      .copyWith(bottom: 10),
                  child: TextField(
                  controller: pass,
                  style:  TextStyle(color: Colors.white, fontSize: 14.5),
                  obscureText: isPasswordVisible ? false : true,
                  decoration: InputDecoration(
                  prefixIconConstraints:
                   BoxConstraints(minWidth: 45),
                  prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.white70,
                  size: 22,
                  ),
                  suffixIconConstraints:
                   BoxConstraints(minWidth: 45, maxWidth: 46),
                  suffixIcon: GestureDetector(
                  onTap: () {
                  setState(() {
                  isPasswordVisible = !isPasswordVisible;
                  });
                  },
                  child: Icon(
                  isPasswordVisible
                  ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.white70,
                  size: 22,
                  ),
                  ),
                  border: InputBorder.none,
                  hintText: 'Masukkan Password',
                  hintStyle: const TextStyle(
                  color: Colors.white60, fontSize: 14.5),
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100).copyWith(
                  bottomRight:  Radius.circular(0)),
                  borderSide:
                   BorderSide(color: Colors.white38)),
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100).copyWith(
                  bottomRight:  Radius.circular(0)),
                  borderSide:
                   BorderSide(color: Colors.white70))),
                  ),
                  ),
                  const SizedBox(
                  height: 50,
                  ),
                  GestureDetector(
                  onTap: () {
                  register();
                  },
                  child: Container(
                  height: 53,
                  width: double.infinity,
                  margin:  EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                  boxShadow: [
                  BoxShadow(
                  blurRadius: 4,
                      color: Colors.black12.withOpacity(.2),
                         offset:  Offset(2, 2))
                             ],
                      borderRadius: BorderRadius.circular(100)
                          .copyWith(bottomRight:  Radius.circular(0)),
                                 gradient: LinearGradient(colors: [
                                   Colors.purple.shade600,
                                   Colors.orange.shade900
                  ]
                                 )
                  ),

                  child: Text('Signup',
                        style: TextStyle(
                            color: Colors.white.withOpacity(.8),
                                   fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                  ),
              ),
                  const SizedBox(
                  height: 50,
                  ),
                  const Text('jika memiliki akun silahkan melakukan login!',
                  style: TextStyle(color: Colors.white70, fontSize: 13)),
                  const SizedBox(
                  height: 20,
                  ),
                  GestureDetector(onTap: () {Navigator.push(context,
                     MaterialPageRoute(builder: (context) => const  Login()));

                  },
                  child: Container(
                       height: 53,
                        width: double.infinity,
                          margin:  EdgeInsets.symmetric(horizontal: 30),
                            alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white60),
                                      borderRadius: BorderRadius.circular(100)
                                         .copyWith(bottomRight:  Radius.circular(0)),
                  ),
                  child: Text('Login',
                      style: TextStyle(
                        color: Colors.white.withOpacity(.8),
                            fontSize: 15,
                                 fontWeight: FontWeight.bold)),
                  ),
                  ),
                  const SizedBox(
                  height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
             );
                 }
                      }