import 'package:flutter/material.dart';
import 'package:sqflite_demo56/SQLiteDB.dart';
import 'package:sqflite_demo56/product_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: SQLiteDB.getAllProduct(),
        builder: (context, AsyncSnapshot<List<Product>>snapshot){
          if(snapshot.hasData){
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context,index){
                  return Container(
                    height: 100,
                    color: Colors.deepOrangeAccent,
                    child: Text(snapshot.data![index].name.toString()),
                  );
                }
            );
          } if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}
