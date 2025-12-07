import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dashboard_provider.dart';


class DataNotFoundWidget extends StatelessWidget {
  const DataNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
        builder: (context, provider, child) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  provider.message,
                  textAlign: TextAlign.center,
                ),
                if(provider.dataList.isEmpty)
                  ElevatedButton(
                      onPressed: () {
                        Provider.of<DashboardProvider>(context,
                            listen: false)
                            .getFileList();
                      },
                      child: Text(
                        "Reload",
                      )
                  )

              ],
            ),
          );
        });
  }
}
