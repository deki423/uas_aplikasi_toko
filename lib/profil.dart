import 'package:flutter/material.dart';
import 'InputDeco_desain.dart';
import 'produk.dart';
import 'home.dart';
import 'transaksi.dart';
class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}


class _ProfilState extends State<Profil> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              width: double.infinity,
              height: 50,
              color: Colors.blue,
              alignment: Alignment.bottomLeft,
              child: Text('Menu',
                style: TextStyle(
                  fontSize: 24,
                ) ,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => Home()
                    )
                );
              },
              leading: Icon(Icons.home,
                size: 35,),
              title: Text('Home',
                style: TextStyle(
                  fontSize: 20,
                ),

              ),
            ),
            ListTile(
              onTap: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => Transaksi()
                    )
                );
              },
              leading: Icon(Icons.calculate,
                size: 35,),
              title: Text('Transaksi',
                style: TextStyle(
                  fontSize: 20,
                ),

              ),
            ),
            ListTile(
              onTap: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => Produk()
                    )
                );
              },
              leading: Icon(Icons.inventory_2_outlined,
                size: 35,),
              title: Text('Produk',
                style: TextStyle(
                  fontSize: 20,

                ),

              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: Form(
          key: _formkey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15, left: 10, right: 10),
                    child: TextFormField(

                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.person, "User Name"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'User name tidak boleh kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ]
          
        )
        ),
      )
             
    

    );
  }}