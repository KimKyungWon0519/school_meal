import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_meal/controllers/search_provider.dart';
import 'package:school_meal/ui/pages/search_page/local_widget/school_list_future_builder.dart';
import 'package:school_meal/ui/pages/search_page/local_widget/search_panel.dart';
import 'package:school_meal/ui/widget/base_margin_container.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BaseMarginContainer(
          child: Column(
            children: const [
              SearchPanel(),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SchoolListFutureBuilder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
