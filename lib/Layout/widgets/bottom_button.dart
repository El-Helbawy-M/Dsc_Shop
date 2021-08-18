import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
 final Function onPress ;
 final String buttonTitle;
 BottomButton({this.onPress, this.buttonTitle});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.black,
            elevation: 7.0,
            primary: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 15.0)),
        onPressed: onPress,
        child: Text(buttonTitle, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: 'Lobster'),),),
    );
  }
}
