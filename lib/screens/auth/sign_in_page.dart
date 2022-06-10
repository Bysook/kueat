import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/screens/auth/sign_up_page.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../base/show_custom_message.dart';
import '../../controllers/auth_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var passController = TextEditingController();

    void _login(AuthController authController) {
      String phone = phoneController.text.trim();
      String pass = passController.text.trim();

      if (phone.isEmpty) {
        showMessageSnackBar("Introduce tu email", title: "Email");
      } else if (pass.isEmpty) {
        showMessageSnackBar("Introduce tu contraseña", title: "Contraseña");
      } else if (pass.length < 6) {
        showMessageSnackBar(
            "La contraseña debe de tener al menos seis caracteres",
            title: "Contraseña");
      } else {
        authController.login(phone, pass).then((status) {
          if (status.isSuccess) {
            print("Login Correcto");
            Get.toNamed(RouteHelper.getInitial());
          } else {
            showMessageSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: ((authController) {
        return !authController.isLoading
            ? SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: Dimensions.screenHeight * 0.05,
                    ),
                    Container(
                      height: Dimensions.screenHeight * 0.25,
                      child: Center(
                          child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 80,
                        backgroundImage:
                            AssetImage("assets/image/logo part 1.png"),
                      )),
                    ),
                    //BIENVENIDA

                    Container(
                      margin: EdgeInsets.only(left: Dimensions.width20),
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bienvenido",
                            style: TextStyle(
                                fontSize: Dimensions.font20 * 3 +
                                    Dimensions.font20 / 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Iniciar Sesión",
                            style: TextStyle(
                                fontSize: Dimensions.font20,
                                color: Colors.grey[500]),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AppTextField(
                        textController: phoneController,
                        icon: Icons.phone,
                        hintText: "Teléfeno"),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AppTextField(
                      textController: passController,
                      icon: Icons.password,
                      hintText: "Contraseña",
                      isObscure: true,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                                text: "",
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: Dimensions.font20)))
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.screenHeight * 0.03,
                    ),
                    GestureDetector(
                        onTap: () {
                          _login(authController);
                        },
                        child: Container(
                          width: Dimensions.screenWidth / 2,
                          height: Dimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius30),
                              color: Colors.amber),
                          child: Center(
                              child: BigText(
                            text: "Iniciar Sesión",
                            size: Dimensions.font16 + Dimensions.font20 / 2,
                            color: Colors.white,
                          )),
                        )),
                    SizedBox(
                      height: Dimensions.screenHeight * 0.03,
                    ),
                    RichText(
                        text: TextSpan(
                            text: "No tienes cuenta?",
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimensions.font16),
                            children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(() => SignUpPage(),
                                    transition: Transition.fade),
                              text: " Crear Cuenta",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.mainBlackColor,
                                  fontSize: Dimensions.font16))
                        ])),
                  ],
                ))
            : CustomLoader();
      })),
    );
  }
}
