import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/location_controller.dart';
import 'package:food_delivery/controllers/user_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLogged();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
              child: BigText(text: "Perfil", size: 24, color: Colors.white)),
        ),
        body: GetBuilder<UserController>(
          builder: ((userController) {
            return _userLoggedIn
                ? (userController.isLoading
                    ? Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(top: Dimensions.height20),
                        child: Column(
                          children: [
                            AppIcon(
                              icon: Icons.person,
                              bckColor: Colors.blue,
                              iconColor: Colors.white,
                              iconSize:
                                  Dimensions.height45 + Dimensions.height30,
                              size: Dimensions.height15 * 10,
                            ),
                            SizedBox(
                              height: Dimensions.height30,
                            ),
                            Expanded(
                                child: SingleChildScrollView(
                                    child: Column(
                              children: [
                                AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.person,
                                      bckColor: Colors.blue,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                        text: userController.userModel.name)),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.phone,
                                      bckColor: Colors.greenAccent,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                        text: userController.userModel.phone)),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.email,
                                      bckColor: Colors.greenAccent,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                        text: userController.userModel.email)),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                GetBuilder<LocationController>(
                                    builder: (locationController) {
                                  if (_userLoggedIn &&
                                      locationController.addressList.isEmpty) {
                                    return GestureDetector(
                                        onTap: () {
                                          Get.offNamed(
                                              RouteHelper.getAddressPage());
                                        },
                                        child: AccountWidget(
                                            appIcon: AppIcon(
                                              icon: Icons.location_city,
                                              bckColor: Colors.greenAccent,
                                              iconColor: Colors.white,
                                              iconSize:
                                                  Dimensions.height10 * 5 / 2,
                                              size: Dimensions.height10 * 5,
                                            ),
                                            bigText: BigText(
                                                text:
                                                    "Selecciona tu dirección")));
                                  } else {
                                    return GestureDetector(
                                        onTap: () {
                                          Get.offNamed(
                                              RouteHelper.getAddressPage());
                                        },
                                        child: AccountWidget(
                                            appIcon: AppIcon(
                                              icon: Icons.location_city,
                                              bckColor: Colors.greenAccent,
                                              iconColor: Colors.white,
                                              iconSize:
                                                  Dimensions.height10 * 5 / 2,
                                              size: Dimensions.height10 * 5,
                                            ),
                                            bigText:
                                                BigText(text: "Tu dirección")));
                                  }
                                }),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Get.toNamed(RouteHelper.getChatBot());
                                    },
                                    child: AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.message,
                                          bckColor: Colors.redAccent,
                                          iconColor: Colors.white,
                                          iconSize: Dimensions.height10 * 5 / 2,
                                          size: Dimensions.height10 * 5,
                                        ),
                                        bigText: BigText(text: "Soporte"))),
                                GestureDetector(
                                    onTap: () {
                                      if (Get.find<AuthController>()
                                          .userLogged()) {
                                        Get.find<AuthController>()
                                            .clearSharedData();
                                        Get.find<CartController>().clear();
                                        Get.find<CartController>()
                                            .clearCartHistory();
                                        Get.find<LocationController>()
                                            .clearAddressList();
                                        Get.offNamed(
                                            RouteHelper.getSignInPage());
                                      }
                                    },
                                    child: AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.logout_outlined,
                                          bckColor: Colors.redAccent,
                                          iconColor: Colors.white,
                                          iconSize: Dimensions.height10 * 5 / 2,
                                          size: Dimensions.height10 * 5,
                                        ),
                                        bigText:
                                            BigText(text: "Cerrar sesión")))
                              ],
                            )))
                          ],
                        ))
                    : CustomLoader())
                : Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: double.maxFinite,
                            height: Dimensions.height20 * 15,
                            margin: EdgeInsets.only(
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        AssetImage("assets/image/guest.png"))),
                          ),
                          GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteHelper.getSignInPage());
                              },
                              child: Container(
                                width: double.maxFinite,
                                height: Dimensions.height20 * 5,
                                margin: EdgeInsets.only(
                                    left: Dimensions.width20,
                                    right: Dimensions.width20),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                ),
                                child: Center(
                                    child: BigText(
                                  text: "Iniciar sesión",
                                  color: Colors.white,
                                  size: Dimensions.font26,
                                )),
                              ))
                        ],
                      ),
                    ),
                  );
          }),
        ));
  }
}
