import 'package:flutter/material.dart';
import 'package:internet_checker/utils/enumConstants.dart';

import 'HelperClass/NetworkConnectivityImpl.dart';
import 'HelperClass/stream_display_status.dart';

class NetworkCheckerPage extends StatelessWidget {
  const NetworkCheckerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<NetworkStatus>(
        stream: networkConnectivity.myStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return getStreamDisplayStatus(snapshot.data);
          }
          return Container();
        });
  }
}
