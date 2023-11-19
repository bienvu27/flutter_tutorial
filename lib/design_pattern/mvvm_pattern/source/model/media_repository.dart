import 'package:flutter_tutorial/design_pattern/mvvm_pattern/source/model/media_model.dart';

import 'services/base_service.dart';
import 'services/media_service.dart';

class MediaRepository {
  final BaseService _mediaService = MediaService();

  Future<List<MediaModel>> fetchMediaList(String value) async {
    dynamic response = await _mediaService.getResponse(value);
    final jsonData = response['results'] as List;
    List<MediaModel> mediaList =
        jsonData.map((tagJson) => MediaModel.fromJson(tagJson)).toList();
    return mediaList;
  }
}
