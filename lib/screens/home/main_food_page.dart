import 'package:flutter/material.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/screens/home/food_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';

import 'package:get/get.dart';
import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class MainFoodPage extends StatefulWidget {
  MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    //width: 392
    //heifht: 781
    //print("Height: " + MediaQuery.of(context).size.width.toString());

    return RefreshIndicator(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "KuEat",
                          style: TextStyle(
                              fontSize: Dimensions.font16 * 2,
                              color: AppColors.mainColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Balinesia'),
                        )
                      ],
                    ),
                    Center(
                      child: GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getTensorFlowPage());
                          },
                          child: Container(
                            width: Dimensions.height45,
                            height: Dimensions.height45,
                            child: Icon(
                              Icons.upload_rounded,
                              color: Colors.white,
                              size: Dimensions.iconSize24,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius15),
                              color: AppColors.mainColor,
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: FoodPageBody(),
            )),
          ],
        ),
        onRefresh: _loadResources);
  }
}
