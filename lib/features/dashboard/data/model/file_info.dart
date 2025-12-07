class FileInfo {
  final String? remarks;
  final int? entryBy;
  final double? entryDate;
  final int? updateBy;
  final double? updateDate;
  final int? branchId;
  final int? companyId;
  final int? appId;
  final String? appCode;
  final String? appName;
  final String? appDesc;
  final String? appLogo;
  final String? appType;
  final String? appPlatform;
  final String? appVersionName;
  final int? appVersionCode;
  final String? updateType;
  final String? appLink;
  final int? isActive;

  FileInfo({
    this.remarks,
    this.entryBy,
    this.entryDate,
    this.updateBy,
    this.updateDate,
    this.branchId,
    this.companyId,
    this.appId,
    this.appCode,
    this.appName,
    this.appDesc,
    this.appLogo,
    this.appType,
    this.appPlatform,
    this.appVersionName,
    this.appVersionCode,
    this.updateType,
    this.appLink,
    this.isActive,
  });

  factory FileInfo.fromJson(Map<String, dynamic> json) {
    return FileInfo(
      remarks: json['remarks'],
      entryBy: json['entryBy'],
      entryDate: (json['entryDate'] as num?)?.toDouble(),
      updateBy: json['updateBy'],
      updateDate: (json['updateDate'] as num?)?.toDouble(),
      branchId: json['branchId'],
      companyId: json['companyId'],
      appId: json['appId'],
      appCode: json['appCode'],
      appName: json['appName'],
      appDesc: json['appDesc'],
      appLogo: json['appLogo'],
      appType: json['appType'],
      appPlatform: json['appPlatform'],
      appVersionName: json['appVersionName'],
      appVersionCode: json['appVersionCode'],
      updateType: json['updateType'],
      appLink: json['appLink'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'remarks': remarks,
      'entryBy': entryBy,
      'entryDate': entryDate,
      'updateBy': updateBy,
      'updateDate': updateDate,
      'branchId': branchId,
      'companyId': companyId,
      'appId': appId,
      'appCode': appCode,
      'appName': appName,
      'appDesc': appDesc,
      'appLogo': appLogo,
      'appType': appType,
      'appPlatform': appPlatform,
      'appVersionName': appVersionName,
      'appVersionCode': appVersionCode,
      'updateType': updateType,
      'appLink': appLink,
      'isActive': isActive,
    };
  }
}
