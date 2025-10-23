import 'package:flutter/material.dart';
import 'package:untitled/Component/reactive_radio.dart';
import 'package:untitled/Component/star.dart';


class CardQuestion extends StatelessWidget {
  final int numberItem;

  final int index;

  final RadioFormExample radioFormExample;
 final bool click ;
  final VoidCallback? onFavoriteTap;


  const CardQuestion({
    super.key,
    required this.index,
    required this.numberItem,
    required this.radioFormExample,
    required this.click,
    this.onFavoriteTap,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white70,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,

            children: [Star(clickStar: click, onTap: onFavoriteTap,),Spacer(flex: 1,), radioFormExample],
          ),

          Text('السؤال رقم ${index + 1} من $numberItem'),
        ],
      ),
    );
  }
}












