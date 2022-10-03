import 'package:flutter/material.dart';

class notificationBill extends StatelessWidget {
  // const notificationBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.black,
       title: Text(
         'Notification Page',
         style: TextStyle(
           color: Colors.white,
           fontSize: 24,
           fontWeight: FontWeight.bold,
         ),
       ),
       leading: IconButton(
        icon: const Icon(Icons.arrow_back,),
           color: Colors.white,
         onPressed: (){Navigator.pop(context);},
       ),
     ),
     body:
     Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Padding(
           padding: const EdgeInsets.all(95),
           child: Text(
               'There is no Notification ',
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 24
             ),
           ),
         )
       ],
     ),
   );
  }
}
