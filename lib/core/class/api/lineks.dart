class AppLinks {
  //////////////////// auth /////////////////////
  static const String link = "https://ecommerce.routemisr.com/api/v1";
  static const String signUp = "$link/auth/signup";
  static const String login = "$link/auth/signin";
  //---------------------- home ------------------//
  static const String catLink = "https://ecommerce.routemisr.com/api/v1";
  static const String getCat = "$catLink/categories";
  static const String getBrands = "$catLink/brands";

  // sub cat
  static String subCategories(String id) {
    return "$link/categories/$id/subcategories";
  }

  //products
  static String products(String id) {
    return "$link/products?category=$id";
  }

  //item
  static String item(String id) {
    return "$link/products/$id";
  }

//   cart
  static String addTOCart = "$link/cart";
  static String getCart = "$link/cart";
  static String updatecart(String id) {
    return "$link/cart/$id";
  }

  // fav
  static String fav = "$link/wishlist";
}
