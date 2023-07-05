import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD"),
      ),
      body: ListView.separated(
        itemCount: 20,
          itemBuilder: (context, index){
            return ListTile(
              leading: Icon(Icons.image),
              title: Text("Product Name"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product Code"),
                  Text("Total Price"),
                  Text("Available Units"),
                ],
              ),
              trailing: Text("Unit Price"),
            );
          }, separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.red,
            height: 1,
          );
      },
      ),
    );
  }
}
