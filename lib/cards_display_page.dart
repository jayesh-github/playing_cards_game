import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:playing_cards_game/cards_widget.dart';

class CardsDisplayPage extends StatefulWidget {
  const CardsDisplayPage({super.key});

  @override
  State<CardsDisplayPage> createState() => _CardsDisplayPageState();
}

class _CardsDisplayPageState extends State<CardsDisplayPage> {
  List<int> cards = List.generate(13, (index) => index);
  // List to hold the cards
  int? startIndex;
  int? indexAfterDrag;
  Suit suit = Suit.spades;
  CardValue value = CardValue.eight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cards.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    var rightPadding = MediaQuery.of(context).size.width * 0.10;
    var leftPadding = MediaQuery.of(context).size.width * 0.30;
    return Container(
      decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/rummy_background.jpg'),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            colors: [
              const Color(0xFF025043).withOpacity(0.5),
              const Color(0xFF235347),
            ],
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(builder: (context, constraints) {
          var isLandscape =
              MediaQuery.of(context).orientation == Orientation.landscape;
          print("object $isLandscape");
          return Center(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  top: 30, // Adjust the position as needed
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                  child: DragTarget<int>(
                    onAccept: (int draggedIndex) {
                      setState(() {
                        // Handle card dropping here
                        print("Card dropped on drop zone");
                        print("FFFF $draggedIndex");
                      });
                    },
                    builder: (BuildContext context, List<int?> candidateData,
                        List<dynamic> rejectedData) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200, // Adjust the height as needed
                        color: Colors.blue.withOpacity(0.5),
                        child: Center(
                          child: Text(
                            'Drop Zone',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ...List.generate(cards.length, (index) {
                  return Positioned(
                    left: index * 20.0, // Adjust the overlap distance as needed
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: rightPadding, left: leftPadding, bottom: 20),
                      child: DragTarget<int>(
                        onAccept: (int draggedIndex) {
                          setState(() {
                            // Reorder the cards when dropped
                            cards.remove(draggedIndex);
                            cards.insert(index, draggedIndex);
                          });
                        },
                        builder: (BuildContext context,
                            List<int?> candidateData,
                            List<dynamic> rejectedData) {
                          return Draggable(
                            childWhenDragging: CardsWidget(
                              index: cards[index],
                            ),
                            onDragEnd: (v) {
                              print("DDD ${v.offset}");
                            },
                            data: cards[index], // Use the card value as data
                            feedback: CardsWidget(index: cards[index]),
                            onDragStarted: () {
                              setState(() {
                                startIndex = index;
                              });
                            },
                            onDragCompleted: () {
                              assert(startIndex != null);
                              print("");
                            },
                            child: CardsWidget(index: cards[index]),
                          );
                        },
                      ),
                    ),
                  );
                })
              ],
            ),
          );
        }),
      ),
    );
  }
}
