import 'package:flutter/material.dart';
import 'package:rest_api_live_class_m_9/style.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({Key? key}) : super(key: key);

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Product"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              TextFormField(
                decoration: myInputDecoretion("Name")
              ),
              SizedBox(height: 8,),
              TextFormField(
                  decoration: myInputDecoretion("Product Code")
              ),
              SizedBox(height: 8,),
              TextFormField(
                  decoration: myInputDecoretion("Price")
              ),
              SizedBox(height: 8,),
              TextFormField(
                  decoration: myInputDecoretion("Quality")
              ),
              SizedBox(height: 8,),
              TextFormField(
              decoration: myInputDecoretion("Total Price")
              ),
              SizedBox(height: 8,),
              TextFormField(
                decoration: myInputDecoretion("Image")
              ),
              SizedBox(height: 16,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),

                  ),
                    onPressed: (){

                    }, child: Text("Add")
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
