import 'package:flutter/material.dart';
import 'package:store_app_2/constens.dart';
import 'package:store_app_2/provider/favorite_provider.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalListOfProdect = provider.favorites;
    return Scaffold(
      backgroundColor: KbackgroundColor,
      appBar: AppBar(
        backgroundColor: KbackgroundColor,
        centerTitle: true,
        title: Text(
          'Favorite',
          style: TextStyle(
            color: KPriymryColor,
            fontFamily: Kprimaryfont,
            fontSize: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: finalListOfProdect.length,
                itemBuilder: (context, index) {
                  final favoriteItems = finalListOfProdect[index];
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Material(
                          elevation: 10,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  width: 60,
                                  height: 85,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Image.network(favoriteItems.image),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        favoriteItems.title,
                                        softWrap: true,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        favoriteItems.category,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '\$${favoriteItems.price}',
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 53,
                        right: 35,
                        child: GestureDetector(
                          onTap: () {
                            finalListOfProdect.removeAt(index);
                            setState(() {});
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 29,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
