import 'package:flutter/material.dart';
import 'package:acnh/icon_list_view_page.dart';
import 'package:acnh/presentation/theme/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.buttons});
  final List<HomeButton> buttons;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ACNH Wiki'),
      ),
      body: Center(
        child: Column(
          children: [
            for (final button in widget.buttons)
              TextButton(
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => IconListViewPage(
                        endpoint: button.endpoint,
                        title: button.text,
                      ),
                    ),
                  );
                },
                child: Text(button.text),
              ),
          ],
        ),
      ),
    );
  }
}

class HomeButton {
  HomeButton({required this.text, required this.endpoint});

  final String text;
  final String endpoint;
}
