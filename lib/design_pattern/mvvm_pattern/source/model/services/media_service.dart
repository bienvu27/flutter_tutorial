import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/design_pattern/mvvm_pattern/source/model/api/app_exception.dart';
import 'package:flutter_tutorial/design_pattern/mvvm_pattern/source/model/services/base_service.dart';
import 'package:http/http.dart' as http;

class MediaService extends BaseService {
  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse("$mediaBaseUrl$url"));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
          "Error occured while communication with server \nwith status code : ${response.statusCode}",
        );
    }
  }
}
