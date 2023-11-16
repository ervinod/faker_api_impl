import 'dart:convert';

import 'package:faker_api_impl/features/home/data/models/user_response_model.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/api_client.dart';

abstract class GetUsersDataSource {
  Future<UserResponseModel> getUserList();
}

class GetUsersDataSourceImpl extends GetUsersDataSource {
  final ApiClient client;

  GetUsersDataSourceImpl({required this.client});

  @override
  Future<UserResponseModel> getUserList() async {
    final result = await client.get(Uri.parse(ApiConstants.URL_USERS));

    if (result.statusCode == 200) {
      if (jsonDecode(result.body) != null) {
        if (json.decode(result.body)["data"] != null) {
          return UserResponseModel.fromJson(json.decode(result.body));
        } else {
          throw GeneralException();
        }
      } else {
        throw ApiException(message: "Something Went Wrong");
      }
    } else {
      throw ServerException();
    }
  }
}
