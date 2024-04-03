import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sky_code/services/internet_status_service.dart';
import 'package:sky_code/services/networking/http_service.dart';
import 'package:sky_code/utills/constants.dart';
import '../model/cute_cat_model.dart';
import '../utills/commons.dart';

class CuteCatController with ChangeNotifier {
  List<dynamic>? datAccepted;
  bool isLoading = false;
  List<CuteCatModel> catImages = [];
  bool isLoadingNextPage = false;

  Future apiCalling([BuildContext? context, String? parameter]) async {
    try {
      if (!InternetStatusService.isOnline) {
        Commons.flushBarError(context!, noInternet);
      } else {
        isLoading = true;
        notifyListeners();
        HttpService serv = HttpService();
        datAccepted = await serv.apiCall(parameter!, cuteCatList);
        catImages.addAll(convertToCatImages(datAccepted));
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

  List<CuteCatModel> convertToCatImages(List<dynamic>? data) {
    if (data == null) return [];
    List<CuteCatModel> catImages = [];
    for (dynamic item in data[1]) {
      catImages.add(CuteCatModel.fromJson(item));
    }
    return catImages;
  }
}
