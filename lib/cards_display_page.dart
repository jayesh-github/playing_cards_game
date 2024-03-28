import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:playing_cards_game/cards_widget.dart';

class CardsDisplayPage extends StatefulWidget {
  const CardsDisplayPage({super.key});

  @override
  State<CardsDisplayPage> createState() => _CardsDisplayPageState();
}

class _CardsDisplayPageState extends State<CardsDisplayPage> {
  // List to hold the cards
  late List<int> cards;
  int? startIndex;
  int? indexAfterDrag;
  Suit suit = Suit.spades;
  CardValue value = CardValue.eight;

  @override
  void initState() {
    super.initState();
    initializeCardOrder();
  }

  void initializeCardOrder() {
    List<int> cards = List.generate(13, (index) => index);
    cards.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    var rightPadding = MediaQuery.of(context).size.width * 0.10;
    var leftPadding = MediaQuery.of(context).size.width * 0.30;
    return Container(
      decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/backgound.jfif'),
            fit: BoxFit.fitWidth,
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
              children: List.generate(cards.length, (index) {
                return Positioned(
                  left: index * 17.0, // Adjust the overlap distance as needed
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
                      builder: (BuildContext context, List<int?> candidateData,
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
              }),
            ),
          );
        }),
      ),
    );
  }
}
