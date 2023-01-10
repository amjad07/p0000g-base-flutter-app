import 'package:flutter_base_project/remote/model/response_main.dart';
import 'package:flutter_base_project/remote/model/sign_in_body.dart';

import '../remote/model/sign_up_body.dart';

abstract class DataManagerImp {
  Future<ResponseMain> signIn(SignInBody signInBody);
  Future<ResponseMain> signUp(SignUpBody signInBody);
}
