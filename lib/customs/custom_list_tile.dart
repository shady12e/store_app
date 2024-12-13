import 'package:flutter/material.dart';
import 'package:store_app_2/constens.dart';
import 'package:store_app_2/screens/view_categorys_screen.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile({
    super.key,
    required this.categoryName,
    required this.image,
  });
  final String categoryName;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        elevation: 10,
        child: ListTile(
          tileColor: Colors.white,
          leading: CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: 30,
          ),
          title: Text(categoryName),
          subtitle: Text(categoryName),
          trailing: const Icon(
            Icons.arrow_forward,
            color: KPriymryColor,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => categorysScreenView(
                  categoryNmae: categoryName,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
