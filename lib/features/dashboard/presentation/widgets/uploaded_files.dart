import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_utils.dart';
import '../provider/dashboard_provider.dart';

class UploadedFiles extends StatelessWidget {

  const UploadedFiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
        builder: (context, provider, child) {
          return Expanded(
            child: ListView.builder(
              itemCount: provider.dataList.length,
              itemBuilder: (context, index) {
                final file = provider.dataList[index];
                return Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),

                  child: ListTile(
                    leading: const Icon(Icons.insert_drive_file),
                    title: Text(getFileNameFromPath(file.appLink)),
                    subtitle: Text('Uploaded on: ${formatEpoch(file.entryDate)}'),
                  ),
                );
              },
            ),
          );
        });
  }
}
