import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:internet_checker/HelperClass/NetworkConnectivity.dart';
import 'package:internet_checker/utils/enumConstants.dart';
import 'package:rxdart/rxdart.dart';

class NetworkConnectivityImpl implements NetworkConnectivity {
  Connectivity? _connectivity;
  BehaviorSubject<NetworkStatus>? _networkStatusController;
  BehaviorSubject<ContainerStatus>? _displayMessageController;

  @override
  void disposeStream() {
    // TODO: implement disposeStream
    _networkStatusController!.close();
    _displayMessageController!.close();
  }

  /// initialize [Stream]
  @override
  void initializeStream() {
    _networkStatusController = BehaviorSubject<NetworkStatus>();
    _displayMessageController = BehaviorSubject<ContainerStatus>();
    _displayMessageController!.sink.add(ContainerStatus.dismiss);
    _connectivity = Connectivity();
  }

  /// listen to [Connectivity] changed
  @override
  Future<void> checkConnectivityResult() async {
    // TODO: implement initialise
    _connectivity!.checkConnectivity().then((result) {
      checkStatus(result);
    });
  }

  /// Sink Stream or throw [SocketException]
  @override
  void checkStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.none:
        networkConnectivity.updateStream(NetworkStatus.offline);
        networkConnectivity.updateDisplayMode(ContainerStatus.isOffline);

        break;
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        checkConnectedToInternet();
        if (_displayMessageController!.value != ContainerStatus.dismiss) {
          networkConnectivity.updateDisplayMode(ContainerStatus.isOnline);
        }
        break;
    }
  }

  void checkConnectedToInternet() {
    try {
      InternetAddress.lookup('google.com').then((result) {
        result.isNotEmpty && result[0].rawAddress.isNotEmpty ? networkConnectivity.updateStream(NetworkStatus.online) : throw SocketException;
      });
    } on SocketException catch (_) {
      networkConnectivity.updateStream(NetworkStatus.offline);
      networkConnectivity.updateDisplayMode(ContainerStatus.isOffline);
    }
  }

  /// return [Stream] for network Controller
  @override
  // TODO: implement myStream
  Stream<NetworkStatus> get myStream => _networkStatusController!.stream;

  /// update [Stream]
  @override
  void updateStream(NetworkStatus networkStatus) {
    // TODO: implement updateStream
    _networkStatusController!.sink.add(networkStatus);
  }

  /// update [stream] for showing or hiding [Container]
  @override
  void updateDisplayMode(ContainerStatus display) {
    // TODO: implement updateStream
    _displayMessageController!.sink.add(display);
  }

  @override
  // TODO: implement myDisplayStream
  Stream<ContainerStatus> get myDisplayStream => _displayMessageController!.stream;

  @override
  // TODO: implement getStatus
  ContainerStatus get getStatus => _displayMessageController!.value;
}

NetworkConnectivity networkConnectivity = NetworkConnectivityImpl()..initializeStream();
