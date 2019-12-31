import 'dart:convert';

// import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:scoped_model/scoped_model.dart';

class CoursesFeedbackModel extends Model {
  Map<String, dynamic> responseData = {};
  Map<String, dynamic> responseDataBatch = {};
  Map<String, dynamic> responseDataBranch = {};
  Map<String, dynamic> responseDataYear = {};

  List<String> inputs = [];
  int presentIndex = 0;

  bool _isLoading = false;
  bool _displayBackButton = false;

  List<String> _rollNumbers = [];
  List<String> _regulations = [];
  List<String> _batches = [];
  List<String> _branches = [];

  Map<String, String> finalEnteries = {
    'Regulation': '',
    'Batch': '',
    'Branch': '',
    'RollNumber': '',
  };

  bool get isLoading {
    return _isLoading;
  }

  bool get displayBackButton {
    return _displayBackButton;
  }

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
    } else if (presentInput == 'Batch') {
      return allBatches;
    }
    return null;
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

      // print(responseData);

      responseData.forEach((String data, dynamic reg) {
        inputs.add(data);
        // print(inputs[presentIndex]);
        presentIndex += 1;
        final Map<String, dynamic> regData = reg;

        regData.forEach((String regulation, dynamic batches) {
          // here regulation variable holds the selected regulation
          _regulations.add(regulation);

          // print(regulation);
          // print(batches);
          responseDataBatch[regulation] = batches;
          // print(responseDataBatch['VR17']);
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

  void onBackButtonPressed() {
    presentIndex -= 1;
    inputs.removeLast();
    if (presentInput == 'Regulation') {
      _displayBackButton = false;
      _rollNumbers.clear();
      _batches.clear();
      _branches.clear();
      notifyListeners();
    } else if (presentInput == 'Batch') {
      _displayBackButton = true;
      _rollNumbers.clear();
      _branches.clear();
    } else if (presentInput == 'Branch') {
      _displayBackButton = true;
      _rollNumbers.clear();
    } else {
      _displayBackButton = true;
      notifyListeners();
    }
    print(inputs);
    print(_regulations);
    print(_batches);
  }

  void onNextButtonPressed() {
    // print(presentInput);
    // print(inputs);
    // print(_regulations);
    // print(_batches);
    if (presentInput == 'Regulation') {
      _displayBackButton = true;
      responseDataBatch[finalEnteries['Regulation']]
          .forEach((String batch, dynamic batchees) {
        // print(batch);
        // print(batchees);
        inputs.add(batch);
        presentIndex += 1;

        final Map<String, dynamic> batches = batchees;
        List<String> tempBatches = [];

        batches.forEach((String batch, dynamic branch) {
          // print(batch);
          tempBatches.add(batch);
          responseDataBranch[batch] = branch;
          // print(branch);
        });

        // print('Response data branch');
        print(responseDataBranch);

        _batches = tempBatches;
      });
    } else if (presentInput == 'Batch') {
      _displayBackButton = true;
      print(responseDataBranch);
      print(responseDataBranch[finalEnteries['Batch']]);
      responseDataBranch[finalEnteries['Batch']]
          .foreach((String key, dynamic value) {
        // inputs.add(key);
        // presentIndex += 1;

        print(key);
        print(value);

        // final Map<String, dynamic> branches = value;
        // List<String> tempBranches = [];

        // print(branches);

        // branches.forEach((String branch, dynamic branchData) {
        //   print(branch);
        //   print(branchData);
        //   tempBranches.add(branch);
        //   responseDataYear[branch] = branchData;
        // });

        // print(responseDataYear);

        // _branches = tempBranches;
      });
    }
    print(inputs);
    print(_regulations);
    print(_batches);
  }

  void fillFinalEnteries(String value) {
    finalEnteries[presentInput] = value;
    print(finalEnteries);
  }
}
