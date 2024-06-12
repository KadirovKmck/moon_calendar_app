import 'package:flutter/material.dart';

class ActivityView extends StatefulWidget {
  const ActivityView({super.key});

  @override
  _ActivityViewState createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LegendRow(),
            Expanded(child: ActivityList()),
          ],
        ),
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const LegendItem({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 10, backgroundColor: color),
        const SizedBox(width: 4),
        Text(text),
      ],
    );
  }
}

class ActivityList extends StatelessWidget {
  const ActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ActivityTile(
          color: Colors.grey,
          title: "Деловые сделки",
          subtitle: "Нейтральный день",
        ),
        Divider(),
        ActivityTile(
          color: Colors.green,
          title: "Начало проекта",
          subtitle: "Хороший день",
          time: "9:00-11:40",
        ),
        Divider(),
        ActivityTile(
          color: Colors.grey,
          title: "Шопинг",
          subtitle: "Нейтральный день",
        ),
        Divider(),
        ActivityTile(
          color: Colors.red,
          title: "Творческая активность",
          subtitle: "Плохой день",
        ),
        Divider(),
        ActivityTile(
          color: Colors.green,
          title: "Спа-процедуры",
          subtitle: "Хороший день",
          time: "9:00-11:40",
        ),
        Divider(),
        ActivityTile(
          color: Colors.green,
          title: "Свидание",
          subtitle: "Хороший день",
          time: "9:00-11:40",
        ),
        Divider(),
        ActivityTile(
          color: Colors.grey,
          title: "Стрижка и покраска",
          subtitle: "Нейтральный день",
        ),
        Divider(),
        ActivityTile(
          color: Colors.red,
          title: "Маникюр",
          subtitle: "Плохой день",
        ),
      ],
    );
  }
}

class ActivityTile extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final String? time;

  const ActivityTile({
    super.key,
    required this.color,
    required this.title,
    required this.subtitle,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(radius: 10, backgroundColor: color),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: time != null ? Text(time!) : null,
    );
  }
}

class LegendRow extends StatelessWidget {
  const LegendRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LegendItem(color: Color(0xFFFFEB3B), text: "Лучший день"),
        LegendItem(color: Color(0xFF4CAF50), text: "Хороший день"),
        LegendItem(color: Color(0xFFF44336), text: "Плохой день"),
      ],
    );
  }
}
