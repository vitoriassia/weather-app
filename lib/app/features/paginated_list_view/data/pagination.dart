import 'dart:math';

import 'package:flutter/foundation.dart';

class Pagination<T> {
  final int pageSize;

  int? totalItems;

  int _currentPage = 1;
  List<T> _currentList = [];
  bool _hasReachedEndOfResult = false;

  Pagination.initial({this.pageSize = 20});

  Pagination.filter(List<T> list, int currentPage, {this.pageSize = 0}) {
    refresh(list: list, page: currentPage);
  }

  void refresh({required List<T> list, required int page}) {
    if (page <= 1) _currentList = [];

    _hasReachedEndOfResult = list.isEmpty;

    if (!_hasReachedEndOfResult) {
      _currentList += list;
      _currentPage = page;
    }
  }

  void reset() {
    _currentList.clear();
    _currentPage = 1;
    _hasReachedEndOfResult = false;
  }

  List<T> getListSectionFromPage(int page) {
    if (page < 1 || page > _currentPage) return [];

    try {
      final start = page * pageSize;
      final end = min(start + pageSize, _currentList.length);
      return _currentList.getRange(start, end).toList();
    } catch (e) {
      if (kDebugMode) print(e.toString());
      return [];
    }
  }

  List<T> get listSectionFromCurrentPage =>
      getListSectionFromPage(_currentPage);

  int get currentPage => _currentPage;

  List<T> get currentList => _currentList;

  bool get hasReachedEndOfResult => _hasReachedEndOfResult;

  int get numOfResults => _currentList.length;
}
