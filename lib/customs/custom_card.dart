import 'package:flutter/material.dart';
import 'package:store_app_2/model/prodect_model.dart';
import 'package:store_app_2/provider/card_provider.dart';
import 'package:store_app_2/provider/favorite_provider.dart';

class CustomCard extends StatefulWidget {
  final ProdectModel prodectModel;

  CustomCard({
    super.key,
    required int index,
    required this.prodectModel,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isfavorite = false;
  bool isCard = false;
  
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final provider2 = CardProvider.of(context);

    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'UpdateScreen' , arguments: widget.prodectModel);
        },
        child: Container(
          width: 240,
          height: 240,
          child: Stack(
            children: [
              Card(
                elevation: 10,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.prodectModel.title,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.prodectModel.price} \$',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                provider.toggleFavorite(widget.prodectModel);
                                setState(() {
                                  isfavorite = !isfavorite;
                                });
                              },
                              icon: Icon(
                                provider.isExsit(widget.prodectModel)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isfavorite ? Colors.red : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 3,
                right: 2,
                child: Image.network(
                  widget.prodectModel.image,
                  height: 120,
                  width: 30,

                  //
                ),
              ),
              IconButton(
                onPressed: () {
                  provider2.toggleCard(widget.prodectModel);
                  setState(() {
                    isCard = !isCard;
                  });
                },
                icon: provider2.isExsit(widget.prodectModel)
                    ? Icon(Icons.add_circle_outline_outlined)
                    : Icon(Icons.add_circle_outline_outlined),
                color: isCard ? Colors.black : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
