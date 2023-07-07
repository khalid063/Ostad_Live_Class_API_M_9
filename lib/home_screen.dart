import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_api_live_class_m_9/add_new_product_screen.dart';
import 'package:http/http.dart';
import 'package:rest_api_live_class_m_9/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  /// List for putting data from Pojo class
  List<Product> products = [];

  /// 1st work for API call : call "initSate"
  @override
  void initState() {
    // TODO: implement initState
    print("Call the Api");
    getProduct();           /// 3st work for API call : call getProduct method
  }

  /// 2st work for API call : make getProduct method
  void getProduct() async{
    //https://crud.teamrabbil.com/api/v1/ReadProduct
    //call - GET
    /// Uri -> Universal Resource Identifire
    //get(Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct'));
    Response response =
        await get(Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct'));
    print(response.statusCode);
    print(response.body);
    //final decodedResponse = jsonDecode(response.body);
    final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    //print(decodedResponse.length);
    print(decodedResponse['data'].length);
    if(response.statusCode == 200 && decodedResponse['status'] == 'success'){

      /// forEach loop for inserting data
      for (var e in decodedResponse['data']){
        products.add(Product(
              e['_id'],
              e['ProductName'],
              e['ProductCode'],
              e['UnitPrice'],
              e['TotalPrice'],
              e['CreatedDate'],
              e['Qty'],
        ));
      }

      /// *** Short Code of "forEach Loop"

      // decodedResponse['data'].forEach((e) {
      //   products.add(Product(
      //     e['_id'],
      //     e['ProductName'],
      //     e['ProductCode'],
      //     e['UnitPrice'],
      //     e['TotalPrice'],
      //     e['CreatedDate'],
      //     e['Qty'],
      //   ));
      // });


      setState(() {});
    }
    print('after getting : ${products.length}');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD"),
      ),
      body: ListView.separated(
        itemCount: products.length,
          itemBuilder: (context, index){
            return ListTile(
              onLongPress: (){
                showDialog(
                    context: context,
                    ///builder: (BuildContext context) ///*** we can be use also this code
                    builder: (_){
                      return AlertDialog(
                        //titlePadding: EdgeInsets.zero,
                        titlePadding: EdgeInsets.only(left: 16),
                        contentPadding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                        title: Row(
                          children: [
                            Text("Chose an Action"),
                            Spacer(),
                            IconButton(onPressed: (){
                              Navigator.pop(context);
                            }, icon: Icon(Icons.close))
                          ],
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Divider(color: Colors.cyanAccent, height: 2,),
                            ListTile(
                              onTap: (){},
                              leading: Icon(Icons.edit),
                              title: Text("Edit"),
                            ),
                            //Divider(color: Colors.cyanAccent, height: 2,),
                            ListTile(
                              onTap: (){},
                              leading: Icon(Icons.delete),
                              title: Text("Delete"),
                            ),
                          ],
                        ),
                      );
                    }
                );
              },
              //leading: Icon(Icons.image),
              leading: Image.network(
                products[index].image,
                width: 50,
                errorBuilder: (_, __, ___,){
                  return Icon(
                      Icons.image,
                    size: 32,
                  );
                },
              ),
              title: Text("Product Name : ${products[index].productName}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product Code : ${products[index].productCode}"),
                  Text("Total Price : ${products[index].totalPrice}"),
                  Text("Created Date : ${products[index].quentity}"),
                ],
              ),
              trailing: Text("Unit Price : ${products[index].unitPrice}"),
            );
          }, separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.red,
            height: 1,
          );
      },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => const AddNewProductScreen()));
        },
      ),
    );
  }
}
