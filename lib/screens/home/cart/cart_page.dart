import 'package:flutter/material.dart';
import 'package:food_delivery/base/no_data_page.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/location_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';

import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: Dimensions.height20 * 3,
                left: Dimensions.width20,
                right: Dimensions.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: AppIcon(
                          icon: Icons.arrow_back_ios_new,
                          iconColor: Colors.white,
                          bckColor: AppColors.mainColor,
                        )),
                    SizedBox(
                      width: Dimensions.width20 * 5,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getInitial());
                        },
                        child: AppIcon(
                          icon: Icons.home_filled,
                          iconColor: Colors.white,
                          bckColor: AppColors.mainColor,
                        )),
                    AppIcon(
                      icon: Icons.shopping_cart,
                      iconColor: Colors.white,
                      bckColor: AppColors.mainColor,
                    )
                  ],
                )),
            GetBuilder<CartController>(builder: (_cartController) {
              return _cartController.getItems.length > 0
                  ? Positioned(
                      top: Dimensions.height20 * 5,
                      right: Dimensions.width20,
                      bottom: 0,
                      left: Dimensions.width20,
                      child: Container(
                        margin: EdgeInsets.only(top: Dimensions.height15),
                        //color: Colors.red,
                        child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: GetBuilder<CartController>(
                                builder: (cartController) {
                              var _cartList = cartController.getItems;
                              return ListView.builder(
                                  itemCount: _cartList.length,
                                  itemBuilder: (_, index) {
                                    return Container(
                                      height: Dimensions.height20 * 5,
                                      width: double.maxFinite,
                                      child: Row(children: [
                                        GestureDetector(
                                            onTap: () {
                                              var popularIndex = Get.find<
                                                      PopularProductController>()
                                                  .popularProductList
                                                  .indexOf(_cartList[index]
                                                      .product!);

                                              if (popularIndex >= 0) {
                                                Get.toNamed(
                                                    RouteHelper.getPopularFood(
                                                        popularIndex,
                                                        "cartPage"));
                                              } else {
                                                var recommendedIndex = Get.find<
                                                        RecommendedProductController>()
                                                    .recommendedProductList
                                                    .indexOf(_cartList[index]
                                                        .product!);
                                                if (recommendedIndex < 0) {
                                                  Get.snackbar("¡ AVISO !",
                                                      "Este producto no esta disponible.",
                                                      backgroundColor:
                                                          AppColors.mainColor,
                                                      colorText: Colors.white);
                                                } else {
                                                  Get.toNamed(RouteHelper
                                                      .getRecommended(
                                                          recommendedIndex,
                                                          "cartpage"));
                                                }
                                              }
                                            },
                                            child: Container(
                                              width: Dimensions.height20 * 5,
                                              height: Dimensions.height20 * 5,
                                              margin: EdgeInsets.only(
                                                  bottom: Dimensions.height10),
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          cartController
                                                              .getItems[index]
                                                              .img!)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.radius20),
                                                  color: Colors.white),
                                            )),
                                        SizedBox(
                                          width: Dimensions.width10,
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: Dimensions.height20 * 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                BigText(
                                                    text: cartController
                                                        .getItems[index].name!,
                                                    color: Colors.black54),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    BigText(
                                                        text: cartController
                                                                .getItems[index]
                                                                .price
                                                                .toString() +
                                                            "€",
                                                        color: Colors.black54),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: Dimensions
                                                              .height10,
                                                          left: Dimensions
                                                              .height10,
                                                          right: Dimensions
                                                              .height10,
                                                          bottom: Dimensions
                                                              .height10),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  Dimensions
                                                                      .radius20),
                                                          color: Colors.white),
                                                      child: Row(
                                                        children: [
                                                          GestureDetector(
                                                              onTap: () {
                                                                cartController.addItem(
                                                                    _cartList[
                                                                            index]
                                                                        .product!,
                                                                    -1);
                                                              },
                                                              child: Icon(
                                                                Icons.remove,
                                                                color: AppColors
                                                                    .signColor,
                                                              )),
                                                          SizedBox(
                                                            width: Dimensions
                                                                    .width10 /
                                                                2,
                                                          ),
                                                          BigText(
                                                              text: _cartList[
                                                                      index]
                                                                  .quantity!
                                                                  .toString()),
                                                          SizedBox(
                                                            width: Dimensions
                                                                    .width10 /
                                                                2,
                                                          ),
                                                          GestureDetector(
                                                              onTap: () {
                                                                cartController.addItem(
                                                                    _cartList[
                                                                            index]
                                                                        .product!,
                                                                    1);
                                                              },
                                                              child: Icon(
                                                                Icons.add,
                                                                color: AppColors
                                                                    .signColor,
                                                              )),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ]),
                                    );
                                  });
                            })),
                      ))
                  : NodataPage(text: "Tu carrito está vacío");
            })
          ],
        ),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (cartController) {
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
                child: cartController.getItems.length > 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: Dimensions.height20,
                                left: Dimensions.height20,
                                right: Dimensions.height20,
                                bottom: Dimensions.height20),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Dimensions.width10 / 2,
                                ),
                                BigText(
                                    text:
                                        cartController.totalAmount.toString() +
                                            "€"),
                                SizedBox(
                                  width: Dimensions.width10 / 2,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                if (Get.find<AuthController>().userLogged()) {
                                  if (Get.find<LocationController>()
                                      .addressList
                                      .isEmpty) {
                                    Get.toNamed(RouteHelper.getAddressPage());
                                  } else {
                                    cartController.addToHistory();
                                    Get.toNamed(RouteHelper.getInitial());
                                  }
                                } else {
                                  Get.toNamed(RouteHelper.getSignInPage());
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: Dimensions.height20,
                                    left: Dimensions.height20,
                                    right: Dimensions.height20,
                                    bottom: Dimensions.height20),
                                child: BigText(
                                  text: "Confirmar",
                                  color: Colors.white,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20),
                                    color: AppColors.mainColor),
                              ))
                        ],
                      )
                    : Container());
          },
        ));
  }
}
