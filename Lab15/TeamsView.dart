import 'package:flutter/material.dart';
import 'package:lab15/team.dart';
import 'package:lab15/TeamDatabase.dart';
import 'package:lab15/TeamDetailsView.dart';

class TeamsView extends StatefulWidget {
  const TeamsView({Key? key}) : super(key: key);

  @override
  State<TeamsView> createState() => _TeamsViewState();
}

class _TeamsViewState extends State<TeamsView> {
  TeamDatabase teamDatabase = TeamDatabase.instance;

  List<TeamModel> teams = [];

  @override
  void initState() {
    refreshTeams();
    super.initState();
  }

  @override
  void dispose() {
    // Cierra la base de datos al salir de la vista
    teamDatabase.close();
    super.dispose();
  }

  /// Obtiene todos los equipos desde la base de datos y actualiza el estado
  refreshTeams() {
    teamDatabase.readAll().then((value) {
      setState(() {
        teams = value;
      });
    });
  }

  /// Navega a la vista de detalles del equipo y actualiza los equipos después de la navegación
  goToTeamDetailsView({int? id}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TeamDetailsView(teamId: id)),
    );
    refreshTeams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('Teams', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      body: Center(
        child: teams.isEmpty
            ? const Text(
                'No Teams yet',
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
            : ListView.builder(
                itemCount: teams.length,
                itemBuilder: (context, index) {
                  final team = teams[index];
                  return GestureDetector(
                    onTap: () => goToTeamDetailsView(id: team.id),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Card(
                        color: Colors.deepPurple[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Year: ${team.year}',
                                style: const TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                team.name,
                                style: Theme.of(context).textTheme.headline6?.copyWith(
                                      color: Colors.deepPurple[900],
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Last Date: ${team.lastDate.toString().split(' ')[0]}',
                                style: const TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: goToTeamDetailsView,
        tooltip: 'Create Team',
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
