import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:scoped_model/scoped_model.dart';

class CoursesFeedbackModel extends Model {
  Map<String, dynamic> responseData = {};
  Map<String, dynamic> responseDataBatch = {};
  Map<String, dynamic> responseDataBranch = {};
  Map<String, dynamic> responseDataYear = {};

  List<String> inputs = [];
  int presentIndex = 0;
  String _selectedValue = 'string';
  String _selectedRollNumber = '';

  bool _isLoading = false;
  bool _displayBackButton = false;
  bool _disableButton = false;

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

  Map<String, String> get finalEnteryDetails {
    return finalEnteries;
  }

  bool get isLoading {
    return _isLoading;
  }

  bool get displayBackButton {
    return _displayBackButton;
  }

  bool get disableButton {
    return _disableButton;
  }

  String get selectedValue {
    return _selectedValue;
  }

  String get selectedRollNumber {
    return _selectedRollNumber;
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
    } else if (presentInput == 'Branch') {
      return allBranches;
    } else if (presentInput == 'Registration Number') {
      return allRollNumbers;
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

  Future<bool> fetchRollNumbers() {
    _isLoading = true;
    notifyListeners();
    // print(
    // 'https://college-feedback-5c329.firebaseio.com/StudentData/Batch/${finalEnteries['Batch']}/Branch/${finalEnteries['Branch']}.json');
    return http
        .get(
            'https://college-feedback-5c329.firebaseio.com/StudentData/Batch/${finalEnteries['Batch']}/Branch/${finalEnteries['Branch']}.json')
        .then<bool>((http.Response response) {
      var rollJson = jsonDecode(response.body);

      _rollNumbers = rollJson != null ? List.from(rollJson) : null;

      // print(_rollNumbers);

      _selectedRollNumber = _rollNumbers[0];

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
    } else if (presentInput == 'Batch') {
      _displayBackButton = true;
      _rollNumbers.clear();
      _branches.clear();
    } else if (presentInput == 'Branch') {
      _displayBackButton = true;
      _rollNumbers.clear();
    } else if (presentInput == 'Registration Number') {
      _displayBackButton = true;
    } else {
      _displayBackButton = true;
    }
    notifyListeners();
    // print(inputs);
    // print(_regulations);
    // print(_batches);
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
        inputs.add(batch);
        presentIndex += 1;

        final Map<String, dynamic> batches = batchees;
        List<String> tempBatches = [];

        batches.forEach((String batch, dynamic branch) {
          tempBatches.add(batch);
          responseDataBranch[batch] = branch;
        });

        _batches = tempBatches;
      });

      _disableButton = true;
      setSelectedValue('');
      notifyListeners();
    } else if (presentInput == 'Batch') {
      _displayBackButton = true;

      responseDataBranch[finalEnteries['Batch']]
          .forEach((String key, dynamic value) {
        inputs.add(key);
        presentIndex += 1;

        final Map<String, dynamic> branches = value;
        List<String> tempBranches = [];

        branches.forEach((String branch, dynamic branchData) {
          tempBranches.add(branch);
          responseDataYear[branch] = branchData;
          print(responseDataYear);
          print(responseDataYear[branch]);
        });

        _branches = tempBranches;
      });

      _disableButton = true;
      setSelectedValue('');
      notifyListeners();
    } else if (presentInput == 'Branch') {
      _displayBackButton = true;
      inputs.add('Registration Number');
      presentIndex += 1;
      _disableButton = true;
      setSelectedValue('');
      notifyListeners();
    } else if (presentInput == 'Registration Number') {
      _displayBackButton = true;
      inputs.add('Here are your details, check them once');
      presentIndex += 1;
      notifyListeners();
    } else if (presentInput == 'Here are your details, check them once') {
            
    }
    //   print(inputs);
    //   print(_regulations);
    //   print(_batches);
  }

  void fillFinalEnteries(String value) async {
    if (presentInput == 'Registration Number') {
      finalEnteries['RollNumber'] = value;
    } else {
      finalEnteries[presentInput] = value;
    }
    setSelectedValue(value);
    notifyListeners();
    print(finalEnteries);
    if (presentInput == 'Branch') {
      await fetchRollNumbers();

      _disableButton = false;
      notifyListeners();
    } else {
      _disableButton = false;
      notifyListeners();
    }
  }

  void setSelectedValue(String value) {
    _selectedValue = value;
    // print('Selected value: ' + _selectedValue);
  }

  void setSelectedRollNumber(String value) {
    _selectedRollNumber = value;
  }

  // void resetState() {
  //   print('In scoped model resetState');
  //   notifyListeners();
  // }
}
