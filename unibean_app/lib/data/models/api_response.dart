import 'package:equatable/equatable.dart';

class ApiResponse<T> extends Equatable {
  final T result;
  final int currentPage;
  final int pageCount;
  final int pageSize;
  final int rowCount;
  final int totalCount;

  ApiResponse(
      { required this.result,
      required this.currentPage,
      required this.pageCount,
      required this.pageSize,
      required this.rowCount,
      required this.totalCount});

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, Function(List<dynamic>) create) {
    return ApiResponse<T>(
        result: create(json['result']),
        currentPage: json['currentPage'],
        pageCount: json['pageCount'],
        pageSize: json['pageSize'],
        rowCount: json['rowCount'],
        totalCount: json['totalCount']);
  }
  Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = new Map<String, dynamic>();
        data['result'] = this.result;
        data['currentPage'] = this.currentPage;
        data['pageCount'] = this.pageCount;
        data['pageSize'] = this.pageSize;
        data['rowCount'] = this.rowCount;
        data['totalCount'] = this.totalCount;
    return data;
  }
  @override
  List<Object?> get props => [
        this.result,
        this.currentPage,
        this.pageCount,
        this.pageSize,
        this.rowCount,
        this.totalCount
      ];
}
