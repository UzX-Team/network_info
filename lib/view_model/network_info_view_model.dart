// lib/viewmodels/network_info_view_model.dart
import 'package:flutter/material.dart';
import 'package:get_macadress/model/network_info_model.dart';

class NetworkInfoViewModel extends ChangeNotifier {
  final NetworkInfoModel _networkInfoModel = NetworkInfoModel();
  String? _ipAddress;
  String? _macAddress;
  String? _errorMessage;
  bool _isLoading = false;

  String? get ipAddress => _ipAddress;
  String? get macAddress => _macAddress;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> fetchIpAddress() async {
    _setLoading(true);
    _errorMessage = null;
    try {
      _ipAddress = await _networkInfoModel.getIpAddress();
      if (_ipAddress == null || _ipAddress!.isEmpty) {
        _errorMessage = "IP manzil topilmadi.";
      }
    } catch (e) {
      _errorMessage = "Xatolik yuz berdi: $e";
    } finally {
      _setLoading(false);
      notifyListeners();
    }
  }

  Future<void> fetchMacAddress() async {
    _setLoading(true);
    _errorMessage = null;
    try {
      _macAddress = await _networkInfoModel.getMacAddress();
      if (_macAddress == null || _macAddress!.isEmpty) {
        _errorMessage = "MAC manzil topilmadi.";
      } else {
        _macAddress = _macAddress!.replaceAll(':', '-');
      }
    } catch (e) {
      _errorMessage = "Xatolik yuz berdi: $e";
    } finally {
      _setLoading(false);
      notifyListeners();
    }
  }

  // New method to update the IP address manually
  void updateIpAddress(String newIpAddress) {
    _ipAddress = newIpAddress;
    notifyListeners();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();

  }
}
