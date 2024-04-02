import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../global.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  GlobalKey<FormState> formekey = GlobalKey();
  TextEditingController txtname =TextEditingController();
  TextEditingController txtgr =TextEditingController();
  TextEditingController txtstd =TextEditingController();

  String path= "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          "Add New Student",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          IconButton(onPressed: () async{
            ImagePicker picker = ImagePicker();
            XFile? image =
                await picker.pickImage(source: ImageSource.gallery);
            setState(() {
              path = image!.path;
              g1.img = image.path;
            });
          }, icon: Icon(Icons.photo),)
        ],
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.sizeOf(context).width,
                decoration:  BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                child:
                Form(
                  key: formekey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("ENTER GR ID"),
                        ),
                        keyboardType: TextInputType.number,
                        controller: txtgr,
                        validator: (value) {
                          if(value!.isEmpty || value==null)
                          {
                            return "This Feild Is Required";
                          }
                          else
                          {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("ENTER NAME"),
                        ),
                        keyboardType: TextInputType.name,
                        controller: txtname,
                        validator: (value) {
                          if(value!.isEmpty || value==null)
                            {
                              return "This Feild Is Required";
                            }
                          else
                            {
                              return null;
                            }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("ENTER STD"),
                        ),
                        keyboardType: TextInputType.number,
                        controller: txtstd,
                        validator: (value) {
                          if(value!.isEmpty || value==null)
                          {
                            return "This Feild Is Required";
                          }
                          else
                          {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: () {
          
               if(formekey.currentState!.validate())
                 {
                   FocusManager.instance.primaryFocus?.unfocus();
                   g1.name=txtname.text;
                   g1.gr=txtgr.text;
                   g1.std=txtstd.text;
                 }
              },child: const Text("SAVE",style: TextStyle(color: Colors.black),),)
            ],
          ),
        ),
      ),
    );
  }
}
