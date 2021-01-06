import 'package:flutter/material.dart';


class Result extends StatelessWidget {
 final int resultScore;
 final Function resetQuizHandler;

  Result(this.resultScore,this.resetQuizHandler);

  String get resultPhrase{
    var resultText;
    if(resultScore >= 28){
      resultText = "You are awesome !";
    }else if(resultScore >= 24 && resultScore < 28){
      resultText = "Pretty Likable !";
    }
     else if(resultScore >= 18 && resultScore < 24 ){
      resultText = "You are poor !";
    }
    else{
      resultText = "Thanks for participating !";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(resultPhrase,style: TextStyle(fontSize: 36.0,fontWeight: FontWeight.bold),),
        ),
        FlatButton(
            onPressed: resetQuizHandler,
            child: Text('Reset Quiz',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20.0,
              ),),)
      ],
    );
  }
}
