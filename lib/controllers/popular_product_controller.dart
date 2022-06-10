import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;

  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCarItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("Se han obtenido los productos");
      _popularProductList = [];
      //Asegurarme de que los datos se estan obteniendo del servidor
      _popularProductList.addAll(Product.fromJson(response.body).products);
      //print(_popularProductList);
      _isLoaded = true;
      update();
    } else {
      //print("No se han obtenido los productos");
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      //print("Se ha incrementado el carrito");
      _quantity = checkQuantity(_quantity + 1);
    } else {
      //print("Se ha decrementado el carrito");
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar("¡ AVISO !", "La cantidad no puede ser negativa.",
          backgroundColor: Colors.purple[800], colorText: Colors.white);
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar(
          "¡ AVISO !", "Has llegado al limite de pedidos de este producto.",
          backgroundColor: Colors.purple[800], colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = cart.existInCart(product);
    if (exist) {
      _inCartItems = _cart.getQueantity(product);
    }
  }

  void addItem(ProductModel product) {
    //if (quantity > 0) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQueantity(product);
    _cart.items.forEach((key, value) {});
    /*  } else {
      Get.snackbar(
          "¡ AVISO !", "Tienes que añadir al menos un producto al carrito.",
          backgroundColor: Colors.purple[800], colorText: Colors.white);
    }*/
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
