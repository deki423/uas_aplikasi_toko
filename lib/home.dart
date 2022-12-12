import 'package:flutter/material.dart';
import 'package:uas_aplikasi_toko/transaksi.dart';
import 'login.dart';
import 'produk.dart';



class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Home'), centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.indigo.shade500, Colors.purple.shade900])),
              padding: EdgeInsets.all(5),
              width: double.infinity,
              height: 50,
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
                        builder: (context) => Transaksi(arguments: null)
                    )
                );
              },
              leading: Icon(Icons.money,
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
            ListTile(
              onTap: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => Login()
                    )
                );
              },
              leading: Icon(Icons.output_rounded,
                size: 35,),
              title: Text('Logout',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.orange.shade50])),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              const SizedBox(width: 40,),
              Text('Selamat Datang',
              style :Theme.of(context)
                  .textTheme.headline3!
                  .copyWith(fontWeight:  FontWeight.w600,color: Colors.orange.shade900),
              ),
              Text('Ayo lalukan penjualan ',
                style :Theme.of(context)
                    .textTheme.titleLarge!
                    .copyWith(fontWeight:  FontWeight.w600,color: Colors.indigo),
              ),
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center
                ,
                children: <Widget>[
                  Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        new MaterialButton(
                        child:  Image.asset('assets/images/transaksi.png',
                          height: 100,
                          ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                              builder: (context) => Transaksi(arguments: null)));
                        },

                      ),

                        Text('Transaksi', style :Theme.of(context)
                            .textTheme.titleLarge!
                            .copyWith(fontWeight:  FontWeight.w500,color: Colors.black),
                        ), ]),
                  const SizedBox(width: 30,),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        new MaterialButton(
                  child:  Image.asset('assets/images/produk3.png',

                   height: 100,
                  ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Produk()));
                        },
                      ),
                         Text('Produk', style :Theme.of(context)
                            .textTheme.titleLarge!
                            .copyWith(fontWeight:  FontWeight.w500,color: Colors.black),
                        ),
                       ]),
                ],

              ),

            ],
          )),


    );


  }
}
