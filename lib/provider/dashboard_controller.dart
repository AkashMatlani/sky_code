import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sky_code/model/dashboard_model.dart';
import 'package:sky_code/services/internet_status_service.dart';
import 'package:sky_code/services/networking/http_service.dart';
import 'package:sky_code/utills/commons.dart';
import 'package:sky_code/utills/constants.dart';

class DashBoardController with ChangeNotifier {
  bool isLoading = false;
  List<DashBoardModel>? dashBoardModel;
  List<dynamic>? datAccepted;

  void apiDashBoard([BuildContext? context, String? parameter]) async {
    try {
      if (!InternetStatusService.isOnline) {
        Commons.flushBarError(context!, noInternet);
      } else {
        isLoading = true;
        notifyListeners();
        HttpService serv = HttpService();
        datAccepted = await serv.apiCall(parameter!, dashboardUrl);
        dashBoardModel = convertToDashBoard(datAccepted);
        isLoading = false;
        notifyListeners();
      }
    } catch (error, stackTrace) {
      isLoading = false;
      notifyListeners();
      Commons.flushBarError(context!, error.toString());
      await Sentry.captureException(error, stackTrace: stackTrace);
    }
  }

  List<DashBoardModel> convertToDashBoard(List<dynamic>? data) {
    if (data == null) return [];
    List<DashBoardModel> dashBoardData = [];
    for (dynamic item in data[1]) {
      dashBoardData.add(DashBoardModel.fromJson(item));
    }
    return dashBoardData;
  }
}
