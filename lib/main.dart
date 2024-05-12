import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TODO'S",
      theme: ThemeData(
        colorScheme: ColorScheme.dark(primary: Colors.orange),
      ),
      home: const MyHomePage(title: "TODO'S APP"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _taskList = <String>[];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _addTask(String title) {
    setState(() {
      _taskList.add(title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter task',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // Add task to the list
                    if (_textController.text.isNotEmpty) {
                      _addTask(_textController.text);
                      _textController.clear();
                    }
                  },
                ),
              ),
              controller: _textController,
            ),
            const SizedBox(height: 16.0),
            //Divider(color: Colors.grey),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _taskList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_taskList[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
/*       floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), */
    );
  }

  final TextEditingController _textController = TextEditingController();
}
