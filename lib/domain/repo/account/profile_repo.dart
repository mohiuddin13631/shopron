import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shopron/config/utils/method.dart';
import 'package:shopron/config/utils/my_strings.dart';
import 'package:shopron/config/utils/url_container.dart';
import 'package:shopron/domain/model/authorization/authorization_response_model.dart';
import 'package:shopron/domain/model/global/response_model/response_model.dart';
import 'package:shopron/domain/model/profile/profile_response_model.dart';
import 'package:shopron/domain/model/user_post_model/user_post_model.dart';
import 'package:shopron/domain/services/api_service.dart';
import 'package:shopron/presentation/components/snack_bar/show_custom_snackbar.dart';

class ProfileRepo {
  ApiClient apiClient;

  ProfileRepo({required this.apiClient});

  Future<bool> updateProfile(UserPostModel m,bool isProfile) async {

    try{
      apiClient.initToken();

      String url = '${UrlContainer.baseUrl}${isProfile?UrlContainer.updateProfileEndPoint:UrlContainer.profileCompleteEndPoint}';


      var request=http.MultipartRequest('POST',Uri.parse(url));
       Map<String,String>finalMap={
        'firstname': m.firstname,
        'lastname': m.lastName,
        'address': m.address??'',
        'zip': m.zip??'',
        'state': m.state??"",
        'city': m.city??'',
      };

      request.headers.addAll(<String,String>{'Authorization' : 'Bearer ${apiClient.token}'});
      if(m.image!=null){
        request.files.add( http.MultipartFile('image', m.image!.readAsBytes().asStream(), m.image!.lengthSync(), filename: m.image!.path.split('/').last));
      }
      request.fields.addAll(finalMap);

      http.StreamedResponse response = await request.send();

      String jsonResponse=await response.stream.bytesToString();
      AuthorizationResponseModel model = AuthorizationResponseModel.fromJson(jsonDecode(jsonResponse));

      if(model.status?.toLowerCase()==MyStrings.success.toLowerCase()){
        CustomSnackBar.success(successList: model.message?.success??[MyStrings.success]);
        return true;
      }else{
        CustomSnackBar.error(errorList: model.message?.error??[MyStrings.requestFail.tr]);
        return false;
      }

    }catch(e){
      return false;
    }

  }

  Future<ResponseModel> loadProfileInfo() async {

    String url = '${UrlContainer.baseUrl}${UrlContainer.getProfileEndPoint}';
    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;

  }
}
