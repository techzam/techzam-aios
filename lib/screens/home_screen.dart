import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/gpt_service.dart';
import '../widgets/voice_button.dart';
import '../widgets/message_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gpt = Provider.of<GPTService>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Zynix OS')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: gpt.messages.length,
              itemBuilder: (context, index) => MessageTile(
                isUser: gpt.messages[index]['role'] == 'user',
                text: gpt.messages[index]['content'],
              ),
            ),
          ),
          const VoiceButton(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
