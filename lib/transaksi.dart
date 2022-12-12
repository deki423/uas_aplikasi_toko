import 'package:flutter/material.dart';
import 'package:uas_aplikasi_toko/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:uas_aplikasi_toko/transaksi2.dart';


class Transaksi extends StatefulWidget {
  const Transaksi( {Key? key, required arguments}) : super(key: key);

  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  Future<List<dynamic>> getData() async {
    final response =
    await http.get(Uri.parse("http://10.0.2.2/my_store/getdata.php"));
    return json.decode(response.body);


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Produk'),centerTitle: true,
          leading: IconButton(icon:Icon(Icons.arrow_back),
              onPressed:() => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => Home()
                  )
              )
          )
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SizedBox.shrink(); //<---here
          } else {
            if (snapshot.hasData) {
              return ItemList(list: snapshot.data!);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed : () => Navigator.of(context).push( MaterialPageRoute(
            builder: (BuildContext context) =>  Transaksi2(arguments: null))),
        tooltip: 'Increment',
        child: const Icon(Icons.shopping_cart_rounded),
      ),




    );
  }
}

class ItemList extends StatelessWidget {
  //const ItemList ({super.key});
  final List<dynamic> list;
  const ItemList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    if (list != null) {
      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/detail',
                  arguments: list[index]),
              child: Card(
                  child: ListTile(
                    title: Text(
                      list[index]['item_name'],
                    ),
                    subtitle: Text("harga\t:" + list[index]['price']),
                    trailing:Container(
                        child: MaterialButton(
                            child: Text('Tambah'),
                            color: Colors.orangeAccent,
                            onPressed : ()  => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
          builder: (context) => Transaksi2(arguments: null),
          )
                    )
                    )
                    ,
                    )
                  )
              )
          );
        },
      );
    } else {
      return Text(" No Data");
    }
  }
}

