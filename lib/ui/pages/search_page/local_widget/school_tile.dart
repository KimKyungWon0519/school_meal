import 'package:flutter/material.dart';

class SchoolTile extends StatelessWidget {
  final String schoolName;

  const SchoolTile({
    Key? key,
    required this.schoolName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(schoolName),
      ),
    );
  }
}
