// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petworld/models/data.dart';
import 'package:petworld/widgets/buildvet.dart';
import 'package:petworld/widgets/pet_widget.dart';

import '../Pet Shop/pet_shop.dart';
import '../widgets/buildPetShop.dart';
import '../widgets/build_pet_category.dart';
import '../widgets/drawer_child.dart';
import 'notification_screen.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  List<Pet> pets = getPetList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40), // here the desired height
        child: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.black,
          elevation: 0,
          //leading: Icon(
          // Icons.sort,
          //color: Colors.grey[800],
          //),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: IconButton(
                icon: const Icon(Icons.notifications_none),
                color: Colors.white,
                onPressed: () {
                  Get.to(notificationBill());
                },
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: DrawerChild(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "Find Your",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Lovely pet anywhere ♥",
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pet Category: ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildPetCategory(
                        Category.Bird, '7', Colors.orange[200], context),
                    buildPetCategory(
                        Category.HAMSTER, '7', Colors.orange[200], context),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildPetCategory(
                        Category.BUNNY, '8', Colors.orange[200], context),
                    buildPetCategory(
                        Category.DOG, '12', Colors.orange[200], context)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildPetCategory(
                        Category.Snake, '4', Colors.orange[200], context),
                        buildPetCategory(Category.CAT, '12', Colors.orange, context)
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Newest pet: ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 280,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: buildNewstPet(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16, left: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vets Near You: ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 130,
            margin: EdgeInsets.only(
              bottom: 30,
            ),
            child: Container(
              width: 500,
              height: 100,
              child: PageView(
                physics: BouncingScrollPhysics(),
                children: [
                  buildVet("assets/images/vets/img_1.png",
                      "Artemis Veterinary Center", "(079) 8422222"),
                  buildVet("assets/images/vets/img_2.png",
                      "Big Lake Vet Hospital", "(079) 8433333"),
                  buildVet("assets/images/vets/img_3.png",
                      "Veterinary Medical Center ", "(079) 8455555")
                ],
              ),
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "   Pet Shop Near You: ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          Container(
            height: 130,
            margin: EdgeInsets.only(
              bottom: 30,
            ),
            child: Container(
              width: 500,
              height: 100,
              child: PageView(
                physics: BouncingScrollPhysics(),
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => PetShop());
                    },
                    child: buildPetShop("assets/images/vets/img_1.png",
                        "Artemis Veterinary Center", "(079) 8422222"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => PetShop());
                    },
                    child: buildPetShop("assets/images/vets/img_2.png",
                        "Big Lake Vet Hospital", "(079) 8433333"),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  List<Widget> buildNewstPet() {
    List<Widget> list = [];
    for (var i = 0; i < pets.length; i++) {
      if (pets[i].newest) {
        list.add(petWidget(pet: pets[i], index: i));
      }
    }
    return list;
  }
}
