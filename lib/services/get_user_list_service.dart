import 'package:fakelegends/constants/api_constants.dart';
import 'package:fakelegends/models/user_model.dart';
import 'package:http/http.dart' as http;

class GetUserListService {
  Future getUserList({int index = 1}) async {
    final client = http.Client();
    final uri = Uri.parse('${ApiConstants().userApiUrl}/?page=$index');
    //Index is passed as parameter to this service which is used as query parameter
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final json = response.body;
      return userModelFromJson(json);
      //Usermodel class object is returned with data from API call.
    }
    client.close();
  }
}
