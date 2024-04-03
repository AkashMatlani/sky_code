import 'package:get_it/get_it.dart';
import 'package:sky_code/provider/dashboard_controller.dart';
import 'package:sky_code/provider/cute_cat_controller.dart';
import 'package:sky_code/services/internet_status_service.dart';

GetIt serviceLocator = GetIt.instance;

setupServiceLocator() {
  serviceLocator
      .registerFactory<InternetStatusService>(() => InternetStatusService());
  serviceLocator
      .registerFactory<DashBoardController>(() => DashBoardController());
  serviceLocator
      .registerFactory<CuteCatController>(() => CuteCatController());
}
