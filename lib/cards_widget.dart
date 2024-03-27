import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

class CardsWidget extends StatefulWidget {
  final int index;
  final VoidCallback? changeColor;
  final bool callbackCalled;
  const CardsWidget(
      {super.key,
      required this.index,
      this.changeColor,
      this.callbackCalled = false});

  @override
  State<CardsWidget> createState() => _CardsWidgetState();
}

class _CardsWidgetState extends State<CardsWidget> {
  Color cardColor = Colors.blueAccent;
  Suit suit = Suit.hearts;
  CardValue value = CardValue.seven;

  @override
  Widget build(BuildContext context) {
    CardValue cardValue;
    switch (widget.index % 13) {
      case 0:
        cardValue = CardValue.ace;
        break;
      case 1:
        cardValue = CardValue.two;
        break;
      case 2:
        cardValue = CardValue.three;
        break;
      case 3:
        cardValue = CardValue.four;
        break;
      case 4:
        cardValue = CardValue.five;
        break;
      case 5:
        cardValue = CardValue.six;
        break;
      case 6:
        cardValue = CardValue.seven;
        break;
      case 7:
        cardValue = CardValue.eight;
        break;
      case 8:
        cardValue = CardValue.nine;
        break;
      case 9:
        cardValue = CardValue.ten;
        break;
      case 10:
        cardValue = CardValue.jack;
        break;
      case 11:
        cardValue = CardValue.queen;
        break;
      case 12:
        cardValue = CardValue.king;
        break;
      default:
        cardValue = CardValue.ace;
    }
    return SizedBox(
      width: 70,
      height: 100,
      child: PlayingCardView(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        card: PlayingCard(suit, cardValue),
      ),
    );
  }
}
