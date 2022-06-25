import 'package:coronavirus_rest_api_flutter_course/app/service/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../service/api.dart';

class DataRepository {
  DataRepository({
    @required this.apiService,
  });

  final APIService apiService;

  String _accessToken;

  Future<int> getEndpointData(Endpoint endpoint) async {
    try {
      _accessToken ??= await apiService.getAccessToken();
      return await apiService.getEndpointData(
          accessToken: _accessToken, endpoint: endpoint);
    } on Response catch (response) {
      if (response.statusCode == 401) {
        //if unauthorized, get access token again
        final _accessToken = await apiService.getAccessToken();
        return await apiService.getEndpointData(
            accessToken: _accessToken, endpoint: endpoint);
      }
      rethrow;
    }
  }
}
