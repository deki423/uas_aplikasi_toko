import 'package:flutter/material.dart';
import 'package:uas_aplikasi_toko/page/transaksi.dart';
import 'package:uas_aplikasi_toko/widgets/product_list.dart';
import 'package:uas_aplikasi_toko/helper/data_helper.dart';
import 'package:uas_aplikasi_toko/widgets/show_money.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Transaksi2 extends StatefulWidget {
  const Transaksi2({Key? key}) : super(key: key);

  @override
  State<Transaksi2> createState() => _Transaksi2State();
}

class _Transaksi2State extends State<Transaksi2> {
  var nameFormKey = GlobalKey<FormState>();
  var totalPriceKey = GlobalKey<FormState>();
  String inputProductName = '';
  String inputPrice = '';
  TextEditingController inputNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:AppBar(
        automaticallyImplyLeading: false,
        title: Text('Keranjang'
        ),centerTitle: true,
        leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => Transaksi(arguments: null)
                )
            )
        )
    ),

      body: Column ( 
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ProductList(
              onDismiss: (index) {
                DataHelper.allShoppingList.removeAt(index);
                setState(() {});
              },
            ),
          ),
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MaterialButton(color: Colors.orangeAccent.shade700,
                    onPressed: () {_deleteList();
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return Transaksi(arguments: null);
                        }), (refresh) {
                          return false;
                        });
                    },
                    child :ShowPrice(
                              TotalPrice: DataHelper.Total()),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.yellowAccent, width: 2)
                    ),
                   ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
  void _deleteList() {
    Fluttertoast.showToast(
      msg: 'Berhasil Dibayar ',
      backgroundColor: Colors.blueAccent,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
    );
    DataHelper.allShoppingList.clear();
  }
}


