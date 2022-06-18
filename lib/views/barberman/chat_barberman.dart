// import 'package:e_barber/barberman/bottombar_barberman.dart';
import 'package:flutter/material.dart';

class ChatBarberman extends StatefulWidget {
  const ChatBarberman({Key? key}) : super(key: key);

  @override
  _ChatBarbermanState createState() => _ChatBarbermanState();
}

class _ChatBarbermanState extends State<ChatBarberman> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 25),
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: const Text(
                      "Obrolan",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff20639B), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: SizedBox(
                      width: 500,
                      height: 1000,
                      child: Column(
                        children: [
                          //Insert Chat
                        ],
                      ),
                      //INSERT CHAT
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
