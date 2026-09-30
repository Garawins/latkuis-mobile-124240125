import 'package:flutter/material.dart';
import 'package:latkuis/models/data.dart';
import 'package:latkuis/screens/detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Semua';

  @override
  Widget build(BuildContext context) {
    final filteredMenus = selectedCategory == 'Semua'
        ? menus
        : menus.where((menu) => menu.category == selectedCategory).toList();

    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: DropdownButton<String>(
            value: selectedCategory,
            items: ['Semua', 'Mie', 'Dimsum', 'Minuman']
                .map((category) => DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    ))
                .toList(),
            onChanged: (category) {
              if (category != null) {
                setState(() => selectedCategory = category);
              }
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredMenus.length,
            itemBuilder: (context, index) {
              final menu = filteredMenus[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(menu: menu),
                    ),
                  );
                },
                title: Text(menu.name),
                subtitle: Text("Rp ${menu.price}"),
                leading: Image.network(menu.image),
                trailing: Icon(Icons.arrow_forward),
              );
            },
          ),
        ),
      ],
    );
  }
}
