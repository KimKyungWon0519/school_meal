import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_meal/controllers/search_provider.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: '학교 이름을 입력해주세요',
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onSubmitted: (value) =>
          context.read<SchoolSearchProvider>().schoolName = value,
    );
  }
}
