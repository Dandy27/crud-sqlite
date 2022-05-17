class Contacts {
  int? id;
  String name;
  String contact;

  Contacts({
    this.id,
    required this.name,
    required this.contact,
  });

  factory Contacts.fromJson(Map<String, dynamic> json) => Contacts(
        id: json['id'],
        name: json['name'],
        contact: json['contact'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'contact': contact,
  };
}
