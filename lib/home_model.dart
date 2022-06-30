class HomeModels {
  final int total;
  final List<HomeModelsTwo> data;

  HomeModels({required this.total, required this.data});

  factory HomeModels.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['data'] as List;
    List<HomeModelsTwo> modelsList =
    list.map((i) => HomeModelsTwo.fromJson(i)).toList();
    return HomeModels(total: parsedJson['total'], data: modelsList);
  }
}

class HomeModelsTwo {
  final String id;
  final String name;
  final String des;
  final String image;
  final int price;
  final String address;
  HomeModelsTwo({
    required this.id,
    required this.name,
    required this.des,
    required this.image,
    required this.price,
    required this.address,
  });

  factory HomeModelsTwo.fromJson(Map<String, dynamic> parsedJson) {
    return HomeModelsTwo(
      id: parsedJson['_id'],
      name: parsedJson['name'],
      des: parsedJson['des'],
      image: parsedJson['image'],
      price: parsedJson['price'],
      address: parsedJson['address'],
    );
  }
}
