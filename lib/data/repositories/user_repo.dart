import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:programming_test/data/constants/url_constant.dart';
import 'package:programming_test/data/models/user.dart';
import 'package:http/http.dart' as http;

class UserRepo {
  _setHeaders() => {
        'Accept': 'application/json',
        'Authorization': 'Bearer v3srs6i1veetv3b2dolta9shrmttl72vnfzm220z'
      };

  Future<List<User>> getUserDetails() async {
    var isCacheExist = await APICacheManager().isAPICacheKeyExist("API_USER");
    if (!isCacheExist) {
      print("Fetched from API");
      final response = await http.get(Uri.parse(url), headers: _setHeaders());
      if (response.statusCode == 200) {
        String jsonResponse = response.body;
        List<User> result = userFromJson(jsonResponse);
        APICacheDBModel apiCacheDBModel =
            APICacheDBModel(key: "API_USER", syncData: response.body);
        await APICacheManager().addCacheData(apiCacheDBModel);

        return result;
      } else {
        throw Exception("Error occurred while fetching data from API");
      }
    } else {
      print("Fetched from Cache");
      var cacheData = await APICacheManager().getCacheData("API_USER");
      return userFromJson(cacheData.syncData);
    }
  }
}
