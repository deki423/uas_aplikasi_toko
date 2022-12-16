
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uas_aplikasi_toko/page/produk.dart';
import 'InputDeco_desain.dart';
import 'dart:core';

class Subproduk extends StatefulWidget {
   Subproduk({Key? key, required arguments}) : super(key: key);

  @override
  State<Subproduk> createState() => _SubprodukState();
}

class _SubprodukState extends State<Subproduk> {

  TextEditingController textControllerKodeBarang =  TextEditingController();
  TextEditingController textControllerNamaBarang =  TextEditingController();
  TextEditingController textControllerHargaBarang =  TextEditingController();
  TextEditingController textControllerStokBarang =  TextEditingController();
  dynamic databarang;
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('INPUT DATA BARANG',
              style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
      ),centerTitle: true,
          leading: IconButton(icon: const Icon(Icons.arrow_back),
              onPressed:() => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) =>  Produk()
                  )
              )
          )
      ),
        body:  Card(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 const Padding(
                    padding:  EdgeInsets.all(17.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: textControllerKodeBarang,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.numbers, "Id Barang"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Id tidak boleh kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: textControllerNamaBarang,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.book_online, "Nama Barang"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama Barang tidak boleh kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: textControllerHargaBarang,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.price_change, "Harga"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Harga tidak boleh kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: textControllerStokBarang,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.summarize, "Stok"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Stok tidak boleh kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: MaterialButton(
                      color: Colors.blueAccent,
                      onPressed: () {
                        inputData(
                            textControllerKodeBarang.text,
                            textControllerNamaBarang.text,
                            textControllerHargaBarang.text,
                            textControllerStokBarang.text
                        );
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return  Produk();
                            }), (refresh) {
                              return false;
                            });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),

                      ),

                      child: Text('Input',
                          style: TextStyle(
                              color: Colors.white.withOpacity(.8),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),

                ],
              ),
            ),
          ),
        )
    );


  }
  void inputData(
      String  item_code, String item_name, String price, String stock) async {
    String sql =
        "http://10.0.2.2/my_store/input.php?item_code=$item_code&item_name=$item_name&price=$price&stock=$stock";
    await http.get(Uri.parse(sql));
  }
}