import 'package:dio/dio.dart';
import 'package:flutter_base_project/remote/model/response_main.dart';
import 'package:flutter_base_project/remote/model/sign_in_body.dart';
import 'package:flutter_base_project/remote/model/sign_up_body.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://development.qthemusic.app/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
  @POST("v1/user/login")
  Future<ResponseMain> signIn(@Body() SignInBody signInBody);
  @POST("v1/user/signup")
  Future<ResponseMain> signUp(@Body() SignUpBody signUpBody);
}
