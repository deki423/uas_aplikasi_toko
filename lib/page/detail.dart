import 'package:flutter/material.dart';
import 'package:uas_aplikasi_toko/page/InputDeco_desain.dart';
import 'package:uas_aplikasi_toko/page/produk.dart';
import 'package:http/http.dart' as http;


class Detail extends StatefulWidget {
   Detail({super.key, required arguments});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  TextEditingController textControllerKodeBarang = TextEditingController();
  TextEditingController textControllerNamaBarang = TextEditingController();
  TextEditingController textControllerHargaBarang = TextEditingController();
  TextEditingController textControllerStokBarang = TextEditingController();
  @override
  Widget build(BuildContext context) {
    dynamic dataBarang = ModalRoute.of(context)!.settings.arguments;
    textControllerKodeBarang.text = dataBarang['item_code'].toString();
    textControllerNamaBarang.text = dataBarang['item_name'].toString();
    textControllerHargaBarang.text = dataBarang['price'].toString();
    textControllerStokBarang.text = dataBarang['stock'].toString();
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('UPDATE DATA BARANG',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
            centerTitle: true,
            leading: IconButton(icon: const Icon(Icons.arrow_back),
                onPressed:() => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) =>  Produk()
                    )
                )
            )
        ),
        body: Card(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 const  Padding(
                    padding:  EdgeInsets.all(17.0),

                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                        bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: textControllerKodeBarang,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.tag, "Kode Barang"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Kode Barang tidak boleh kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                        bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: textControllerNamaBarang,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.perm_identity, "Nama Barang"),
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
                      decoration: buildInputDecoration(Icons.summarize_outlined, "Stok"),
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
                      color: Colors.yellowAccent,
                      onPressed: () {
                          dataBarang['item_code'] = textControllerKodeBarang.text;
                          dataBarang['item_name'] = textControllerNamaBarang.text;
                          dataBarang['price'] = textControllerHargaBarang.text;
                          dataBarang['stock'] = textControllerStokBarang.text;
                          editData(dataBarang);
                          Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                          return  Produk();
                          }), (refresh) {
                          return false;
                          });
                          },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side:const  BorderSide(color: Colors.blue, width: 2)
                      ),
                      textColor: Colors.black,
                      child: const Text("Update"),
                    ),
                  ),
            const Padding(
              padding:  EdgeInsets.only(
                  bottom: 15, left: 10, right: 10),
            ),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: MaterialButton(
                      color: Colors.redAccent,
                      onPressed: () {
                        hapusData(dataBarang['item_code'].toString());
                        //Navigator.pushNamed(context, '/main');
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return  Produk();
                            }), (refresh) {
                              return false;
                            });
                      },

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: const BorderSide(color: Colors.blue, width: 2)
                      ),
                      textColor: Colors.white,
                      child: const Text("Delete"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }

  void hapusData(String item_code) async {
    String sql = "http://10.0.2.2/my_store/getdelete.php?item_code=$item_code";
    await http.get(Uri.parse(sql));
  }

  void editData(dynamic dataBarang) async {
    String item_code = dataBarang['item_code'];
    String item_name = dataBarang['item_name'];
    String price = dataBarang['price'].toString();
    String stock = dataBarang['stock'].toString();
    String sql =
        "http://10.0.2.2/my_store/edit.php?item_code=$item_code&item_name=$item_name&price=$price&stock=$stock";
    await http.get(Uri.parse(sql));
  }

}