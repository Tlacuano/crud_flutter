class BarcaModel {
  final int id;
  final String nombre;
  final String tipo;
  final double longitud;
  final int capacidad;

  BarcaModel(
      {required this.id,
      required this.nombre,
      required this.tipo,
      required this.longitud,
      required this.capacidad});

  factory BarcaModel.fromJson(Map<String, dynamic> json) {
    return BarcaModel(
      id: json['id'],
      nombre: json['nombre'],
      tipo: json['tipo'],
      longitud: json['longitud'],
      capacidad: json['capacidad'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'tipo': tipo,
      'longitud': longitud,
      'capacidad': capacidad,
    };
  }
}
