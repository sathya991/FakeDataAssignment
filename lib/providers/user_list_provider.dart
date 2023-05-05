import 'package:fakelegends/models/user_model.dart';
import 'package:fakelegends/services/get_user_list_service.dart';
import 'package:flutter/material.dart';

class UserListProvider extends ChangeNotifier {
  final List<Datum> _userDataState = [];
  int _curIndex = 1;
  int get getIndex => _curIndex;
  bool isLoading = false;
  final GetUserListService _service = GetUserListService();
  bool noMoreData = false;

  List<Datum> get userDataList => _userDataState;

  void incrementIndex() {
    _curIndex++;
    notifyListeners();
  }

  void getData({int index = 1}) async {
    if (isLoading) {
    } else {
      isLoading = true;
      notifyListeners();
      final UserModel response = await _service.getUserList(index: index);
      if (response.data.isEmpty) {
        noMoreData = true;
        notifyListeners();
      } else {
        _userDataState.addAll(response.data);
        isLoading = false;
        notifyListeners();
      }
    }
  }
}
