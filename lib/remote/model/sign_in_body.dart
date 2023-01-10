import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable(explicitToJson: true)
@entity
class SignInBody {
  String? id;

  SignInBody({this.id});

  SignInBody.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}


