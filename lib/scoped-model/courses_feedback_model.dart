import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:scoped_model/scoped_model.dart';

class CoursesFeedbackModel extends Model {
  bool _isLoading = false;

  List<String> _rollNumbers = [];
  List<String> _regulations = [];
  List<String> _batches = [];
  List<String> _branches = [];

  List<String> get allRollNumbers {
    return List.from(_rollNumbers);
  }

  List<String> get allBatches {
    return List.from(_batches);
  }

  List<String> get allRegulations {
    return List.from(_regulations);
  }

  List<String> get allBranches {
    return List.from(_branches);
  }

  Future<bool> fetchIndexing() {
    _isLoading = true;
    notifyListeners();
    return http
        .get('https://college-feedback-5c329.firebaseio.com/Indexing.json')
        .then<bool>((http.Response response) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData);
      _isLoading = false;
      notifyListeners();
      return true;
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return false;
    });
  }
}
