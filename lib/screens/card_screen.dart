import 'package:flutter/material.dart';
import 'package:store_app_2/constens.dart';
import 'package:store_app_2/provider/card_provider.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    final provider2 = CardProvider.of(context);
    final finalListOfCard = provider2.cardprodect;

    return Scaffold(
      backgroundColor: KbackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: KbackgroundColor,
        title: const Text(
          'Card',
          style: TextStyle(
            fontFamily: Kprimaryfont,
            color: KPriymryColor,
            fontSize: 30,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: finalListOfCard.length,
        itemBuilder: (context, index) {
          final cardItems = finalListOfCard[index];
          dynamic cardId = cardItems.id;
          int isCount = provider2.getCount(cardId);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 10,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          // ignore: sized_box_for_whitespace
                          child: Container(
                            height: 100,
                            child: Image.network(
                              cardItems.image,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                cardItems.title,
                                maxLines: 1,
                                softWrap: true,
                                style: const TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                cardItems.description,
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              provider2.decrementCount(cardId);
                            });
                          },
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                        Text(isCount.toString()),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                provider2.incrementCount(cardId);
                              });
                            },
                            icon: const Icon(Icons.add_circle_outline)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
