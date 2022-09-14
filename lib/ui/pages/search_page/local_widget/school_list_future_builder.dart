import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_meal/controllers/search_provider.dart';
import 'package:school_meal/model/school_model.dart';
import 'package:school_meal/ui/pages/search_page/local_widget/school_list.dart';
import 'package:school_meal/ui/widget/center_circular_loading.dart';

class SchoolListFutureBuilder extends StatelessWidget {
  const SchoolListFutureBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SchoolSearchProvider schoolSearchProvider =
        Provider.of<SchoolSearchProvider>(context);

    return FutureBuilder<List<SchoolModel>>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<SchoolModel> schoolList = snapshot.data!;

          return SchoolList(schoolList: schoolList);
        } else {
          return const CenterCircularLoading();
        }
      },
      future: schoolSearchProvider.getAllSchool(),
    );
  }
}
