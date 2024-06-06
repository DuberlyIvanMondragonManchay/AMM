import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FAQ',
      home: Scaffold(
        appBar: AppBar(title: Text("Duberly Ivan Mondragón Manchay")),
        body: ListView.builder(
          itemCount: faqList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network(
                faqList[index].imageUrl,
                width: 40, // Ajusta el ancho de la imagen según tus preferencias
                height: 40, // Ajusta el alto de la imagen según tus preferencias
              ),
              title: Text(faqList[index].title),
              subtitle: Text(faqList[index].description),
              onTap: () {
                // Acción al hacer tap en el ListTile 1
              },
            );
          },
        ),
      ),
    );
  }
}

class FAQItem {
  final String title;
  final String description;
  final String imageUrl;

  FAQItem({required this.imageUrl, required this.title, required this.description});
}

List<FAQItem> faqList = [
FAQItem(
    imageUrl: 'https://w7.pngwing.com/pngs/56/985/png-transparent-pizza-margherita-sushi-pizza-pizza-delivery-pizza-thumbnail.png',
    title: "Pizza",
    description: "hawaiana"
  ),
  FAQItem(
    imageUrl: 'https://w7.pngwing.com/pngs/739/553/png-transparent-hamburger-veggie-burger-chicken-sandwich-fast-food-hamburger-burger-burger-sandwich-food-recipe-cheeseburger-thumbnail.png',
    title: "Hamburguesa",
    description: "Rica de Macdonals"
  ),
  FAQItem(
    imageUrl: 'https://w1.pngwing.com/pngs/940/1013/png-transparent-coca-cola-fizzy-drinks-cocacola-diet-coke-cocacola-zero-sugar-cocacola-life-coca-cola-drink-supermarket.png',
    title: "Gaseosa",
    description: "Cocacola"
  ),
];
