import 'package:flutter/cupertino.dart';
import 'package:flutter_tutorial/design_pattern/mvvm_pattern/source/model/model.dart';

import 'services/base_service.dart';
import 'services/media_service.dart';

class MediaRepository {
  final BaseService _mediaService = MediaService();

  Future<List<Model>> fetchMediaList(String value) async {
    final response = await _mediaService.getResponse(value);
    final jsonData = response['data'] as List;
    List<Model> lists =
        jsonData.map((json) => Model.fromJson(json)).toList();
    debugPrint("----response--$lists---");
    return lists;
  }
}
