import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:uas_aplikasi_toko/model/shopping.dart';
import 'package:uas_aplikasi_toko/page/transaksi.dart';
import 'package:uas_aplikasi_toko/page/transaksi2.dart';
import 'package:uas_aplikasi_toko/constants/constants.dart';
import 'package:uas_aplikasi_toko/helper/data_helper.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key, required arguments});

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  var nameFormKey = GlobalKey<FormState>();
  var totalPriceKey = GlobalKey<FormState>();
  String inputProductName = '';
  String inputPrice = '';


  TextEditingController inputNumberController = TextEditingController();


  TextEditingController textControllerNamaBarang = TextEditingController();
  TextEditingController textControllerHargaBarang = TextEditingController();

  @override
  Widget build(BuildContext context) {
    dynamic dataBarang = ModalRoute.of(context)!.settings.arguments;

    textControllerNamaBarang.text = dataBarang['item_name'].toString();
    textControllerHargaBarang.text = dataBarang['price'].toString();


    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Keranjang'
          ),
          centerTitle: true,
          leading: IconButton(icon:Icon(Icons.arrow_back),
              onPressed:() => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => Transaksi(arguments: null)
                  )
              )
          )
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Column(
            children: [
              Padding(padding: const EdgeInsets.only(
          bottom: 15, left: 10, right: 10)),
              Center(
                child: Text(
                  'Masukkan ke keranjang',
                  style: TextConstants.addCartTextStyle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      child: _buildProductNameForm(),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: _buildProductPriceNumber(),
                      ),
                      Expanded(
                        flex: 1,

                        child: IconButton(
                          icon: const Icon(Icons.add_shopping_cart),
                          color: ColorConstants.mainColor,
                          iconSize: 70,

                          onPressed: _totalCalculate,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed : () => Navigator.of(context).push( MaterialPageRoute(
            builder: (BuildContext context) =>  Transaksi2())),
        tooltip: 'Increment',
        child: const Icon(Icons.shopping_cart_rounded),
      ),

    );
  }

  Widget _buildProductNameForm() {
    return Form(
      key: nameFormKey,
      child: _buildNameTextFormField(),
    );
  }

  _buildNameTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          inputProductName = deger!;
        });
      },
      controller:textControllerNamaBarang,
      decoration: InputDecoration(
          hintText: 'Nama Barang',
          border: OutlineInputBorder(
              borderRadius: DecorationConstants.borderRadius,
              borderSide: BorderSide.none),
          filled: true,
          fillColor: ColorConstants.textFormColor),
    );
  }

  Widget _buildProductPriceNumber() {
    return Form(
        key: totalPriceKey,
        child: Column(
          children: [
            _buildPriceFormField(),
            _buildProductNumber(),
          ],
        ));
  }

  _buildPriceFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          inputPrice = deger!;
        });
      },
      controller:textControllerHargaBarang,
      decoration: InputDecoration(
          hintText: 'Harga',
          border: OutlineInputBorder(
              borderRadius: DecorationConstants.borderRadius,
              borderSide: BorderSide.none),
          filled: true,
          fillColor: ColorConstants.textFormColor),
    );
  }

  _buildProductNumber() {
    return Container(
        padding: const EdgeInsets.all(3),
        child: NumberInputWithIncrementDecrement(
          numberFieldDecoration: InputDecoration(
              hintText: 'Total',
              border: OutlineInputBorder(
                  borderRadius: DecorationConstants.borderRadius,
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: ColorConstants.textFormColor),
          widgetContainerDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          controller: inputNumberController,
        ));
  }

  void _totalCalculate() {
    if (nameFormKey.currentState!.validate()) {
      nameFormKey.currentState!.save();
      totalPriceKey.currentState!.save();
      var addShopping = Shopping(
          productName: inputProductName,
          productPrice: double.parse(inputPrice),
          productNumber: int.parse(inputNumberController.text));

      DataHelper.addShopping(addShopping);
    }
  }
}
