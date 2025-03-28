import 'package:flutter/material.dart';
import 'package:search_imoveis/model/chatMessage.dart';

class ChatDetailPage extends StatefulWidget{
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {

  List<ChatMessage> messages = [
    ChatMessage(message: "Salve mano", send: false),
    ChatMessage(message: "Tudo na paz?", send: false),
    ChatMessage(message: "Saalve brroou, tudo na paz e ai?", send: true),
    ChatMessage(message: "De boassaa meu querido, posso te pedir uma coisa?", send: false),
    ChatMessage(message: "Pode sim mano, deu algo errado?", send: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Teste")
        ),
        body: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10,bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return Container(
                  padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                  child: Text(messages[index].message),
                );
              },
            ),
            Align( alignment: Alignment.bottomLeft,
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
                        hintStyle: TextStyle(color: Colors.black54),
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