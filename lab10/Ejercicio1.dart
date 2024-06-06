import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Eventos deportivos'),
        ),
        body: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(events[index].imageUrl),
                    SizedBox(height: 10),
                    Text(
                      events[index].name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(events[index].description),
                    SizedBox(height: 5),
                    Text('Date: ${events[index].date}'),
                    Text('Location: ${events[index].location}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


class SportEvent {
  final String imageUrl;
  final String name;
  final String description;
  final String date;
  final String location;

  SportEvent({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.date,
    required this.location,
  });
}

List<SportEvent> events = [
  SportEvent(
    imageUrl: 'https://cdn.britannica.com/91/187891-050-C4FADFEE/University-of-Alabama-players-celebrate-NCAA-football-championship-2016.jpg',
    name: 'Campeonato de Fútbol',
    description: 'El campeonato anual de fútbol.',
    date: '2024-06-15',
    location: 'Estadio A, Ciudad X',
  ),
  SportEvent(
    imageUrl: 'https://s3.sportstatics.com/relevo/www/multimedia/202310/02/media/cortadas/finaleswnba-RfwpewLwV27FByFmizDBTON-1200x648@Relevo.jpg',
    name: 'Finales de Baloncesto',
    description: 'El partido final de la liga de baloncesto.',
    date: '2024-07-20',
    location: 'Arena B, Ciudad Y',
  ),
  SportEvent(
    imageUrl: 'https://img.rtve.es/imagenes/maraton-boston-2024-directo-ganadores/01713198928198.jpg',
    name: 'Maratón 2024',
    description: 'Un evento de maratón en toda la ciudad.',
    date: '2024-08-10',
    location: 'Centro de la Ciudad, Ciudad Z',
  ),
];
