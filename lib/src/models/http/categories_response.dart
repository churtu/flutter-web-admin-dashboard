import 'dart:convert';

import 'package:admin_dashboard/src/models/models.dart';

class CategoriesResponse {
    CategoriesResponse({
        required this.total,
        required this.categorias,
    });

    final int total;
    final List<Categoria> categorias;

    factory CategoriesResponse.fromJson(String str) => CategoriesResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CategoriesResponse.fromMap(Map<String, dynamic> json) => CategoriesResponse(
        total: json["total"],
        categorias: List<Categoria>.from(json["categorias"].map((x) => Categoria.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "total": total,
        "categorias": List<dynamic>.from(categorias.map((x) => x.toMap())),
    };
}
