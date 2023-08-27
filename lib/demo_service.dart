import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;

String uri = "http://192.168.8.103:8081/api/v1.0/product";
String uriget = "http://192.168.8.103:8081/api/v1.0/product";
String id='';


class MyService {

  Uri endpoint=  Uri.parse(uri);


Map<String,String> headers = {
  "Content-Type" : "application/json",
  "accept":"application/json"
} ;

  postData(ProductDto product) async {
    String payload = product.toJson(); 

    dynamic response = await http.post(endpoint,headers:headers ,body: payload);

    if (response.statusCode == 201){
      print(response.body);
    }
    else {
      print("There is no data");
    }
  }

  getData(String id)async{
    http.Response response = await http.get(Uri.parse("http://192.168.8.103:8081/api/v1.0/product/$id"),headers: headers,);
    if(response.statusCode == 200){
     ProductResponseDto result = ProductResponseDto.fromJson(response.body);
     return result;
    }else {
      print(response.body);
    }
  }
}


class ProductDto {
  String name;
  int price;
  String type;
  bool inStock;
  ProductDto({
    required this.name,
    required this.price,
    required this.type,
    required this.inStock,
  });

 
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'price': price});
    result.addAll({'type': type});
    result.addAll({'inStock': inStock});
  
    return result;
  }

  factory ProductDto.fromMap(Map<String, dynamic> map) {
    return ProductDto(
      name: map['name'] ?? '',
      price: map['price']?.toInt() ?? 0,
      type: map['type'] ?? '',
      inStock: map['inStock'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDto.fromJson(String source) => ProductDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductDto(name: $name, price: $price, type: $type, inStock: $inStock)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProductDto &&
      other.name == name &&
      other.price == price &&
      other.type == type &&
      other.inStock == inStock;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      price.hashCode ^
      type.hashCode ^
      inStock.hashCode;
  }
}

class ProductResponseDto {
String name;
int price;
String type;
bool instock;
String id;
String createdAt;
String updatedAt;
  ProductResponseDto({
    required this.name,
    required this.price,
    required this.type,
    required this.instock,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  ProductResponseDto copyWith({
    String? name,
    int? price,
    String? type,
    bool? instock,
    String? id,
    String? createdAt,
    String? updatedAt,
  }) {
    return ProductResponseDto(
      name: name ?? this.name,
      price: price ?? this.price,
      type: type ?? this.type,
      instock: instock ?? this.instock,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'price': price});
    result.addAll({'type': type});
    result.addAll({'instock': instock});
    result.addAll({'id': id});
    result.addAll({'createdAt': createdAt});
    result.addAll({'updatedAt': updatedAt});
  
    return result;
  }

  factory ProductResponseDto.fromMap(Map<String, dynamic> map) {
    return ProductResponseDto(
      name: map['name'] ?? '',
      price: map['price']?.toInt() ?? 0,
      type: map['type'] ?? '',
      instock: map['instock'] ?? false,
      id: map['id'] ?? '',
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductResponseDto.fromJson(String source) => ProductResponseDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductResponseDto(name: $name, price: $price, type: $type, instock: $instock, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProductResponseDto &&
      other.name == name &&
      other.price == price &&
      other.type == type &&
      other.instock == instock &&
      other.id == id &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      price.hashCode ^
      type.hashCode ^
      instock.hashCode ^
      id.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
  }
}
