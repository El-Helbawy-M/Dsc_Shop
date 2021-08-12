
import 'package:flutter/cupertino.dart';

import 'bottom_button.dart';

Widget buildSheet(BuildContext context) {

  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            '\$185',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text('T-Shirt',
              style:
              TextStyle(fontWeight: FontWeight.w600, letterSpacing: 2)),
        ),
        Text(
          'these are some details about T-Shirt Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry \'s standard dummy text ever since the 1500s, when an unknown printer took a galley',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),

        SizedBox(height:70,),
        BottomButton(buttonTitle: 'Add to cart', onPress: (){

          Navigator.pop(context);
        },)
      ],
    ),
  );
}