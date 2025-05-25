// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:silapar/controllers/auth_controller.dart';
// import 'package:silapar/controllers/location_controller.dart';
// import 'package:silapar/controllers/user_controller.dart';
// import 'package:silapar/utils/colors.dart';

// class AddAddressPage extends StatefulWidget {
//   const AddAddressPage({Key? key}) : super(key: key);

//   @override
//   State<AddAddressPage> createState() => _AddAddressPageState();
// }

// class _AddAddressPageState extends State<AddAddressPage> {
//   TextEditingController _addressController = TextEditingController();
//   final TextEditingController _contactPersonName = TextEditingController();
//   final TextEditingController _contactPersonNumber = TextEditingController();
//   late bool _isLogged;
//   CameraPosition _cameraPosition =
//       const CameraPosition(target: LatLng(45.51563, -122.677433), zoom: 17);
//   late LatLng _initialPosition = LatLng(45.51563, -122.677433);

//   @override
//   void initState() {
//     //TODO: implement initState
//     super.initState();
//     _isLogged = Get.find<AuthController>().userLoggedIn();
//     if (_isLogged && Get.find<UserController>().userModel == null) {
//       Get.find<UserController>().getUserInfo();
//     }
//     if (Get.find<LocationController>().addressList.isNotEmpty) {
//       _cameraPosition = CameraPosition(
//           target: LatLng(
//               double.parse(
//                   Get.find<LocationController>().getAddress["latitude"]),
//               double.parse(
//                   Get.find<LocationController>().getAddress["langitude"])));
//       _initialPosition = LatLng(
//           double.parse(Get.find<LocationController>().getAddress["latitude"]),
//           double.parse(Get.find<LocationController>().getAddress["langitude"]));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Address Page"),
//         backgroundColor: AppColors.mainColor,
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 140,
//             width: MediaQuery.of(context).size.width,
//             margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 border: Border.all(
//                   width: 2,
//                   color: Theme.of(context).primaryColor,
//                 )),
//             child: Stack(
//               children: [
//                 GoogleMap(
//                     initialCameraPosition:
//                         CameraPosition(target: _initialPosition, zoom: 17)),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
