import 'package:food_delivery/screens/address/add_address_page.dart';
import 'package:food_delivery/screens/address/pick_address_map.dart';
import 'package:food_delivery/screens/auth/sign_in_page.dart';
import 'package:food_delivery/screens/chatbot/chat-bot.dart';
import 'package:food_delivery/screens/home/cart/cart_page.dart';
import 'package:food_delivery/screens/home/food/popular_food_details.dart';
import 'package:food_delivery/screens/home/food/recommended_food_detail.dart';
import 'package:food_delivery/screens/splash/splash_page.dart';
import 'package:food_delivery/screens/tensorflow/tensorflow_predict.dart';
import 'package:get/get.dart';
import '../screens/home/home_page.dart';

//Podemos modificar las transiciones
class RouteHelper {
  static const String splashScreen = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String signIn = "/sign-in";
  static const String tensorFlow = "/tensor-flow";
  static const String addAddress = "/add-address";
  static const String pickAddressMap = "/pick-address";
  static const String chatbot = "/chat-bot";

  static String getSplashScreen() => '$splashScreen';
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getInitial() => '$initial';
  static String getRecommended(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';
  static String getSignInPage() => '$signIn';
  static String getTensorFlowPage() => '$tensorFlow';
  static String getAddressPage() => '$addAddress';
  static String getPickAddressPage() => '$pickAddressMap';
  static String getChatBot() => '$chatbot';

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.downToUp),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.cupertinoDialog),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.cupertinoDialog),
    GetPage(
        name: signIn,
        page: () {
          return SignInPage();
        },
        transition: Transition.fade),
    GetPage(
        name: tensorFlow,
        page: () {
          return TensorFlowPage();
        },
        transition: Transition.fade),
    GetPage(
        name: chatbot,
        page: () {
          return ChatBotPage();
        },
        transition: Transition.fade),
    GetPage(
        name: addAddress,
        page: () {
          return AddAddressPage();
        },
        transition: Transition.fade),
    GetPage(
      name: pickAddressMap,
      page: () {
        PickAddressMap _pickAddress = Get.arguments;
        return _pickAddress;
      },
    )
  ];
}
