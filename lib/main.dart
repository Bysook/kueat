import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/screens/home/home_page.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';
import 'controllers/cart_controller.dart';
import 'helper/dependencies.dart' as dep;
import 'routes/route_helper.dart';

Future<void> main() async {
  //Con este metodo de Flutter nos aseguramos que nuestras dependencias
  //se carguen correctamente antes de iniciar la app, y asi poder,
  //esperar a que se carguen y finalmente pintarlas en la UI.
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

//////////////////////
//MAIN TIME 0:25:18//
////////////////////

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ERROR LINE
    Get.find<CartController>().getCartData();

    //WidgetsFlutterBinding.ensureInitialized();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          //title: 'KuEat',
          home: HomePage(),
          initialRoute: RouteHelper.getSplashScreen(),
          getPages: RouteHelper.routes,
          theme:
              ThemeData(primaryColor: AppColors.mainColor, fontFamily: "Lato"),
        );
      });
    });
  }
}
