// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:uas_aplikasi_toko/constants/constants.dart';

class ShowPrice extends StatelessWidget {
  final double TotalPrice;

  const ShowPrice({Key? key, required this.TotalPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          TotalPrice.toStringAsFixed(2).toString(),
          style: TextConstants.totalPriceStyle,
        ),
      ],
    );
  }
}
