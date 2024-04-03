import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_code/services/internet_status_service.dart';

import '../services/locator/services_locator.dart';

class NetworkAwareWidget extends StatelessWidget {
  final Widget? onlineChild;
  final Widget? offlineChild;

  const NetworkAwareWidget({Key? key, this.onlineChild, this.offlineChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<InternetStatusService?>(
        create: (context) => serviceLocator<InternetStatusService>(),
        child: Consumer<InternetStatusService>(
            builder: (context, model, child) => model.isOnlineCheck
                ? onlineChild!
                : Stack(
              children: [
                onlineChild!,
                offlineChild!,
              ],
            )));
  }
}