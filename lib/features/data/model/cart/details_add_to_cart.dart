class ModelDetailsAddToCart {
  String? status;
  String? message;
  int? numOfCartItems;
  String? cartId;
  Data? data;

  ModelDetailsAddToCart(
      {this.status, this.message, this.numOfCartItems, this.cartId, this.data});

  ModelDetailsAddToCart.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? sId;
  String? cartOwner;
  List<Products>? products;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? totalCartPrice;

  Data(
      {this.sId,
      this.cartOwner,
      this.products,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.totalCartPrice});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class Products {
  int? count;
  String? sId;
  String? product;
  int? price;

  Products({this.count, this.sId, this.product, this.price});

  Products.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    sId = json['_id'];
    product = json['product'];
    price = json['price'];
  }
}
