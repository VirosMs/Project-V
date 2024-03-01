import 'package:connectivity_plus/connectivity_plus.dart';

/// Abstraction for checking internet connectivity.
abstract class NetworkInfoI {
  /// Checks if the device is connected to the internet.
  ///
  /// Returns `true` if the device is connected to the internet,
  /// otherwise returns `false`.
  Future<bool> isConnected();

  /// Retrieves the current connectivity status of the device.
  Future<ConnectivityResult> get connectivityResult;

  /// Stream that emits the connectivity status whenever it changes.
  Stream<ConnectivityResult> get onConnectivityChanged;
}

/// Implementation of [NetworkInfoI] using the [Connectivity] package.
class NetworkInfo implements NetworkInfoI {
  Connectivity connectivity;

  static final NetworkInfo _networkInfo = NetworkInfo._internal(Connectivity());

  factory NetworkInfo() {
    return _networkInfo;
  }

  NetworkInfo._internal(this.connectivity) {
    connectivity = this.connectivity;
  }

  /// Checks if the device is connected to the internet.
  ///
  /// Returns `true` if the device is connected to the internet,
  /// otherwise returns `false`.
  @override
  Future<bool> isConnected() async {
    final result = await connectivity.checkConnectivity();
    if (result != ConnectivityResult.none) {
      return true;
    }
    return false;
  }

  /// Retrieves the current connectivity status of the device.
  @override
  Future<ConnectivityResult> get connectivityResult async {
    return connectivity.checkConnectivity();
  }

  /// Stream that emits the connectivity status whenever it changes.
  @override
  Stream<ConnectivityResult> get onConnectivityChanged =>
      connectivity.onConnectivityChanged;
}
