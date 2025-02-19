import 'package:flutter/material.dart';

class ChatbotWidget extends StatefulWidget {
  @override
  _ChatbotWidgetState createState() => _ChatbotWidgetState();
}

class Message {
  final String text;
  final bool isUser;
  Message(this.text, this.isUser);
}

class _ChatbotWidgetState extends State<ChatbotWidget> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Add welcome message
    _addBotMessage("Hello! I'm your RecycleIT assistant. How can I help you today? You can ask me about:\n\n• Waste segregation\n• Recycling tips\n• Rewards program\n• Using the scanner");
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _addUserMessage(_controller.text);
        _getBotResponse(_controller.text);
        _controller.clear();
      });
      // Scroll to bottom after message is sent
      Future.delayed(Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  void _addUserMessage(String message) {
    setState(() {
      _messages.add(Message(message, true));
    });
  }

  void _addBotMessage(String message) {
    setState(() {
      _messages.add(Message(message, false));
    });
  }

  void _getBotResponse(String message) {
    String response = '';
    message = message.toLowerCase();

    if (message.contains('scanner') || message.contains('scan')) {
      response = "To use the scanner, click on the Scanner icon in the navigation bar. Point your camera at the waste item, and I'll help identify if it's recyclable!";
    } else if (message.contains('reward')) {
      response = "You can earn points by recycling items correctly! Check your rewards in the Rewards section. The more you recycle, the more points you earn!";
    } else if (message.contains('segregate') || message.contains('separate')) {
      response = "Here are some basic waste segregation tips:\n\n• Green bin - Biodegradable waste\n• Blue bin - Recyclable waste\n• Red bin - Hazardous waste\n• Black bin - Other waste";
    } else if (message.contains('recycle') || message.contains('recycling')) {
      response = "Recycling tips:\n\n• Clean items before recycling\n• Remove labels when possible\n• Flatten cardboard boxes\n• Keep different materials separate";
    } else {
      response = "I'm here to help with recycling! You can ask me about:\n\n• How to use the scanner\n• Waste segregation\n• Recycling tips\n• Rewards program";
    }

    _addBotMessage(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: message.isUser ? Colors.green : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      message.text,
                      style: TextStyle(
                        color: message.isUser ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Ask me about recycling...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.all(12.0),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                SizedBox(width: 8.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
