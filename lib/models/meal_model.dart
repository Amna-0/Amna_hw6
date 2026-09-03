class MealModel {
  String? strMeal;
  String? strMealThumb;
  String? strCategory;
  String? strInstructions;

  MealModel({this.strMeal,this.strMealThumb,this.strCategory,this.strInstructions});
  
  factory MealModel.fromJson(Map<String, dynamic> json){
    return MealModel(
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      strCategory: json['strCategory'],
      strInstructions: json['strInstructions'],
    );
  }
}