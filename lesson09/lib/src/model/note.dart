class Note {
  String? id;
  String userId;
  String titulo;
  String contenido;

  Note({ required this.userId, required this.titulo, required this.contenido});

  Note.fromJson(Map<dynamic, dynamic> json)
    : id = json['id'],
      userId = json['userId'],
      titulo = json['titulo'], 
      contenido = json['contenido'];

  Map<String, Object> toMap() {
    return { 'userId': userId, 'titulo': titulo, 'contenido': contenido };
  }

}
