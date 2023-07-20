import 'dart:convert';
import 'package:spacex/models/model.dart';
import 'package:http/http.dart';

class SpaceXRepository {
  String latestURL = 'https://api.spacexdata.com/v4/launches/latest';

  Future<List<SpaceX>> getSpaceX() async {
    Response response = await get(Uri.parse(latestURL));
    if (response.statusCode == 200) {
      late List result=[];
      result.add(jsonDecode(response.body));

      return result.map((e) => SpaceX.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
