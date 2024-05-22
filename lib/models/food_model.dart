class TodoModel {
  String? id;
  String? text;
  bool? isDone;

  TodoModel();

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel()
    ..id = json['id']
    ..text = json['text']
    ..isDone = json['isDone'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'isDone': isDone,
    };
  }
}

List<TodoModel> todoListA = [
  TodoModel()
    ..id = '1'
    ..text = 'ngu day'
    ..isDone = false,
  TodoModel()
    ..id = '2'
    ..text = 'tap the duc'
    ..isDone = false,
  TodoModel()
    ..id = '3'
    ..text = 'an sang'
    ..isDone = false,
  TodoModel()
    ..id = '4'
    ..text = 'di den truong'
    ..isDone = false,
  TodoModel()
    ..id = '5'
    ..text = 'hoc Flutter'
    ..isDone = false,
  TodoModel()
    ..id = '6'
    ..text = 've nha'
    ..isDone = false,
  TodoModel()
    ..id = '7'
    ..text = 'nghi trua'
    ..isDone = false,
  TodoModel()
    ..id = '8'
    ..text = 'hoc tieng anh'
    ..isDone = false,
  TodoModel()
    ..id = '9'
    ..text = 'di choi'
    ..isDone = false,
];



// class FoodModel {
//   int? id;
//   String? imageStr;
//   String? name;
//   double? price;
//   int? quantity;
//   String? description;

//   double get total => (price ?? 0.0) * (quantity ?? 0);
// }

// List<FoodModel> foods = [
//   FoodModel()
//     ..id = 1
//     ..imageStr = 'assets/images/food_1.png'
//     ..name = 'Fried Chicken'
//     ..price = 20.0
//     ..quantity = 2
//     ..description = 'Golden browse fried chicken',
//   FoodModel()
//     ..id = 2
//     ..imageStr = 'assets/images/food_2.png'
//     ..name = 'Cheese Sandwich'
//     ..price = 18.0
//     ..quantity = 3
//     ..description = 'Grilled Cheese Sandwich',
//   FoodModel()
//     ..id = 3
//     ..imageStr = 'assets/images/food_3.png'
//     ..name = 'Egg Pasta'
//     ..price = 15.0
//     ..quantity = 1
//     ..description = 'Spicy Chicken Pasta',
//   FoodModel()
//     ..id = 4
//     ..imageStr = 'assets/images/food_1.png'
//     ..name = 'Fried Chicken'
//     ..price = 20.0
//     ..quantity = 2
//     ..description = 'Golden browse fried chicken',
//   FoodModel()
//     ..id = 5
//     ..imageStr = 'assets/images/food_2.png'
//     ..name = 'Cheese Sandwich'
//     ..price = 18.0
//     ..quantity = 3
//     ..description = 'Grilled Cheese Sandwich',
//   FoodModel()
//     ..id = 6
//     ..imageStr = 'assets/images/food_3.png'
//     ..name = 'Egg Pasta'
//     ..price = 15.0
//     ..quantity = 1
//     ..description = 'Spicy Chicken Pasta',
// ];

