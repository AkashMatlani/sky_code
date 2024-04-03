import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sky_code/provider/cute_cat_controller.dart';
import 'package:sky_code/services/locator/services_locator.dart';
import 'package:sky_code/utills/commons.dart';
import 'package:sky_code/utills/constants.dart';
import 'package:sky_code/widget/network_aware_widget.dart';

class CuteCat extends StatefulWidget {
  const CuteCat({super.key});

  @override
  State<CuteCat> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CuteCat> {
  ScrollController? _scrollController;
  CuteCatController? cuteCatController =
      serviceLocator<CuteCatController>();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    cuteCatController!.apiCalling(context, catParams);
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
    return ChangeNotifierProvider<CuteCatController?>(
        create: (context) => cuteCatController,
        child: Consumer<CuteCatController>(builder: (context, model, child) {
          return Scaffold(
              body: !cuteCatController!.isLoading
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          controller: _scrollController,
                          itemCount: cuteCatController!.catImages.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: ListTile(
                                title: Text(
                                  "ID : ${cuteCatController!.catImages[index].sId!}",
                                  style:
                                      const TextStyle(color: Colors.black),
                                ),
                              ),
                            );
                          }),
                    )
                  : Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[400],
                            borderRadius: BorderRadius.circular(10.0)),
                        width: 300.0,
                        height: 200.0,
                        alignment: AlignmentDirectional.center,
                        child:
                            Commons.loading("Getting Cute Dog Data", false),
                      ),
                    ));
        }));
  }

  _scrollListener() async {
    if (_scrollController!.position.pixels >=
            _scrollController!.position.maxScrollExtent - 9 &&
        !_scrollController!.position.outOfRange &&
        !cuteCatController!.isLoadingNextPage) {
      cuteCatController!.isLoadingNextPage = true;
      await cuteCatController!.apiCalling(context, catParams);
      cuteCatController!.isLoadingNextPage = false;
    }
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
