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
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        // foregroundColor: Colors.white,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.only(left: 50, right: 50, bottom: 25),
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
                      height: 600,
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
