import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:silapar/controllers/auth_controller.dart';
import 'package:silapar/controllers/cart_controller.dart';
import 'package:silapar/controllers/location_controller.dart';
import 'package:silapar/controllers/popular_product_controller.dart';
import 'package:silapar/controllers/recommended_product_controller.dart';
import 'package:silapar/controllers/user_controller.dart';
import 'package:silapar/data/api/api_client.dart';
import 'package:silapar/data/repository/auth_repo.dart';
import 'package:silapar/data/repository/cart_repo.dart';
import 'package:silapar/data/repository/location_repo.dart';
import 'package:silapar/data/repository/popular_product_repo.dart';
import 'package:silapar/data/repository/recommended_product_repo.dart';
import 'package:silapar/data/repository/user_repo.dart';
import 'package:silapar/utils/app_constants.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  //api client
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  // Get.lazyPut(
      // () => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  //controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  // Get.lazyPut(() => LocationController(locationRepo: Get.find()));
}
