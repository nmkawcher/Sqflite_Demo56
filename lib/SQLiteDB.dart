import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as PATH;
import 'package:sqflite_demo56/product_model.dart';

String CREATE_PRODUCT_TABLE = '''create table $PROUDUCT_TABLE(
$PRODUCT_COLUMN_NAME text not null,
$PRODUCT_COLUMN_CATEGORY text not null,
$PRODUCT_COLUMN_PRICE real not null
)''';

class SQLiteDB {

  static Future<Database> open() async {
    final root = await getDatabasesPath();
    final db_path = PATH.join(root, 'product_db');
    return openDatabase(db_path, version: 1, onCreate: (db, version) {
      db.execute(CREATE_PRODUCT_TABLE);
    });
  }

  static Future<int> insertProduct(Product product) async {
    final db = await open();
    return db.insert(PROUDUCT_TABLE, product.toMap());
  }

  static Future<List<Product>> getAllProduct() async {
    final db = await open();
    List<Map<String, dynamic>>allProductMap = await db.rawQuery(
        "select * from $PROUDUCT_TABLE");

    return List.generate(allProductMap.length, (index) {
      return Product.fromMap(
          allProductMap[index]
      );
    });
  }
}