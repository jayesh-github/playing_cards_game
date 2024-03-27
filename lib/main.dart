import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:playing_cards_game/cards_display_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return MaterialApp(
      title: 'Rummy App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CardsDisplayPage(),
    );
  }
}

// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Draggable Cards',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: DraggableCardsPage(),
//     );
//   }
// }
//
// class DraggableCardsPage extends StatefulWidget {
//   @override
//   _DraggableCardsPageState createState() => _DraggableCardsPageState();
// }
//
// class _DraggableCardsPageState extends State<DraggableCardsPage> {
//   List<Offset> cardOffsets = [];
//   List<Color> cardColors = [];
//   int cardCount = 13;
//   Random random = Random();
//
//   @override
//   void initState() {
//     super.initState();
//     for (int i = 0; i < cardCount; i++) {
//       cardOffsets.add(Offset(0.0, 0.0));
//       cardColors.add(_getRandomColor());
//     }
//   }
//
//   Color _getRandomColor() {
//     return Color.fromRGBO(
//       random.nextInt(256),
//       random.nextInt(256),
//       random.nextInt(256),
//       1.0,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Draggable Cards'),
//       ),
//       body: Stack(
//         children: List.generate(cardCount, (index) {
//           return Positioned(
//             left: cardOffsets[index].dx,
//             top: cardOffsets[index].dy,
//             child: Draggable(
//               child: Expanded(child: _buildCard(index)),
//               feedback: _buildCard(index),
//               childWhenDragging: Container(),
//               onDraggableCanceled: (velocity, offset) {
//                 setState(() {
//                   cardOffsets[index] = offset;
//                 });
//               },
//             ),
//           );
//         }),
//       ),
//     );
//   }
//
//   Widget _buildCard(int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           cardColors[index] = _getRandomColor();
//         });
//       },
//       child: Container(
//         width: 100,
//         height: 150,
//         decoration: BoxDecoration(
//           color: cardColors[index],
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         child: Center(
//           child: Text(
//             'Card ${index + 1}',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
