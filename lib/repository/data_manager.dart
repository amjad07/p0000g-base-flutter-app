import 'package:dio/dio.dart';
import 'package:flutter_base_project/helper/flavors/flavor_config.dart';
import 'package:flutter_base_project/remote/model/response_main.dart';
import 'package:flutter_base_project/remote/model/sign_in_body.dart';
import 'package:flutter_base_project/remote/model/sign_up_body.dart';
import 'package:flutter_base_project/remote/network/api_client.dart';
import 'package:flutter_base_project/repository/data_manager_imp.dart';

class DataManager implements DataManagerImp {
  late final ApiClient _apiClient;

  DataManager() {
    _apiClient = ApiClient(
        Dio((BaseOptions(contentType: "application/json", headers: {
          "Accept": "application/json",
          "api-key": FlavorConfig.instance?.values.apiKey
        }))),
        baseUrl: FlavorConfig.instance?.values.apiBaseUrl ?? "");
  }

  @override
  Future<ResponseMain> signIn(SignInBody signInBody) {
    return _apiClient
        .signIn(signInBody)
        .then((successResponse) => successResponse)
        .catchError((e) {
      switch (e.runtimeType) {
        case DioError:
          final errorResponse = (e as DioError).response;
          if (errorResponse?.data != null) {
          /*  var jsonResponse = ResponseMain.fromJson(errorResponse?.data);
            return ResponseMain(
                response: ResponseModel(
                    message: jsonResponse.response.message,
                    status: jsonResponse.response.status,
                    errorCode: errorResponse?.statusCode));*/

            return ResponseMain();
          } else {
            /*return ResponseMain(
                response: ResponseModel(
                    message: StringsResource.strSthWrong,
                    status: false,
                    errorCode: errorResponse?.statusCode));*/
            return ResponseMain();
          }
      }
    });
  }

  @override
  Future<ResponseMain> signUp(SignUpBody signUpBody) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

}
