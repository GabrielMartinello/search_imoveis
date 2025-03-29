import 'package:flutter/material.dart';
import 'package:search_imoveis/model/chatMessage.dart';

class ChatDetailPage extends StatefulWidget{
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {

  List<ChatMessage> messages = [
    ChatMessage(message: "Fala brou", send: false),
    ChatMessage(message: "Aqui que vai integrar com o chat gepeto?", send: false),
    ChatMessage(message: "Não vai ser fácil!", send: true),
    ChatMessage(message: "Eu sei que não, mas se der vai ser daora!", send: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Assistente de vendas"),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            elevation: 0
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10,bottom: 55),
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index){
                return Container(
                  padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                  child: Align(
                    alignment: (messages[index].send == true ? Alignment.topLeft : Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (messages[index].send == true ? Colors.grey.shade200 : Colors.blue[200])
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(messages[index].message, style: TextStyle(fontSize: 15, color: Colors.black),)

                    ),
                  ),

                );
              },
            ), Align( alignment: Alignment.bottomLeft,
          child: Container(
            padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
            height: 60,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Digite algo...",
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                FloatingActionButton(
                  onPressed: (){},
                  backgroundColor: Colors.blue,
                  elevation: 0,
                  child: Icon(Icons.send,color: Colors.white,size: 18)
                )
              ]

            )
          )
        )
          ]
        )
    );
  }
}