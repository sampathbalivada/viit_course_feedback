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
  // String _selectedValue = 'string';
  String _selectedRollNumber = '';
  String _selectedOption = '';

  bool _isLoading = false;
  bool _displayBackButton = false;
  bool _disableButton = false;

  List<String> _rollNumbers = [];
  List<String> _regulations = [];
  List<String> _batches = [];
  List<String> _branches = [];
  List<String> _semesters = [];

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

  // String get selectedValue {
  //   return _selectedValue;
  // }

  String get selectedOption {
    return _selectedOption;
  }

  String get getFinalPresentEntry {
    if (presentInput == 'Registration Number') {
      return finalEnteries['RollNumber'];
    } else if (finalEnteries.containsKey(presentInput)) {
      return finalEnteries[presentInput];
    } else {
      return 'There is something';
    }
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

  List<String> get allSemesters {
    return List.from(_semesters);
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
      _rollNumbers.insert(0, "Select your registration Id");
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
    setSelectedOption('');

    presentIndex -= 1;
    inputs.removeLast();
    if (presentInput == 'Regulation') {
      _displayBackButton = false;
      _rollNumbers.clear();
      _batches.clear();
      _branches.clear();
      finalEnteries[presentInput] = '';
    } else if (presentInput == 'Batch') {
      _displayBackButton = true;
      _rollNumbers.clear();
      _branches.clear();
      finalEnteries[presentInput] = '';
    } else if (presentInput == 'Branch') {
      _displayBackButton = true;
      _rollNumbers.clear();
      finalEnteries[presentInput] = '';
      finalEnteries['RollNumber'] = '';
    } else if (presentInput == 'Registration Number') {
      _displayBackButton = true;
      _rollNumbers.insert(0, "Select your registration Id");
      _selectedRollNumber = _rollNumbers[0];
      finalEnteries['RollNumber'] = '';
    } else {
      _displayBackButton = true;
    }
    notifyListeners();
    // print(inputs);
    // print(_regulations);
    // print(_batches);
  }

  void onNextButtonPressed() {
    setSelectedOption('');
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

      // _disableButton = true;
      // setSelectedValue('');
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
          // print(responseDataYear);
          // print(responseDataYear[branch]);
        });
        // print('This');
        // print(responseDataYear);
        _branches = tempBranches;
      });

      // _disableButton = true;
      // setSelectedValue('');
      notifyListeners();
    } else if (presentInput == 'Branch') {
      _displayBackButton = true;
      inputs.add('Registration Number');
      presentIndex += 1;
      // _disableButton = true;
      // setSelectedValue('');
      notifyListeners();
    } else if (presentInput == 'Registration Number') {
      setSelectedOption('Branch');
      _displayBackButton = true;
      inputs.add('Here are your details, check them once');
      presentIndex += 1;
      notifyListeners();
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
    // setSelectedValue(value);
    // notifyListeners();
    print(finalEnteries);
    if (presentInput == 'Branch') {
      await fetchRollNumbers();
      // _disableButton = false;
      notifyListeners();
    } else {
      // _disableButton = false;
      notifyListeners();
    }
  }

  void clearFinalEntry() {
    if (presentInput == 'Registration Number') {
      finalEnteries['RollNumber'] = '';
    } else if (finalEnteries.containsKey(presentInput)) {
      finalEnteries[presentInput] = '';
    }
    notifyListeners();
  }

  // void setSelectedValue(String value) {
  //   _selectedValue = value;
  //   // print('Selected value: ' + _selectedValue);
  // }

  void setSelectedRollNumber(String value) {
    _selectedRollNumber = value;
  }

  // void resetState() {
  //   print('In scoped model resetState');
  //   notifyListeners();
  // }

  void setSelectedOption(String value) {
    _selectedOption = value;
    notifyListeners();
  }

  void removeDefaultRollNumber() {
    _rollNumbers.remove('Select your registration Id');
  }

  void extractSemesters() {
    List<String> tempList = [];
    // print('Yeah');
    responseDataYear[finalEnteryDetails['Branch']]
        .forEach((String key, dynamic value) {
      // print(key);
      // print(value);
      Map<String, dynamic> temp = value;

      temp.forEach((String key, dynamic value) {
        // print(key);
        // print(value);

        Map<String, dynamic> temp1 = value;

        temp1.forEach((String key, dynamic value) {
          // print(key);
          // print(value);

          tempList.add(value.toString());
        });
      });
    });
    _semesters = tempList;
    // print(_semesters);
  }

  // From here we will be handling semeseters page and input data page

  Map<String, dynamic> _responseQuestions = {};

  List<Map<String, dynamic>> _selectedSemesterQuestions = [];

  List<String> _courseIndex = [];
  List<String> _courseOutcomes = [];

  List<int> feedbackValues = [];

  int _presentSubjectIndex;

  String _clickedSemester;
  String _presentSubjectName;

  int get presentSubjectIndex {
    return _presentSubjectIndex;
  }

  String get clickedSemester {
    return _clickedSemester;
  }

  String get presentSubjectName {
    return _presentSubjectName;
  }

  List<String> get courseIndex {
    return _courseIndex;
  }

  List<String> get courseOutcomes {
    return _courseOutcomes;
  }

  List<Map<String, dynamic>> get selectedSemesterQuestions {
    return _selectedSemesterQuestions;
  }

  Future<bool> fetchQuestions() {
    _isLoading = true;
    notifyListeners();

    setPresentSubjectIndex(0);

    return http
        .get(
            'https://college-feedback-5c329.firebaseio.com/Questions/${finalEnteries['Regulation']}/$_clickedSemester.json')
        .then((http.Response response) {
      _responseQuestions = json.decode(response.body);
      // print(_responseQuestions);

      List<Map<String, dynamic>> temp = [];
      List<String> temp1 = [];

      _responseQuestions.forEach((String key, dynamic value) {
        temp.add(value);
        temp1.add(key);
      });

      _selectedSemesterQuestions = temp;
      _courseIndex = temp1;

      print(_selectedSemesterQuestions);
      print(_courseIndex);

      fillOutcomesFromDic();

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

  void setClickedSemester(String value) async {
    _clickedSemester = value;
    await fetchQuestions();
    notifyListeners();
  }

  void setPresentSubjectIndex(int index) {
    _presentSubjectIndex = index;
  }

  void fillOutcomesFromDic() {
    _courseOutcomes
        .add(_selectedSemesterQuestions[_presentSubjectIndex]['CO1']);
    _courseOutcomes
        .add(_selectedSemesterQuestions[_presentSubjectIndex]['CO2']);
    _courseOutcomes
        .add(_selectedSemesterQuestions[_presentSubjectIndex]['CO3']);
    _courseOutcomes
        .add(_selectedSemesterQuestions[_presentSubjectIndex]['CO4']);
    _presentSubjectName =
        _selectedSemesterQuestions[_presentSubjectIndex]['Subject'];
  }

  Future<bool> putfeedBack() {
    _isLoading = true;
    notifyListeners();

    Map<String, dynamic> subjectFeedback = {
      'C01': feedbackValues[0],
      'CO2': feedbackValues[1],
      'CO3': feedbackValues[2],
      'CO4': feedbackValues[3],
    };

    return http
        .put(
            'https://college-feedback-5c329.firebaseio.com/StudentFeedback/${finalEnteryDetails['Regulation']}/${finalEnteryDetails['Batch']}/$clickedSemester/${finalEnteryDetails['RollNumber']}/${courseIndex[presentSubjectIndex]}.json',
            body: json.encode(subjectFeedback))
        .then((http.Response response) {
      print('i should be executed before am i waiting');
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

  void onNextInputButton(List<double> values) async {
    List<int> temp = [];
    values.forEach((double value) {
      temp.add(value.toInt());
    });
    feedbackValues = temp;

    await putfeedBack();

    print('am i waiting');

    _presentSubjectIndex += 1;
    fillOutcomesFromDic();

    notifyListeners();
  }
}
