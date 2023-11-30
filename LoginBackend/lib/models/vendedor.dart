// To parse this JSON data, do
//
//     final vendedor = vendedorFromJson(jsonString);

import 'dart:convert';

Vendedor vendedorFromJson(String str) => Vendedor.fromJson(json.decode(str));

String vendedorToJson(Vendedor data) => json.encode(data.toJson());

class Vendedor {
    VendedorClass vendedor;
    String token;

    Vendedor({
        required this.vendedor,
        required this.token,
    });

    factory Vendedor.fromJson(Map<String, dynamic> json) => Vendedor(
        vendedor: VendedorClass.fromJson(json["vendedor"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "vendedor": vendedor.toJson(),
        "token": token,
    };
}

class VendedorClass {
    String id;
    String nombre;
    String apellido;
    String cedula;
    String telefono;
    String usuario;
    String contrasena;
    int estado;
    DateTime createAd;
    int v;

    VendedorClass({
        required this.id,
        required this.nombre,
        required this.apellido,
        required this.cedula,
        required this.telefono,
        required this.usuario,
        required this.contrasena,
        required this.estado,
        required this.createAd,
        required this.v,
    });

    factory VendedorClass.fromJson(Map<String, dynamic> json) => VendedorClass(
        id: json["_id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        cedula: json["cedula"],
        telefono: json["telefono"],
        usuario: json["usuario"],
        contrasena: json["contrasena"],
        estado: json["estado"],
        createAd: DateTime.parse(json["createAd"]),
        v: json["__v"],
    );

    // factory VendedorClass

    Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
        "apellido": apellido,
        "cedula": cedula,
        "telefono": telefono,
        "usuario": usuario,
        "contrasena": contrasena,
        "estado": estado,
        "createAd": createAd.toIso8601String(),
        "__v": v,
    };
}
