import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hw_6/models/meal_model.dart';

class Api {
  String link ='https://www.themealdb.com/api/json/v1/1/search.php?s=chicken';
  
  Future<List<MealModel>> getData() async {
    var uri = Uri.parse(link);
    var response = await http.get(uri);
    var body = response.body;
    var bodyResponse = jsonDecode(body);

    List<MealModel> listData = [];

    for(var item in bodyResponse['meals']){
      MealModel model = MealModel.fromJson(item);
      listData.add(model);
    }

    return listData;

 }
}