import 'package:flutter/material.dart';

import '../errors/failures.dart';

class Utils {
  static String mapFailureToMessage(Failure failure) {
    try {
      switch (failure.runtimeType) {
        case InternetFailure:
          return "Please check your connectivity and try again";
        case ServerFailure:
          return "Server failure";
        case CacheFailure:
          return "Something went wrong";
        case ApiFailure:
          return (failure as ApiFailure).message;
        default:
          return 'Unexpected Error';
      }
    } catch (e) {
      return 'Unexpected Error';
    }
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
