import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

class ApiService {
  Future<int> getDeOrIncrementFromServer() async {
    await Future.delayed(Duration(seconds: 1));
    return Random().nextInt(4) + 1; // add random int number between 1 and 5
  }
}
