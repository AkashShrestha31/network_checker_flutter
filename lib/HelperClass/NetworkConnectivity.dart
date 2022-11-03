import 'package:connectivity/connectivity.dart';
import 'package:internet_checker/utils/enumConstants.dart';

abstract class NetworkConnectivity {
  void checkConnectivityResult();

  void checkStatus(ConnectivityResult result);

  void disposeStream();

  Stream<NetworkStatus> get myStream;

  Stream<ContainerStatus> get myDisplayStream;

  ContainerStatus get getStatus;

  void updateStream(NetworkStatus networkStatus);

  void initializeStream();

  void updateDisplayMode(ContainerStatus display);
}
