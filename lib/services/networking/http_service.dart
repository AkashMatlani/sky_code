import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:sky_code/services/networking/connection_helper.dart';
import 'package:sky_code/utills/constants.dart';

class HttpService {
  apiCall(String parameter, String baseApi) async {
    ConnectionHelper api = ConnectionHelper(url: baseApi);
    try {
      Map responseBody =
          await api.getHTTP(parameter).timeout(const Duration(seconds: 35));
      if (responseBody['body'] == "timeout") {
        return [
          'false',
          timeout,
        ];
      } else if (responseBody['body'] == "error") {
        return ['false', responseBody['errorMessage']];
      } else {
        if (responseBody['code'] == 200) {
          return [
            'true',
            responseBody['body'],
          ];
        } else {
          return [
            'false',
            "failed",
          ];
        }
      }
    } on TimeoutException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [
        'false',
        timeout,
      ];
    } catch (e) {
      return [
        'false',
        generalError,
      ];
    }
  }
}
