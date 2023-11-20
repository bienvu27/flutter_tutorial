import 'package:flutter/material.dart';
import 'package:flutter_tutorial/design_pattern/mvvm_pattern/source/model/api/api_response.dart';
import 'package:flutter_tutorial/design_pattern/mvvm_pattern/source/model/model.dart';
import 'package:flutter_tutorial/design_pattern/mvvm_pattern/source/model/model_repository.dart';
import 'package:flutter_tutorial/design_pattern/mvvm_pattern/source/model/services/base_service.dart';

class ViewModel with ChangeNotifier {
  ViewModel() {
    fetchMediaData(BaseService.endPoint);
  }

  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  Model? _media;
  List<Model>? _listModel;

  List<Model>? get listModel => _listModel;

  ApiResponse get response {
    return _apiResponse;
  }

  Model? get media => _media;

  /// Call the media service and gets the data of requested media data of
  /// an artist.
  Future<void> fetchMediaData(String value) async {
    _apiResponse = ApiResponse.loading('Fetching artist data');
    notifyListeners();
    try {
      _listModel = await MediaRepository().fetchMediaList(value);
      _apiResponse = ApiResponse.completed(listModel);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      debugPrint("------$e-------");
    }
    notifyListeners();
  }

  void setSelectedMedia(Model? media) {
    _media = media;
    notifyListeners();
  }
}
