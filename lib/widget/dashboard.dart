import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sky_code/provider/dashboard_controller.dart';
import 'package:sky_code/services/locator/services_locator.dart';
import 'package:sky_code/utills/commons.dart';
import 'package:sky_code/utills/constants.dart';
import 'package:sky_code/widget/dashborad_detail.dart';
import 'package:sky_code/widget/network_aware_widget.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  DashBoardController? dashBoardController =
      serviceLocator<DashBoardController>();

  @override
  void initState() {
    super.initState();
    dashBoardController!.apiDashBoard(context, 'v1/random/20');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: Scaffold(
          body: NetworkAwareWidget(
              onlineChild: getOnlineUI(), offlineChild: offLineWidget())),
    );
  }

  Widget getOnlineUI() {
    return ChangeNotifierProvider<DashBoardController?>(
            create: (context) => dashBoardController,
            child:
                Consumer<DashBoardController>(builder: (context, model, child) {
              return  Scaffold(
                  body:!dashBoardController!.isLoading?
                  ListView.builder(
                  itemCount: dashBoardController!.dashBoardModel!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        if (dashBoardController!
                                    .dashBoardModel![index].character !=
                                null &&
                            dashBoardController!
                                    .dashBoardModel![index].character!.house !=
                                null) {
                          Navigator.of(context, rootNavigator: true).push(
                              CupertinoPageRoute<bool>(
                                  fullscreenDialog: true,
                                  builder: (BuildContext context) =>
                                      DashBoardDetail(
                                        character: dashBoardController!
                                            .dashBoardModel![index].character!,
                                        house: dashBoardController!
                                            .dashBoardModel![index]
                                            .character!
                                            .house,
                                      )));
                        }
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(
                            "Sentence : ${dashBoardController!.dashBoardModel![index].sentence!}",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                    );
                  })  : Center(
              child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.circular(10.0)),
                  width: 300.0,
                  height: 200.0,
                  alignment: AlignmentDirectional.center,
                  child: Commons.loading(
                  "Getting Dashboard Data", false),
                  ),
                  ));
            }));
  }

  offLineWidget() {
    return errorNoInternet();
  }

  Widget errorNoInternet() {
    return Container(
      margin: const EdgeInsets.only(top: 25.00),
      padding: const EdgeInsets.all(10.00),
      color: Colors.orange,
      child: Row(children: [
        Container(
          margin: const EdgeInsets.only(right: 6.00),
          child: const Icon(Icons.wifi_off, color: Colors.white),
        ),
        const Text(checkConnection,
            style: TextStyle(color: Colors.white)),
      ]),
    );
  }
}
