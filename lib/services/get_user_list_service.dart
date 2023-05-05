import 'package:fakelegends/constants/api_constants.dart';
import 'package:fakelegends/models/user_model.dart';
import 'package:http/http.dart' as http;

class GetUserListService {
  Future getUserList({int index = 1}) async {
    var client = http.Client();
    var uri = Uri.parse("${ApiConstants().userApiUrl}/?page=$index");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return userModelFromJson(json);
    }
    client.close();
  }
}
