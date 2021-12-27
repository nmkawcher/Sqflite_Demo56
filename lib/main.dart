import 'package:flutter/material.dart';
import 'package:sqflite_demo56/SQLiteDB.dart';
import 'package:sqflite_demo56/product_list.dart';
import 'package:sqflite_demo56/product_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            onChanged: (data) => value = data,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Product p =
                  Product(name: "product1", price: 200, category: "Fresh");
              SQLiteDB.insertProduct(p).then((value) {
                if (value > 0) {
                  print("insert successful");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen()));
                } else {
                  print("data insert fail");
                }
              });
            },
            child: Text("Save"),
          )
        ],
      ),
    );
  }
}
