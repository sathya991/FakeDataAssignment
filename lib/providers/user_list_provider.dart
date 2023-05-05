import 'package:fakelegends/models/user_model.dart';
import 'package:fakelegends/services/get_user_list_service.dart';
import 'package:flutter/material.dart';

class UserListProvider extends ChangeNotifier {
  final List<Datum> _userDataState = [];
  //Maintains state of list of data from api call
  int _curIndex = 1; //Maintains page index
  int get getIndex => _curIndex;
  bool isLoading = false;
  //Checks whether a call is already going on, this helps in making sure we dont hit the api many times while loading
  final GetUserListService _service = GetUserListService();
  bool noMoreData = false;
  //Checks if no more data is present to get from api call

  List<Datum> get userDataList => _userDataState;

  void incrementIndex() {
    _curIndex++;
    notifyListeners();
  }

//This is used to hit the api using API service and get the data, index is passed as parameter to use as query paramater in API service
  void getData({int index = 1}) async {
    if (!isLoading) {
      isLoading = true;
      notifyListeners();
      final UserModel response = await _service.getUserList(index: index);
      if (response.data.isEmpty) {
        //Checks if no more data is available to load then we set nomoredata to true so that it stops loading
        noMoreData = true;
        notifyListeners();
      } else {
        _userDataState.addAll(response.data);
        //Adds api call data list to the state list which is used in UI.
        isLoading = false;
        notifyListeners();
      }
    }
  }
}
