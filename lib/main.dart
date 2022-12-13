
import 'package:flutter/material.dart';
import 'package:uas_aplikasi_toko/page/detail.dart';
import 'package:uas_aplikasi_toko/page/login.dart';
import 'package:uas_aplikasi_toko/page/shopping_cart_page.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tokoku',
        home:  Login(),

        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.

          primarySwatch: Colors.indigo,
        ),
        routes: {
          '/detail': (context) =>
             const Detail(
                arguments: null,
              ),
          '/shoppingcartpage': (context) =>
               ShoppingCartPage(arguments: null,
            
              ),
        }
        );
  }

}







