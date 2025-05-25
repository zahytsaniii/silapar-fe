import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.70;
  static double pageViewContainer = screenHeight / 3.94;
  static double pageViewTextContainer = screenHeight / 6.80;
  //dynamic height padding and margin
  static double height10 = screenHeight / 86.7;
  static double height15 = screenHeight / 57.8;
  static double height20 = screenHeight / 43.35;
  static double height30 = screenHeight / 28.9;
  static double height45 = screenHeight / 19.3;

  //dynamic width padding and margin
  static double width10 = screenHeight / 86.7;
  static double width15 = screenHeight / 57.8;
  static double width20 = screenHeight / 43.35;
  static double width30 = screenHeight / 28.9;

  //font size
  static double font16 = screenHeight / 54.19;
  static double font20 = screenHeight / 43.35;
  static double font26 = screenHeight / 33.34;

  //radius
  static double radius15 = screenHeight / 57.8;
  static double radius20 = screenHeight / 43.35;
  static double radius30 = screenHeight / 28.9;

  //icon size
  static double iconSize24 = screenHeight / 36.1;
  static double iconSize16 = screenHeight / 54.2;

  //list view size
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContSize = screenWidth / 3.9;

  //popular food
  static double popularFoodImgSize = screenHeight / 2.47;

  //botoom height
  static double bottomHeightBar = screenHeight / 7.2;

  //splash screen dimensions
  static double splashImg = screenHeight / 3.38;
}
