import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class ProductDetails extends StatelessWidget {
  final String productName;
  final String productDescription;
  final String productImage;

  const ProductDetails(
      {super.key,
      required this.productName,
      required this.productDescription,
      required this.productImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              productImage,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),
            Text(productDescription),
          ],
        ),
      ),
    );
  }
}