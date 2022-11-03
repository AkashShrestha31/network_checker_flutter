import 'package:flutter/material.dart';
import 'package:internet_checker/HelperClass/NetworkConnectivityImpl.dart';
import 'package:internet_checker/utils/enumConstants.dart';
import 'package:internet_checker/utils/widgets/text_and_icon_widget.dart';

StreamBuilder<ContainerStatus> getStreamDisplayStatus(NetworkStatus? data) {
  return StreamBuilder<ContainerStatus>(
      stream: networkConnectivity.myDisplayStream,
      builder: (context, displaySnapshot) {
        if (displaySnapshot.hasData) {
          switch (displaySnapshot.data) {
            case ContainerStatus.isOnline:
              if (data == NetworkStatus.online) {
                Future.delayed(const Duration(seconds: 3)).then((v) {
                  networkConnectivity.updateDisplayMode(ContainerStatus.dismiss);
                });
              }
              return const TextIconWidget(
                message: "You're back Online !!!",
                icon: Icons.wifi,
                color: Colors.green,
              );
            case ContainerStatus.isOffline:
              return const TextIconWidget(
                message: "Sorry you're Offline !!!",
                icon: Icons.wifi_off,
                color: Colors.red,
              );
            default:
              return Container();
          }
        }
        return Container();
      });
}
