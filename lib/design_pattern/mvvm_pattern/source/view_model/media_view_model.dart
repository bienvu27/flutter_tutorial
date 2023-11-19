import 'package:flutter/material.dart';
import 'package:flutter_tutorial/design_pattern/mvvm_pattern/source/model/api/api_response.dart';
import 'package:flutter_tutorial/design_pattern/mvvm_pattern/source/model/media_model.dart';
import 'package:flutter_tutorial/design_pattern/mvvm_pattern/source/model/media_repository.dart';

class MediaViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  MediaModel? _media;

  ApiResponse get response {
    return _apiResponse;
  }

  MediaModel? get media => _media;

  /// Call the media service and gets the data of requested media data of
  /// an artist.
  Future<void> fetchMediaData(String value) async {
    _apiResponse = ApiResponse.loading('Fetching artist data');
    notifyListeners();
    try {
      List<MediaModel> mediaList =
          await MediaRepository().fetchMediaList(value);
      _apiResponse = ApiResponse.completed(mediaList);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      debugPrint("------$e-------");
    }
    notifyListeners();
  }

  void setSelectedMedia(MediaModel? media) {
    _media = media;
    notifyListeners();
  }
}
