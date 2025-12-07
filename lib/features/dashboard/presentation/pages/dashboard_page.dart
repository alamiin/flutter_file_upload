import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dashboard_provider.dart';
import '../widgets/action_widget.dart';
import '../widgets/data_not_found_widget.dart';
import '../widgets/loader.dart';
import '../widgets/uploaded_files.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DashboardProvider>(context, listen: false).getFileList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Page"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(child: Consumer<DashboardProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                actionWidget(),
                Expanded(
                    child: provider.isLoading
                        ? const Center(
                      child: Loader(),
                    )
                        : provider.dataList.isNotEmpty
                        ? UploadedFiles()
                        : DataNotFoundWidget()),
              ],
            );
          },
        )),
      ),
    );
  }
}
