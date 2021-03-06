import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Using loading");
    return Center(
        child: Container(
      height: Dimensions.height20 * 5,
      width: Dimensions.height20 * 5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.height20 * 5 / 2),
          color: Colors.blue),
      alignment: Alignment.center,
      child: CircularProgressIndicator(color: Colors.white),
    ));
  }
}
