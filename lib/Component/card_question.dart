import 'package:flutter/material.dart';

class CardQuestion extends StatefulWidget {
  const CardQuestion({super.key});

  @override
  State<CardQuestion> createState() => _CardQuestionState();
}

bool clickStar = false;

class _CardQuestionState extends State<CardQuestion> {
  bool clickOption1 =false ;
  bool clickOption2 =false ;
  bool clickOption3 =false ;
  bool clickOption4 =false ;



  Widget _buildRow (bool clickOption , VoidCallback fn )
  {
    return       Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'ghjfgh',
          style: TextStyle(
            color:clickOption ? Colors.amber : Colors.grey,
            fontSize: 17,
          ),
        ),
        const SizedBox(width: 20,),

          clickOption
            ? IconButton( icon: Icon( Icons.radio_button_on_rounded, color: Colors.amber, size: 20),
          onPressed: () {})
            : IconButton(
          onPressed: () => setState(  fn  ),

          icon: Icon(
            Icons.radio_button_unchecked,
            color: Colors.grey,
            size: 20,
          ),
        ),
      ],
    );

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff262C37),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  clickStar
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              clickStar = false;
                            });
                          },
                          icon: Icon(
                            Icons.star_outlined,
                            color: Colors.amber,
                            size: 35,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              clickStar = true;
                            });
                          },
                          icon: Icon(
                            Icons.star_border,
                            color: Colors.amber,
                            size: 35,
                          ),
                        ),
                  Spacer(flex: 1),
                  Text(
                    'ما هي وحدة قياس القوة في النظام\n الدولي؟',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
              _buildRow(clickOption1 , () {
                clickOption1 = true ;
                clickOption2 = !clickOption1;
                clickOption3 = !clickOption1;
                clickOption4 = !clickOption1;

              }),

              _buildRow(clickOption2 , () {
                clickOption2 = true ;
                clickOption1 = !clickOption2;
                clickOption3 = !clickOption2;
                clickOption4 = !clickOption2;

              }),
              _buildRow(clickOption3 , () {
                clickOption3 = true ;
                clickOption2 = !clickOption3;
                clickOption1 = !clickOption3;
                clickOption4 = !clickOption3;

              }),
              _buildRow(clickOption4 , () {
                clickOption4 = true ;
                clickOption2 = !clickOption4;
                clickOption3 = !clickOption4;
                clickOption1 = !clickOption4;

              }),




            ],
          ),
        ),
      ),
    );
  }
}



