import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int x = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          padding: EdgeInsets.all(2),
          child: GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 64,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
              ),
              itemBuilder: ((context, index) {
                if (index % 8 == 0) {
                  x = x == 0 ? 1 : 0;
                }
                return Square(
                  color: (index + x) % 2 == 0 ? Colors.black : Colors.white,
                  index: index,
                );
              })),
        ),
      ),
    );
  }
}

class Square extends StatefulWidget {
  const Square({super.key, required this.color, required this.index});

  final Color color;
  final int index;

  @override
  State<Square> createState() => _SquareState();
}

class _SquareState extends State<Square> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Taped index ${widget.index}");
      },
      child: Stack(
        children: [
          Container(
            color: widget.color,
          ),
        ],
      ),
    );
  }
}
