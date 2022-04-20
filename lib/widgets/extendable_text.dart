import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

class ExpandTextWidget extends StatefulWidget {
  final String text;
  ExpandTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandTextWidget> createState() => _ExpandTextWidgetState();
}

class _ExpandTextWidgetState extends State<ExpandTextWidget> {
  late String firstText;
  late String secondText;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.63;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstText = widget.text.substring(0, textHeight.toInt());
      secondText =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstText = widget.text;
      secondText = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondText.isEmpty
          ? SmallText(
              color: AppColors.paraColor,
              size: Dimensions.font14,
              text: firstText)
          : Column(
              children: [
                SmallText(
                    height: 1.6,
                    color: AppColors.paraColor,
                    size: Dimensions.font14,
                    text: hiddenText
                        ? (firstText + "...")
                        : (firstText + secondText)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      hiddenText
                          ? SmallText(
                              text: "Show more",
                              color: AppColors.mainColor,
                            )
                          : SmallText(
                              text: "Show less",
                              color: AppColors.mainColor,
                            ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
