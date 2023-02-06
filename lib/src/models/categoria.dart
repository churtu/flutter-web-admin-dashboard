
import 'dart:convert';

class Categoria {
    Categoria({
        required this.id,
        required this.nombre,
        required this.usuario,
    });

    String id;
    String nombre;
    UsuarioCategoria usuario;

    factory Categoria.fromJson(String str) => Categoria.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Categoria.fromMap(Map<String, dynamic> json) => Categoria(
        id: json["_id"],
        nombre: json["nombre"],
        usuario: UsuarioCategoria.fromMap(json["usuario"]),
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
        "usuario": usuario.toMap(),
    };
}

class UsuarioCategoria {
    UsuarioCategoria({
        required this.id,
        required this.nombre,
    });

    final String id;
    final String nombre;

    factory UsuarioCategoria.fromJson(String str) => UsuarioCategoria.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UsuarioCategoria.fromMap(Map<String, dynamic> json) => UsuarioCategoria(
        id: json["_id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
    };
}