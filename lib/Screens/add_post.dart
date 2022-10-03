import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class addPost extends StatefulWidget {
  const addPost({Key key}) : super(key: key);

  @override
  State<addPost> createState() => _addPostState();
}

class _addPostState extends State<addPost> {
  // Initial Selected Value
  String dropdownvalue = 'Hamsters';

  // List of items in our dropdown menu
  var items = ["Hamsters", "Cats", "Birds", "Dogs", "Bunnies", 'Others'];

  TextEditingController name = new TextEditingController();
  TextEditingController location = new TextEditingController();
  TextEditingController gender = new TextEditingController();
  TextEditingController codition = new TextEditingController();
  TextEditingController imgUrl = new TextEditingController();
  TextEditingController cost = new TextEditingController();
  TextEditingController description = new TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add post"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: imgUrl,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(500),
                      ),
                    ),
                    labelText: 'imgUrl',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: name,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(500),
                      ),
                    ),
                    labelText: 'Name',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: cost,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(500),
                      ),
                    ),
                    labelText: 'Cost',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: description,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(500),
                      ),
                    ),
                    labelText: 'Description',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: codition,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(500),
                      ),
                    ),
                    labelText: 'Pet Condition',
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: location,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(500),
                      ),
                    ),
                    labelText: 'Location',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
//todo
              Center(
                child: DropdownButton(
                  // Initial Value
                  value: dropdownvalue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownvalue = newValue;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide()))),
                    onPressed: () {
                      _firestore.collection(dropdownvalue).add({
                        "name": name.text,
                        "discription": description.text,
                        "location": location.text,
                        "gender": gender.text,
                        "condition": codition.text,
                        "imgUrl": imgUrl.text,
                        "distance": "0",
                        "cost": cost.text
                      });

                      setState(() {
                        name.clear();
                        cost.clear();
                        description.clear();
                        codition.clear();
                        gender.clear();
                        imgUrl.clear();
                        location.clear();
                      });
                    },
                    child: Text("Add post")),
              )
            ],
          ),
        ],
      ),
    );
  }
}
