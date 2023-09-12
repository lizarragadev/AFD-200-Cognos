class Contact {
  String? id;
  String userId;
  String nombre;
  String telefono;
  String email;
  
  Contact({
    required this.userId,
    required this.nombre,
    required this.telefono,
    required this.email
  });

  Contact.fromJson(Map<dynamic, dynamic> json)
    :   id = json['id'] as String,
        userId = json['userId'] as String,
        nombre = json['nombre'] as String,
        telefono = json['telefono'] as String,
        email = json['email'] as String;

  Map<String, Object> toMap() {
    return {
      'userId': userId,
      'nombre': nombre,
      'telefono': telefono,
      'email': email
    };
  }

}
