import 'package:flutter/material.dart';
import 'package:project01/pages/blocoDeNota/blocoNotasModel.dart';
import 'package:project01/pages/outros/genericos.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarioPage extends StatefulWidget {
  const CalendarioPage({super.key});

  @override
  State<CalendarioPage> createState() => _CalendarioPageState();
}

class _CalendarioPageState extends State<CalendarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarTopo(title: "Calendário"),
        drawer: MenuLateral(),
        bottomNavigationBar: AppBarBaixo(),
        body: TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
          onDaySelected: (selectedDay, focusedDay) {
                                      Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => BlocoNotasModel(name:("${selectedDay.day} / ${selectedDay.month}") ,texto: "",)));
          },
        ));
  }
}
