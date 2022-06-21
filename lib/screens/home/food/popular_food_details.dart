import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';

import 'package:food_delivery/utils/dimensions.dart';

import 'package:food_delivery/widgets/app_icon.dart';
import 'package:get/get.dart';
import '../../../utils/colors.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/extendable_text.dart';
import '../../../widgets/icon_and_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const PopularFoodDetail({Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    //(print("El ID de producto es: " + pageId.toString());
    //print("El Nombre de producto es: " + product.name.toString());
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(product.img!))),
            ),
          ),
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (page == "cartPage") {
                          Get.toNamed(RouteHelper.getCartPage());
                        } else {
                          Get.toNamed(RouteHelper.getInitial());
                        }
                      },
                      child: AppIcon(
                        icon: Icons.arrow_back_ios_new,
                      )),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return GestureDetector(
                        onTap: () {
                          if (controller.totalItems >= 1) {
                            Get.toNamed(RouteHelper.getCartPage());
                          } else {
                            Get.snackbar("¡ AVISO !",
                                "No hay ningun producto en el carrito.",
                                backgroundColor: AppColors.mainColor,
                                colorText: Colors.white);
                          }
                        },
                        child: Stack(
                          children: [
                            AppIcon(icon: Icons.shopping_cart_outlined),
                            controller.totalItems >= 1
                                ? Positioned(
                                    right: 0,
                                    top: 0,
                                    child: AppIcon(
                                        icon: Icons.circle,
                                        size: 20,
                                        iconColor: Colors.transparent,
                                        bckColor: AppColors.mainColor))
                                : Container(),
                            controller.totalItems >= 1
                                ? Positioned(
                                    right: 6,
                                    top: 3,
                                    child: BigText(
                                      text: Get.find<PopularProductController>()
                                          .totalItems
                                          .toString(),
                                      size: 12,
                                      color: Colors.white,
                                    ))
                                : Container()
                          ],
                        ));
                  })
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize - 20,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: product.name!, size: Dimensions.font26),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                  product.stars!,
                                  (index) => Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 17,
                                      )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconAndTextWidget(
                                icon: Icons.reviews_rounded,
                                text: product.reviews!.toString() + " reviews",
                                iconColor: AppColors.iconColor1),
                            IconAndTextWidget(
                                icon: Icons.not_listed_location_sharp,
                                text: product.location!,
                                iconColor: Colors.blue),
                            IconAndTextWidget(
                                icon: Icons.access_time_rounded,
                                text: product.minutes!.toString() + " min",
                                iconColor: AppColors.mainColor)
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: Dimensions.height20),
                    BigText(text: "Descripción"),
                    SizedBox(height: Dimensions.height20),
                    Expanded(
                        child: SingleChildScrollView(
                      child: ExpandTextWidget(
                        text: product.description!,
                      ),
                    ))
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct) {
          return Container(
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
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(false);
                          },
                          child: Icon(
                            Icons.remove,
                            color: AppColors.signColor,
                          )),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      BigText(text: popularProduct.inCarItems.toString()),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(true);
                          },
                          child: Icon(
                            Icons.add,
                            color: AppColors.signColor,
                          )),
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      popularProduct.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          left: Dimensions.height20,
                          right: Dimensions.height20,
                          bottom: Dimensions.height20),
                      child: BigText(
                        text: "${product.price}€ | Añadir",
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
