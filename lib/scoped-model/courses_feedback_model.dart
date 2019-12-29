import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:scoped_model/scoped_model.dart';

class CoursesFeedbackModel extends Model {
  Map<String, dynamic> responseData;
  List<String> inputs = [];
  int presentIndex = 0;

  bool _isLoading = false;
  bool _displayBackButton = false;

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

  List<String> get getContentList {
    if (presentInput == 'Regulation') {
      return allRegulations;
    }
  }

  String get presentInput {
    return inputs[presentIndex - 1];
  }

  Future<bool> fetchIndexing() {
    _isLoading = true;
    notifyListeners();
    return http
        .get('https://college-feedback-5c329.firebaseio.com/Indexing.json')
        .then<bool>((http.Response response) {
      responseData = json.decode(response.body);

      responseData.forEach((String data, dynamic reg) {
        inputs.add(data);
        print(inputs[presentIndex]);
        presentIndex += 1;
        final Map<String, dynamic> regData = reg;

        regData.forEach((String regulation, dynamic batches) {
          // here regulation variable holds the selected regulation
          _regulations.add(regulation);

          print(regulation);
          print(batches);
        });
      });

      _isLoading = false;
      notifyListeners();
      return true;
    }).catchError((error) {
      print('There is an error');
      _isLoading = false;
      notifyListeners();
      return false;
    });
  }

  void onBackButtonPressed(BuildContext context) {
    if (presentIndex == 0 || inputs[presentIndex - 1] == 'Regulation') {
      _displayBackButton = false;
      notifyListeners();
    } else {
      _displayBackButton = true;
      presentIndex -= 1;
      notifyListeners();
      Navigator.pop(context);
    }
  }

  void onNextButtonPressed() {
    if (inputs[presentIndex - 1] == 'Regulation') {

    }
  }

}
