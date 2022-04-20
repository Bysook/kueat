import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/extendable_text.dart';

import '../../../widgets/big_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.clear,
                ),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                    child: BigText(
                  text: "Slider App Bar",
                  size: Dimensions.font20,
                )),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20))),
              ),
            ),
            backgroundColor: AppColors.mainColor,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food0.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                child: ExpandTextWidget(
                    text:
                        "jnjasdfjasdfjnjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnjasdfjasdfjnajsfnajsdnfajjnajsfnajsdnfajajsfnajsdnfaj"),
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
              )
            ],
          ))
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              padding: EdgeInsets.only(
                  right: Dimensions.width20 * 2.5,
                  left: Dimensions.width20 * 2.5,
                  top: Dimensions.height10,
                  bottom: Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.remove,
                    bckColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.iconSize24,
                  ),
                  BigText(
                    text: "12.33€ " + " x " + " 0",
                    color: AppColors.mainBlackColor,
                    size: Dimensions.font26,
                  ),
                  AppIcon(
                    iconSize: Dimensions.iconSize24,
                    icon: Icons.add,
                    bckColor: AppColors.mainColor,
                    iconColor: Colors.white,
                  ),
                ],
              )),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.height30,
                right: Dimensions.height30),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      left: Dimensions.height20,
                      right: Dimensions.height20,
                      bottom: Dimensions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      left: Dimensions.height20,
                      right: Dimensions.height20,
                      bottom: Dimensions.height20),
                  child: BigText(
                    text: "10€ Add To Cart",
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
