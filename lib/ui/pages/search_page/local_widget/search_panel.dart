import 'package:flutter/material.dart';
import 'package:school_meal/ui/pages/search_page/local_widget/cancel_button.dart';
import 'package:school_meal/ui/pages/search_page/local_widget/search_field.dart';

class SearchPanel extends StatelessWidget {
  const SearchPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: SearchField(),
        ),
        CancelButton(),
      ],
    );
  }
}
