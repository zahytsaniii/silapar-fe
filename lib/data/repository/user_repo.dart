import 'package:get/get.dart';
import 'package:silapar/data/api/api_client.dart';
import 'package:silapar/utils/app_constants.dart';

class UserRepo {
  final ApiClient apiClient;
  UserRepo({required this.apiClient});

  Future<Response> getUserInfo() async {
    return await apiClient.getData(AppConstants.USER_INFO_URI);
  }
}
