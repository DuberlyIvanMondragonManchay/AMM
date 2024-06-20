import 'package:flutter/material.dart';
import 'package:lab15/TeamDatabase.dart';
import 'package:lab15/team.dart'; // Asegúrate de importar el modelo TeamModel

class TeamDetailsView extends StatefulWidget {
  const TeamDetailsView({Key? key, this.teamId}) : super(key: key);
  final int? teamId;

  @override
  State<TeamDetailsView> createState() => _TeamDetailsViewState();
}

class _TeamDetailsViewState extends State<TeamDetailsView> {
  TeamDatabase teamDatabase = TeamDatabase.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController lastDateController = TextEditingController();

  late TeamModel team;
  bool isLoading = false;
  bool isNewTeam = false;
  DateTime? selectedDate;

  @override
  void initState() {
    refreshTeam();
    super.initState();
  }

  /// Obtiene el equipo desde la base de datos y actualiza el estado. Si teamId es null, indica que se está creando un nuevo equipo.
  refreshTeam() {
    if (widget.teamId == null) {
      setState(() {
        isNewTeam = true;
      });
      return;
    }
    teamDatabase.read(widget.teamId!).then((value) {
      setState(() {
        team = value;
        nameController.text = team.name;
        yearController.text = team.year.toString();
        selectedDate = team.lastDate;
        // Formatear la fecha solo como fecha (sin hora)
        lastDateController.text = "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}";
      });
    });
  }

  /// Crea un nuevo equipo si isNewTeam es true, de lo contrario, actualiza el equipo existente.
  createTeam() {
    if (nameController.text.isEmpty || yearController.text.isEmpty || selectedDate == null) {
      // Muestra un mensaje de error si los campos están vacíos
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Todos los campos son obligatorios')),
      );
      return;
    }

    int year;
    try {
      year = int.parse(yearController.text);
    } catch (e) {
      // Muestra un mensaje de error si el año no es un número válido
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('El año debe ser un número válido')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    final model = TeamModel(
      name: nameController.text,
      year: year,
      lastDate: selectedDate!,
    );

    if (isNewTeam) {
      teamDatabase.create(model);
    } else {
      model.id = team.id;
      teamDatabase.update(model);
    }

    setState(() {
      isLoading = false;
    });

    Navigator.pop(context); // Navega de regreso a la pantalla anterior
  }

  /// Elimina el equipo de la base de datos y navega de regreso a la pantalla anterior.
  deleteTeam() {
    teamDatabase.delete(team.id!);
    Navigator.pop(context);
  }

  /// Muestra el selector de fecha y actualiza el campo de fecha seleccionada.
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        // Formatear la fecha solo como fecha (sin hora)
        lastDateController.text = "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(221, 156, 154, 255),
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                // Toggle favorite logic here if needed
              });
            },
            icon: const Icon(Icons.star_border, color: Colors.white),
          ),
          Visibility(
            visible: !isNewTeam,
            child: IconButton(
              onPressed: deleteTeam,
              icon: const Icon(Icons.delete, color: Colors.white),
            ),
          ),
          IconButton(
            onPressed: createTeam,
            icon: const Icon(Icons.save, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    TextField(
                      controller: nameController,
                      cursorColor: Colors.white,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Team Name',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: yearController,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.white,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Year Established',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: lastDateController,
                      readOnly: true,
                      onTap: () => _selectDate(context),
                      cursorColor: Colors.white,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Last Date',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
