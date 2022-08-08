import 'package:flutter/material.dart';

class LogScreen extends StatefulWidget {
  final List<String> logMessages;

  const LogScreen({Key? key, required this.logMessages}) : super(key: key);

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  List<String> logMessages = [];

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    logMessages = widget.logMessages;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black54,
      ),
      child: ListView.builder(
        reverse: true,
        controller: scrollController,
        padding: const EdgeInsets.all(8),
        itemCount: logMessages.length,
        itemBuilder: ((_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(logMessages[logMessages.length - 1 - index]),
          );
        }),
      ),
    );
  }
}
