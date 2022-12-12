
import 'package:flutter/material.dart';
import 'package:uas_aplikasi_toko/transaksi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class Transaksi2 extends StatefulWidget {
  const Transaksi2( {Key? key, required arguments}) : super(key: key);

  @override
  State<Transaksi2> createState() => _Transaksi2State();
}

class _Transaksi2State extends State<Transaksi2> {

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
          title: Text('Transaksi'),centerTitle: true,
          leading: IconButton(icon:Icon(Icons.arrow_back),
              onPressed:() => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => Transaksi(arguments: null)
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
                    trailing: Text("stok\t:" + list[index]['stock']),
                  )));
        },
      );
    } else {
      return Text(" No Data");
    }
  }
}


