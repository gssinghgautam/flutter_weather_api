import 'package:mongo_dart/mongo_dart.dart';

import '../flutter_weather.dart';

class CityController extends ResourceController{
CityController({this.db});
final Db db;

@Operation.get()
Future<Response> getAllCities() async{
  final cities = db.collection("cities");
  final data = await cities.find().toList();
  return Response.ok({
    "error" : false,
    "userMessage" : "List of cities",
    "errors" : null,
    "data" : data
  });
}

@Operation.post()
Future<Response> addCities() async{
  final body = await request.body.decode<Map<String, dynamic>>();
  final cities = db.collection("cities");
  await cities.insert(body);
  return Response.ok({
    "error" : false,
    "userMessage" : "List of cities",
    "errors" : null,
    "data" : [body]
  });
}

}