class Category {
  int id;
  String name;
  List<Category> children;

  Category({required this.id, required this.name, required this.children});

  factory Category.fromJson({required Map<String, dynamic> json}) {
    return Category(
        id: int.parse(json["id"]), name: json["name"], children: json["child"]);
  }
}
