import 'package:flutter/material.dart';
import 'package:school_meal/controllers/search_provider.dart';
import 'package:school_meal/model/school_model.dart';
import 'package:provider/provider.dart';

import 'school_tile.dart';

class SchoolList extends StatefulWidget {
  final List<SchoolModel> schoolList;

  const SchoolList({
    Key? key,
    required this.schoolList,
  }) : super(key: key);

  @override
  State<SchoolList> createState() => _SchoolListState();
}

class _SchoolListState extends State<SchoolList> {
  late ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    initScrollListener(context);

    return ListView.builder(
      controller: scrollController,
      itemBuilder: (context, index) {
        SchoolModel schoolModel = widget.schoolList[index];

        return SchoolTile(
          schoolName: schoolModel.schoolName,
        );
      },
      itemCount: widget.schoolList.length,
    );
  }

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController(
      keepScrollOffset: true,
    );
  }

  initScrollListener(BuildContext context) {
    scrollController.addListener(() {
      ScrollPosition position = scrollController.position;
      if (position.atEdge && position.pixels == position.maxScrollExtent) {
        context.read<SchoolSearchProvider>().increasePage();
      }
    });
  }
}
