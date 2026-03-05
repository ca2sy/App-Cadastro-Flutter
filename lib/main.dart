import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build (BuildContext context){
    return(
      MaterialApp(
        home: PaginaCadastro(),
      )
    );
  }
}

class PaginaCadastro extends StatelessWidget{
  

  Widget build (BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(child: Padding(padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(decoration: InputDecoration(labelText: "Digite seu email",labelStyle: TextStyle(fontSize: 20)),),
                SizedBox(height: 20,),
                TextFormField(decoration: InputDecoration(labelText: "Digite sua senha", labelStyle: TextStyle(fontSize: 20)),),
                
                SizedBox(height: 20,),

                ElevatedButton(onPressed:(){} , child: Text("Cadastrar"))
              ],
            ),),
            )
          ],
        ),
      )
    );
  }
}