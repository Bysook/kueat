import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/utils/map_utils.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'dart:io';
import 'dart:async';
import '../../widgets/extendable_text.dart';

class TensorFlowPage extends StatefulWidget {
  @override
  _TensorFlowPage createState() => _TensorFlowPage();
}

class _TensorFlowPage extends State<TensorFlowPage> {
  XFile? _image;
  bool _loading = false;
  List<dynamic>? _outputs;

  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  classifyImage(image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      //Declare List _outputs in the class which will be used to show the classified classs name and confidence
      _outputs = output;
    });
  }

  Future pickImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
    });
    classifyImage(image);
  }

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Clasificador de comida'),
        backgroundColor: AppColors.mainColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home_rounded),
            color: Colors.white,
            onPressed: () {
              Get.toNamed(RouteHelper.getInitial());
            },
          )
        ],
      ),
      body: _loading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(color: AppColors.mainColor),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border:
                            Border.all(width: 2, color: AppColors.mainColor)),
                    child: _image == null
                        ? Container()
                        : Image.file(File(_image!.path)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _outputs != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                BigText(
                                  text: "${_outputs![0]["label"]}"
                                      .replaceAll(RegExp(r'[0-9]'), '')
                                      .toString(),
                                  size: Dimensions.font20 * 2,
                                ),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                Row(
                                  children: [
                                    //38.77893708474822, -3.3899646154287995
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: Dimensions.width10),
                                      child: Icon(
                                        Icons.score_rounded,
                                        color: AppColors.mainColor,
                                        size: 30,
                                      ),
                                    ),
                                    BigText(
                                      text:
                                          " ${(_outputs![0]["confidence"] * 100.0).toString().substring(0, 2) + "%"}",
                                      size: Dimensions.font20,
                                    ),
                                    SizedBox(
                                      width: Dimensions.width10,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: Dimensions.width10),
                                      child: GestureDetector(
                                          onTap: () {
                                            if ("${_outputs![0]["label"]}"
                                                    .replaceAll(
                                                        RegExp(r'[0-9]'), '')
                                                    .toString()
                                                    .trim() ==
                                                "Hamburguesa") {
                                              MapUtils.navigateTo(
                                                  38.77878235317182,
                                                  -3.3899914375171223);
                                            } else if ("${_outputs![0]["label"]}"
                                                    .replaceAll(
                                                        RegExp(r'[0-9]'), '')
                                                    .toString()
                                                    .trim() ==
                                                "Bebida") {
                                              MapUtils.navigateTo(
                                                  38.75784397094879,
                                                  -3.38298868842795);
                                            } else if ("${_outputs![0]["label"]}"
                                                    .replaceAll(
                                                        RegExp(r'[0-9]'), '')
                                                    .toString()
                                                    .trim() ==
                                                "Helado") {
                                              MapUtils.navigateTo(
                                                  38.76095049917126,
                                                  -3.386703544250446);
                                            } else if ("${_outputs![0]["label"]}"
                                                    .replaceAll(
                                                        RegExp(r'[0-9]'), '')
                                                    .toString()
                                                    .trim() ==
                                                "Perrito Caliente") {
                                              MapUtils.navigateTo(
                                                  40.39621317709803,
                                                  -3.6651842307223164);
                                            } else if ("${_outputs![0]["label"]}"
                                                    .replaceAll(
                                                        RegExp(r'[0-9]'), '')
                                                    .toString()
                                                    .trim() ==
                                                "Pizza") {
                                              MapUtils.navigateTo(
                                                  38.75801964380779,
                                                  -3.3837881730860286);
                                            } else if ("${_outputs![0]["label"]}"
                                                    .replaceAll(
                                                        RegExp(r'[0-9]'), '')
                                                    .toString()
                                                    .trim() ==
                                                "Tortilla Española") {
                                              MapUtils.navigateTo(
                                                  38.75791090158271,
                                                  -3.3830101460989637);
                                            } else if ("${_outputs![0]["label"]}"
                                                    .replaceAll(
                                                        RegExp(r'[0-9]'), '')
                                                    .toString()
                                                    .trim() ==
                                                "Sushi") {
                                              MapUtils.navigateTo(
                                                  40.446057411260924,
                                                  -3.6955966883921865);
                                            } else if ("${_outputs![0]["label"]}"
                                                    .replaceAll(
                                                        RegExp(r'[0-9]'), '')
                                                    .toString()
                                                    .trim() ==
                                                "Pollo Asado") {
                                              MapUtils.navigateTo(
                                                  38.78033959972663,
                                                  -3.3888711884275136);
                                            } else if ("${_outputs![0]["label"]}"
                                                    .replaceAll(
                                                        RegExp(r'[0-9]'), '')
                                                    .toString()
                                                    .trim() ==
                                                "CusCus Marroquí") {
                                              MapUtils.navigateTo(
                                                  36.51818986330364,
                                                  -4.890904886624568);
                                            }
                                          },
                                          child: Icon(
                                            Icons.map_rounded,
                                            color: Colors.green,
                                            size: 30,
                                          )),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: Dimensions.height20),
                            BigText(text: "  Ingredientes"),
                            SizedBox(height: Dimensions.height20),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: Dimensions.width10),
                                child: ExpandTextWidget(text: (() {
                                  if ("${_outputs![0]["label"]}"
                                          .replaceAll(RegExp(r'[0-9]'), '')
                                          .toString()
                                          .trim() ==
                                      "Hamburguesa") {
                                    return "500 g. de carne de ternera de calidad, 1 diente de ajo, 1 huevo Pedimos a nuestro carnicero que nos pique la carne que hayamos elegido para preparar las hamburguesas. Es importante no sólo elegir la carne sino que el carnicero la triture al momento. Cuando cortas una carne, lo que estás haciendo es romper los tejidos y hacer que se oxide.";
                                  } else if ("${_outputs![0]["label"]}"
                                          .replaceAll(RegExp(r'[0-9]'), '')
                                          .toString()
                                          .trim() ==
                                      "Bebida") {
                                    return "Hacer buenos combinados no tiene demasiado misterio: la única máxima reside en respetar a rajatabla las proporciones, ser cuidadoso en el manejo de copas y hielos y usar destilados de cierta calidad. En muchos casos, ni siquiera se necesita una coctelera: aunque este instrumento es muy útil, la mayoría de los cócteles se pueden utilizar mezclando bien los ingredientes en una jarra.";
                                  } else if ("${_outputs![0]["label"]}"
                                          .replaceAll(RegExp(r'[0-9]'), '')
                                          .toString()
                                          .trim() ==
                                      "Pizza") {
                                    return "No importa la época del año ni el momento del día: una pizza siempre apetece, y si aprendemos a hacerlas bien en casa tendremos un repetorio infinito de ingredientes con las que prepararlas. Hacer masa de pizza casera es bien sencillo. Y baratísimo. Solo necesitamos harina, agua, levadura de panadería y aceite de oliva. Y, aunque hay muchas recetas, no es necesario hacer esta con más de tres horas de fermentación.";
                                  } else if ("${_outputs![0]["label"]}"
                                          .replaceAll(RegExp(r'[0-9]'), '')
                                          .toString()
                                          .trim() ==
                                      "Kebab") {
                                    return "El kebab es originario de Asia y Oriente Medio. Existen multitud de variedades tanto en la manera de servirlos como en la manera de prepararlos, aunque la forma que se le conoce normalmente es con pan de pita o pan durum junto con sus vegetales  correspondientes, cómo la lechuga, zanahoria, col, cebolla, tomate etc. A lo que tampoco le puede falta su salsa correspondiente que ya será a elegir dependiendo de vuestro gusto.";
                                  } else if ("${_outputs![0]["label"]}"
                                          .replaceAll(RegExp(r'[0-9]'), '')
                                          .toString()
                                          .trim() ==
                                      "Sushi") {
                                    return "Una bandeja de buen sushi en un buen restaurante japonés es un lujo que por desgracia no siempre tenemos al alcance de la mano, bien porque no en todas las ciudades hay restaurantes de ese tipo o bien porque, si los hay y realmente son buenos, los precios no suelen ser nada baratos.";
                                  } else if ("${_outputs![0]["label"]}"
                                          .replaceAll(RegExp(r'[0-9]'), '')
                                          .toString()
                                          .trim() ==
                                      "Helado") {
                                    return "Los helados de leche o crema son aquellos que en su composición contienen grasa láctea, leche en polvo y proteínas lácteas. Durante el proceso de elaboración han incorporado una determinada cantidad de aire. Se presentan de forma pastosa y a pesar de estar sometidos a bajas temperatura tienen que presentar una textura con la suficiente plasticidad para su servicio y consumo.";
                                  } else if ("${_outputs![0]["label"]}"
                                          .replaceAll(RegExp(r'[0-9]'), '')
                                          .toString()
                                          .trim() ==
                                      "Tortilla Española") {
                                    return "Los helados de leche o crema son aquellos que en su composición contienen grasa láctea, leche en polvo y proteínas lácteas. Durante el proceso de elaboración han incorporado una determinada cantidad de aire. Se presentan de forma pastosa y a pesar de estar sometidos a bajas temperatura tienen que presentar una textura con la suficiente plasticidad para su servicio y consumo.";
                                  }
                                  return "No existen los ingredientes para este elemento.";
                                })()))
                          ],
                        )
                      : Container(
                          child: Text("Esperando imagen o camara."),
                        )
                ],
              ),
            ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: AppColors.mainColor,
        spaceBetweenChildren: 5,
        children: [
          SpeedDialChild(
              child: Icon(Icons.photo),
              label: 'Galería',
              onTap: () => openGallery()),
          SpeedDialChild(
              child: Icon(Icons.camera_alt_rounded),
              label: 'Camara',
              onTap: () => openCamera())
        ],
      ),
    );
  }

  //camera method
  Future openGallery() async {
    var piture = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = piture;
    });
    classifyImage(piture);
  }

  Future openCamera() async {
    var image = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
    classifyImage(image);
  }
}
