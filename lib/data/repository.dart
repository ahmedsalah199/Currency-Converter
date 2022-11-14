import 'package:flutter/foundation.dart';

import 'dio_helper.dart';

class Repository {
  DioHelper dioHelper;
  Repository({required this.dioHelper});

  Future getConvertCurrency({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    try {
      var response = await dioHelper.get(path: path, query: query);
      return response["rates"];
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }
}
