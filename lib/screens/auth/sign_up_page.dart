import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/models/signUp_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import '../../base/show_custom_message.dart';
import '../../routes/route_helper.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var singUpImages = ["g.png", "f.png"];

    void _registration(AuthController authController) {
      String nombre = nameController.text.trim();
      String numTlfno = phoneController.text.trim();
      String email = emailController.text.trim();
      String pass = passController.text.trim();

      if (nombre.isEmpty) {
        showMessageSnackBar("Introduce tu nombre", title: "Nombre");
      } else if (numTlfno.isEmpty) {
        showMessageSnackBar("Introduce tu telefono", title: "Telefono");
      } else if (email.isEmpty) {
        showMessageSnackBar("Introduce tu email", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showMessageSnackBar("Introduce un email válido",
            title: "Email no válido");
      } else if (pass.isEmpty) {
        showMessageSnackBar("Introduce tu contraseña", title: "Contraseña");
      } else if (pass.length < 6) {
        showMessageSnackBar(
            "La contraseña debe de tener al menos seis caracteres",
            title: "Contraseña");
      } else {
        SignUpModel signUpModel = SignUpModel(
            name: nombre, telefono: numTlfno, email: email, pass: pass);
        authController.registro(signUpModel).then((status) {
          if (status.isSuccess) {
            print("Registro Correcto");
             Get.offNamed(RouteHelper.getInitial());
          } else {
            showMessageSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (_authController) {
        return !_authController.isLoading
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
                    AppTextField(
                        textController: emailController,
                        icon: Icons.email,
                        hintText: "Email"),
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
                      height: Dimensions.height20,
                    ),
                    AppTextField(
                        textController: nameController,
                        icon: Icons.person,
                        hintText: "Nombre"),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AppTextField(
                        textController: phoneController,
                        icon: Icons.phone,
                        hintText: "Teléfono"),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    GestureDetector(
                        onTap: () {
                          _registration(_authController);
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
                            text: "Registrarse",
                            size: Dimensions.font16 + Dimensions.font20 / 2,
                            color: Colors.white,
                          )),
                        )),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    RichText(
                        text: TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.back(),
                            text: "Ya estas registrado?",
                            style: TextStyle(
                                color: AppColors.mainBlackColor,
                                fontSize: Dimensions.font20))),
                    SizedBox(
                      height: Dimensions.screenHeight * 0.03,
                    ),
                    /*RichText(
                        text: TextSpan(
                            text: "Registrate usando:",
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimensions.font16))),*/
                    /*Wrap(
                      children: List.generate(
                          1,
                          (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: Dimensions.radius30,
                                backgroundImage: AssetImage(
                                    "assets/image/" + singUpImages[index]),
                              ))),
                    )*/
                  ],
                ))
            : const CustomLoader();
      }),
    );
  }
}
