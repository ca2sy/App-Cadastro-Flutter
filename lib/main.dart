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

class PaginaCadastro extends StatefulWidget{
_PaginaCadastroState createState() => _PaginaCadastroState();
}

class _PaginaCadastroState extends State<PaginaCadastro>{
   TextEditingController emailController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController nomeController = TextEditingController();


void validar(){
  String nome = nomeController.text;
  String email = emailController.text;
  int idade = int.parse(idadeController.text);

   if (nome.length < 10 || email.length <= 7 || idade == null || idade <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Cuidado! Nome precisa ter mais de 10 letras, "
            "idade maior que 0 e email ao menos 7 caracteres.",
          ),
        ),
      );
      return;
    }

     Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaginaConfirmacao(
          nome: nome,
          idade: idade,
          email: email,
        ),
      ),
    );
  }

   Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro"),backgroundColor: Colors.blueAccent, titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(child: Padding(padding: EdgeInsets.all(20),
            child: Column(
              children: [

                TextFormField(controller: nomeController, decoration: InputDecoration(labelText: "Digite seu nome", labelStyle: TextStyle(fontSize: 20)),),

                SizedBox(height: 20,),

                TextFormField(controller: idadeController, decoration: InputDecoration(labelText: "Digite sua idade", labelStyle: TextStyle(fontSize: 20)),),
                
                SizedBox(height: 20,),

                TextFormField(controller: emailController, decoration: InputDecoration(labelText: "Digite seu email",labelStyle: TextStyle(fontSize: 20)),),

              SizedBox(height: 20,),

                ElevatedButton(onPressed:validar, child: Text("Cadastrar"))
              ],
            ),),
            )
          ],
        ),
      )
    );
  }
}

class PaginaConfirmacao extends StatelessWidget{
    final String nome;
    final int idade;
    final String email;

    PaginaConfirmacao({
      required this.nome,
      required this.email,
      required this.idade
    });

    Widget build(BuildContext context){
      return Scaffold(
         appBar: AppBar(
        title: Text("Confirmação"),
        backgroundColor: Colors.blueAccent,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
      ),
      body: Center(
        child: Padding(padding: EdgeInsets.all(20), child: Column(
          mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Cadastro realizado com sucesso!',     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,),
                 SizedBox(height: 30),

              Text("Nome: $nome", style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text("Idade: $idade", style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text("Email: $email", style: TextStyle(fontSize: 18)),

              SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // volta para tela 1
                },
                child: Text("Voltar"),)
          ],
        ), 
        ), 
      )
     
      );
    }
}

 
