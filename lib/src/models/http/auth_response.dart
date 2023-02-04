
import 'dart:convert';
import 'package:admin_dashboard/src/models/models.dart';

class AuthResponse {
    AuthResponse({
        required this.usuario,
        required this.token,
    });

    final Usuario usuario;
    final String token;

    factory AuthResponse.fromJson(String str) => AuthResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        usuario: Usuario.fromMap(json["usuario"]),
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "usuario": usuario.toMap(),
        "token": token,
    };
}