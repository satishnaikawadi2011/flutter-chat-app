import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message, this.username, this.imageUrl, this.isMe,
      {this.key});
  final String message;
  final bool isMe;
  final Key key;
  final String username;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: isMe ? Colors.grey[300] : Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft:
                        !isMe ? Radius.circular(0) : Radius.circular(12),
                    bottomRight:
                        isMe ? Radius.circular(0) : Radius.circular(12)),
              ),
              width: 140,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    isMe ? 'You' : username,
                    style: isMe
                        ? TextStyle(fontWeight: FontWeight.bold)
                        : TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.start,
                  ),
                  Text(message,
                      style: isMe
                          ? TextStyle(color: Colors.black)
                          : TextStyle(color: Colors.white),
                      textAlign: TextAlign.start),
                ],
              ),
            ),
          ],
        ),
        Positioned(
            left: isMe ? null : 120,
            top: 0,
            right: isMe ? 120 : null,
            child: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ))
      ],
      overflow: Overflow.visible,
    );
  }
}
