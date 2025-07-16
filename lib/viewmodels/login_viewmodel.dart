import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  String? _token;
  String? get token => _token;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();

    _token = await _authService.login(username, password);

    _isLoading = false;
    notifyListeners();
  }
}
