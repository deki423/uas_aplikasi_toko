import 'package:flutter/material.dart';
import 'package:uas_aplikasi_toko/widgets/product_list.dart';
import 'package:uas_aplikasi_toko/constants/constants.dart';
import 'package:uas_aplikasi_toko/helper/data_helper.dart';
import 'package:uas_aplikasi_toko/widgets/show_money.dart';


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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
            child: Text(
              TextConstants.mainText,
              style: TextConstants.mainTextStyle,
            )),
        elevation: 0,
      ),
      body: Column ( 
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Center( 
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: ShowPrice(
                    TotalPrice: DataHelper.Total(),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
              )
            ],
          ),
          Expanded(
            child: ProductList(
              onDismiss: (index) {
                DataHelper.allShoppingList.removeAt(index);
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }





}
