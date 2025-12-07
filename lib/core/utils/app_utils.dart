import 'package:intl/intl.dart';

String getFileNameFromPath(String? path) {
  return path?.split('/').last ?? "No Tile";
}

String formatEpoch(double? seconds) {
  if (seconds == null || seconds < 0) return "00:00";
  final dt = DateTime.fromMillisecondsSinceEpoch(
    (seconds * 1000).toInt(),
    isUtc: true,
  ).toLocal();

  return DateFormat('dd MMM yyyy, hh:mm:ss a').format(dt);
}
