import 'package:flutter/material.dart';
import 'package:flutter_app/Components/custom_text_form_field.dart';
import 'package:flutter_app/Features/GeoLocation/geo_location_controller.dart';
import 'package:flutter_app/Features/GeoLocation/geo_location_model.dart';
import 'package:flutter_app/Features/GeoLocation/geo_location_response_model.dart';
import 'package:flutter_app/Features/Login/login_controller.dart';
import 'package:flutter_app/Shared/base_colors.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import 'package:location/location.dart' as local;
import '../../Shared/base_svg_icons.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeWidget> {
  TextEditingController locationController = TextEditingController();
  GeoLocationController geoLocationController = GeoLocationController();
  @override
  Widget build(BuildContext context) {
    verifyUserIsLogged();
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(12.0), child: RouterOutlet()
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Flexible(
          //       child: SizedBox(
          //         child: Text(
          //           'Encontre o Seu Barbeiro Favorito',
          //           style: TextStyle(
          //               color: BaseColors.whiteColor,
          //               fontSize: 24,
          //               fontWeight: FontWeight.bold),
          //         ),
          //         width: 225,
          //       ),
          //     ),
          //     CustomTextFormField(
          //       controller: locationController,
          //       placeholder: 'Localização',
          //       height: 60,
          //       width: window.physicalSize.width / 1.3,
          //       sufixIconPath: SvgIcons.localization,
          //       svgIconColor: BaseColors.backGroundColor,
          //       backGroundColor: BaseColors.textFieldBackgroundColor,
          //       borderRadius: 30.0,
          //       passwordTextType: false,
          //       marginTop: 12.0,
          //       sufixFunction: () => getLocation(),
          //     )
          //   ],
          // ),
          ),
    );
  }

  void getLocation() async {
    local.Location location = local.Location();
    bool _serviceEnabled;
    local.PermissionStatus _permissionGranted;
    local.LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == local.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != local.PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    locationController.text =
        '${_locationData.latitude.toString()}${_locationData.longitude.toString()}';

    if (_locationData.latitude != null && _locationData.longitude != null) {
      GeoLocationModel model =
          GeoLocationModel(_locationData.latitude!, _locationData.longitude!);
      geoLocationController.getGeoLocation(model).then((value) {
        GeoLocationResponseModel response = value;
      });
    }
  }

  void verifyUserIsLogged() {
    Provider.of<LoginController>(context, listen: false)
        .hasUserLogged()
        .then((value) {
      if (!value) {
        Modular.to.navigate('/login/');
      }
    });
  }
}
