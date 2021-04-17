class Stock {
  int id;
  String name;
  String imageUrl;
  String price;

  Stock({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  Stock.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        imageUrl = "https://" + json['imageUrl'],
        price = json['price']['current']['text'];

  Stock.fromLocalStorage(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        imageUrl = json['imageUrl'],
        price = json['price'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'price': price, 'imageUrl': imageUrl};
}
