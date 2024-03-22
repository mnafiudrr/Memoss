import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Text Field Focus',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (myFocusNode.hasFocus) {
          myFocusNode.unfocus();
        } else {
          myFocusNode.requestFocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Memoss', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.black,
            centerTitle: true,
          ),
          body: Container(
            padding: const EdgeInsets.all(16),
            color: Colors.black,
            child: Column(
              children: [
                TextField(
                  focusNode: myFocusNode,
                  maxLines: null,
                  textInputAction: TextInputAction.newline,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none
                  ),
                  // decoration: InputDecoration(
                  //   focusedBorder: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(10.0),
                  //     borderSide: BorderSide(color: Colors.white),
                  //   ),
                  //   enabledBorder: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(10.0),
                  //     borderSide: BorderSide(color: Colors.white),
                  //   ),
                  //   labelText: 'Enter Text',
                  //   labelStyle: TextStyle(color: Colors.white),
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
