import 'package:flutter/material.dart';
import 'package:store_app_2/constens.dart';
import 'package:store_app_2/customs/custom_list_tile.dart';
import 'package:store_app_2/service/all_category_service.dart';

class categoryScreen extends StatelessWidget {
  categoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: KbackgroundColor,
          title: Text(
            'Categories',
            style: TextStyle(
                color: KPriymryColor, fontFamily: Kprimaryfont, fontSize: 30),
          ),
        ),
        backgroundColor: KbackgroundColor,
        body: FutureBuilder<List<String>>(
          future: AllCategoryService().getAllCategory(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<String> prodects = snapshot.data!;
              List<String> Images = [
                'assets/images/tec.jpg',
                'assets/images/jelej.jpg',
                'assets/images/mens2.jpg',
                'assets/images/women2.jpg'
              ];
              return ListView.builder(
                  itemCount: prodects.length,
                  itemBuilder: (context, index) {
                    return CustomListTile(
                      categoryName: prodects[index],
                      image: Images[index],
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
