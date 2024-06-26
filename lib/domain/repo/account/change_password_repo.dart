import 'dart:convert';

import 'package:get/get.dart';
import 'package:shopron/config/utils/method.dart';
import 'package:shopron/config/utils/my_strings.dart';
import 'package:shopron/config/utils/url_container.dart';
import 'package:shopron/domain/model/authorization/authorization_response_model.dart';
import 'package:shopron/domain/model/global/response_model/response_model.dart';
import 'package:shopron/domain/services/api_service.dart';
import 'package:shopron/presentation/components/snack_bar/show_custom_snackbar.dart';

class ChangePasswordRepo{

 ApiClient apiClient;

 ChangePasswordRepo({required this.apiClient});
 String token = '', tokenType = '';

 Future<ResponseModel> changePassword(String currentPass, String password) async{

  final params = modelToMap(currentPass,password);
  String url = '${UrlContainer.baseUrl}${UrlContainer.changePasswordEndPoint}';

  ResponseModel responseModel= await apiClient.request(url, Method.postMethod, params,passHeader: true);
  return responseModel;
 }

 modelToMap(String currentPassword,String newPass) {

  Map<String,dynamic>map2={
   'current_password':currentPassword,
   'password':newPass,
   'password_confirmation':newPass
  };
  return map2;
 }

}