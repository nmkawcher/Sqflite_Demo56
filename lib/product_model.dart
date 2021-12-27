
final PRODUCT_COLUMN_NAME='name';
final PRODUCT_COLUMN_PRICE='price';
final PRODUCT_COLUMN_CATEGORY='category';

final PROUDUCT_TABLE='p_table';

class Product {
  String? name;
  double? price;
  String? category;

  Product({this.name, this.price, this.category});

  Map<String,dynamic>toMap(){
    var map=<String,dynamic>{
      PRODUCT_COLUMN_NAME:name,
      PRODUCT_COLUMN_PRICE:price,
      PRODUCT_COLUMN_CATEGORY:category,
    };
    return map;
  }

  Product.fromMap(Map<String,dynamic>map){
    name=map[PRODUCT_COLUMN_NAME];
    price=map[PRODUCT_COLUMN_PRICE];
    category=map[PRODUCT_COLUMN_CATEGORY];
  }
}
