// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:http_mock_adapter/http_mock_adapter.dart';
//
// import 'mock_models.dart';
// import 'network_config.dart';
//
// class MockAPIHelper {
//   Future<dynamic> post(String url, {@required body}) async {
//     final dio = Dio();
//     final adapter = DioAdapter(dio: dio);
//     adapter.onPost(NetworkConfig.getNetworkUrl() + url, (request) {
//       final response = _getResponse(url);
//       return request.reply(
//         200,
//         json.decode(response),
//       );
//     }, data: body);
//
//     dio.options.headers['content-Type'] = 'application/json';
//     dio.interceptors.add(
//       LogInterceptor(
//         request: true,
//         error: true,
//         requestBody: true,
//         requestHeader: false,
//         responseBody: true,
//         responseHeader: false,
//       ),
//     );
//
//     final response = await dio.post(NetworkConfig.getNetworkUrl() + url,
//         data: body, options: Options());
//     await Future.delayed(const Duration(seconds: 1));
//     return response;
//   }
//
//   _getResponse(String url) {
//     if (url == 'location/data') {
//       return MockModels.locationDataResponse;
//     }else if (url == 'city/all') {
//       return MockModels.cityAllResponse;
//     }else if (url == 'location/all') {
//       return MockModels.locationAllResponse;
//     }else if (url == 'location/search') {
//       return MockModels.locationAllResponse;
//     }else if (url == 'location/random') {
//       return MockModels.locationAllResponse;
//     }else if (url == 'location/seasonal/all') {
//       return MockModels.locationAllResponse;
//     }else if (url == 'city/near') {
//       return MockModels.nearestCityResponse;
//     }else if (url == 'province/all') {
//       return MockModels.provinceAllResponse;
//     }else if (url == 'dashboard/data') {
//       return MockModels.dashboardAPIResponse;
//     }
//   }
// }
