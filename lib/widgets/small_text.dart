import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overflow;

  SmallText(
      {Key? key,
      this.color = const Color(0xFFccc7c5),
      this.height = 1.2,
      required this.text,
      //Cuando se le pasa un texto mas largo de lo normal, añade puntos, esto es variable y puedes pasarle distintos tipos de valores a TxtOverflow.
      this.size = 12,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Roboto', color: color, fontSize: size, height: height),
    );
  }
}
