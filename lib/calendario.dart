import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ti3app/asesor_data_page.dart';
void main() {
  runApp(Calendar());
}

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeCalendar(),
    );
  }
}

class HomeCalendar extends StatefulWidget {
  const HomeCalendar({Key? key});

  @override
  State<HomeCalendar> createState() => _HomeState();
}

class _HomeState extends State<HomeCalendar> with TickerProviderStateMixin {
  late DateTime today;
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    today = DateTime.now();
  }
/*
  void _navigateToAsesorDetailPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AsesorDetailPage(
          selectedDate: today,
          selectedTime: selectedTime, asesorData: {},
        ),
      ),
    );
  }
*/


  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  void _showTimePickerDialog(BuildContext context) async {
    TimeOfDay selectedTime = TimeOfDay.now();

    selectedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    ) ?? selectedTime;

    _showSnackBar(context, 'Hora seleccionada: $selectedTime');
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calendario de Eventos',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          Text('Día seleccionado = ' + today.toString().split(" ")[0]),
          Container(
            child: TableCalendar(
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              rowHeight: 43,
              focusedDay: today,
              firstDay: DateTime.utc(2010, 1, 1),
              lastDay: DateTime.utc(2035, 12, 30),
              onDaySelected: _onDaySelected,
              eventLoader: (day) {
                // No hay eventos para mostrar
                return [];
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => _showTimePickerDialog(context),
            child: const Text('Seleccionar Hora'),
          ),
          ElevatedButton(
             onPressed: () => AsesorDetailPage,
            child: Text('Ir a Horas agendadas'),
          ),
        ],
      ),
    );
  }
}
