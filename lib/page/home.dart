import 'package:flutter/material.dart';
import 'package:uas_aplikasi_toko/page/transaksi.dart';
import 'login.dart';
import 'produk.dart';



class  Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  AppBar(
        title: const Text('HOME',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),
      ), centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.indigo.shade500, Colors.purple.shade900])),
              padding: const EdgeInsets.all(5),
              width: double.infinity,
              height: 50,
              alignment: Alignment.bottomLeft,
              child: const Text('MENU',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
                ) ,
             ),
           ),
           const SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) =>  Home()
                    )
                );
              },
              leading:const Icon(Icons.home,
                size: 35,),
              title: const Text('Home',
                style: TextStyle(
                  fontSize: 20,
                ),

              ),
            ),
            ListTile(
              onTap: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) =>  Transaksi(arguments: null)
                    )
                );
              },
              leading: const Icon(Icons.money,
                size: 35,),
              title: const Text('Transaksi',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) =>  Produk()
                    )
                );
              },
              leading: const Icon(Icons.inventory_2_outlined,
                size: 35,),
              title: const  Text('Produk',
                style:  TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) =>  Login()
                    )
                );
              },
              leading: const Icon(Icons.output_rounded,
                size: 35,),
              title: const Text('Logout',
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
                         MaterialButton(
                        child:   Image.asset('assets/images/transaksi.png',
                          height: 100,
                          ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                              builder: (context) =>  Transaksi(arguments: null)));
                        },

                      ),

                        Text('TRANSAKSI', style :Theme.of(context)
                            .textTheme.titleLarge!
                            .copyWith(fontWeight:  FontWeight.w500,color: Colors.black),
                        ), ]),
                  const SizedBox(width: 30,),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        MaterialButton(
                  child:  Image.asset('assets/images/produk3.png',

                   height: 100,
                  ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>  Produk()));
                        },
                      ),
                         Text('PRODUK', style :Theme.of(context)
                            .textTheme.titleLarge!
                            .copyWith(fontWeight:  FontWeight.w500,color: Colors.black),
                        ),
                       ]
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }
}
