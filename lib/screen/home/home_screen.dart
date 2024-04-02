import 'package:flutter/material.dart';

import '../../global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          "Home Screen",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: g1.Sname.length,
          itemBuilder: (context, index) {
            return InkWell(onTap: () {
              Navigator.pushNamed(context, 'detail');
            },
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(10),
                height: 100,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     Text("${g1.Sname[index]['gr']}"),

                     CircleAvatar(
                    ),
                      Column(
                      children: [
                        Text("${g1.Sname[index]['name']}"),

                        Text("${g1.Sname[index]['std']}"),
                      ],
                    ),

                    IconButton(onPressed: () {
                     setState(() {
                       g1.Sname.removeAt(index);
                     });
                    }, icon: const Icon(Icons.delete),)
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed:() {
          Navigator.pushNamed(context, 'add');
      },
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
