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
              leading: Icon(faqList[index].icon),
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
  final IconData icon;

  FAQItem({required this.icon, required this.title, required this.description});
}

List<FAQItem> faqList = [
  FAQItem(icon:Icons.home,title: "Home", description: "home"),
  FAQItem(icon:Icons.person,title: "Profile", description: "profile"),
  FAQItem(icon:Icons.chat,title: "Chat", description: "chat"),
];
