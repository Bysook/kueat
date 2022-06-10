import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_button.dart';
import 'package:food_delivery/controllers/location_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickAddressMap extends StatefulWidget {
  final bool fromSignup;
  final bool fromAddress;
  final GoogleMapController? googleMapController;

  PickAddressMap(
      {Key? key,
      required this.fromAddress,
      required this.fromSignup,
      this.googleMapController})
      : super(key: key);

  @override
  State<PickAddressMap> createState() => _PickAddressMapState();
}

class _PickAddressMapState extends State<PickAddressMap> {
  late LatLng _initialPosition;
  late GoogleMapController _mapController;
  late CameraPosition _cameraPosition;

  @override
  void initState() {
    super.initState();
    //Compruebo si el usuario ha seteado informacion o no
    if (Get.find<LocationController>().addressList.isEmpty) {
      _initialPosition = LatLng(38.77369648887228, -3.397516591514719);
      _cameraPosition = CameraPosition(target: _initialPosition, zoom: 17);
    } else {
      //Si hay datos, podemos obtener estis datios de la base de datos
      if (Get.find<LocationController>().addressList.isNotEmpty) {
        _initialPosition = LatLng(
            double.parse(Get.find<LocationController>().getAddress["latitude"]),
            double.parse(
                Get.find<LocationController>().getAddress["longitude"]));
        _cameraPosition = CameraPosition(target: _initialPosition, zoom: 17);
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (locationController) {
      return Scaffold(
        body: SafeArea(
            child: Center(
          child: SizedBox(
            width: double.maxFinite,
            child: Stack(children: [
              GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: _initialPosition, zoom: 17),
                zoomControlsEnabled: false,
                onCameraMove: (CameraPosition cameraPosition) {
                  _cameraPosition = cameraPosition;
                },
                onCameraIdle: () {
                  Get.find<LocationController>()
                      .updatePosition(_cameraPosition, false);
                },
              ),
              Center(
                  child: !locationController.loading
                      ? Image.asset(
                          "assets/image/pick_marker-removebg-preview.png",
                          height: 50,
                          width: 50,
                        )
                      : CircularProgressIndicator(
                          color: Colors.red,
                        )),
              Positioned(
                top: Dimensions.height45,
                left: Dimensions.width20,
                right: Dimensions.width20,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius20 / 2),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 25,
                        color: Colors.red,
                      ),
                      Expanded(
                        child: Text(
                          '${locationController.pickPlaceMark.name ?? ''}',
                          style: TextStyle(
                              color: Colors.white, fontSize: Dimensions.font16),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 50,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  child: CustomButton(
                    onPressed: locationController.loading
                        ? null
                        : () {
                            if (locationController.pickPosition.latitude != 0 &&
                                locationController.pickPlaceMark.name != null) {
                              if (widget.fromAddress) {
                                if (widget.googleMapController != null) {
                                  //print("Se puede seleccionar el mapa");
                                  widget.googleMapController!.moveCamera(
                                      CameraUpdate.newCameraPosition(
                                          CameraPosition(
                                              target: LatLng(
                                                  locationController
                                                      .pickPosition.latitude,
                                                  locationController
                                                      .pickPosition
                                                      .longitude))));
                                  locationController.setAdderessData();
                                }
                                Get.toNamed(RouteHelper.getAddressPage());
                              }
                            }
                          },
                    buttonText: "Seleccionar Dirección",
                  ))
            ]),
          ),
        )),
      );
    });
  }
}
