import 'package:flutter/material.dart';

class LoadinProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
