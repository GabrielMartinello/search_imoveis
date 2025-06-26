class Category {
  final int id;
  final int qtd;
  final String desc;

  Category({required this.id, required this.qtd, required this.desc});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      qtd: json['qtd'],
      desc: json['desc'],
    );
  }
}
