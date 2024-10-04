import 'package:network_info_plus/network_info_plus.dart';

class NetworkInfoModel {
  final NetworkInfo _networkInfo = NetworkInfo();

  Future<String?> getIpAddress() async {
    return await _networkInfo.getWifiIP();
  }

  Future<String?> getMacAddress() async {
    return await _networkInfo.getWifiBSSID();
  }
}
