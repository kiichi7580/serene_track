import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/text_source.dart';

enum Category {
  all(allTx),
  exercise(exerciseTx),
  sleep(sleepTx),
  work(workTx);

  final String label;

  const Category(this.label);
}

Color categoryColor(Category category) {
  switch (category) {
    case Category.all:
      return sandwispColor;
    case Category.exercise:
      return yellowGreenColor;
    case Category.sleep:
      return mantisColor;
    case Category.work:
      return appleColor;
  }
}

Color categoryColor2(Category category) {
  switch (category) {
    case Category.all:
      return sandwispColor2;
    case Category.exercise:
      return yellowGreenColor2;
    case Category.sleep:
      return mantisColor2;
    case Category.work:
      return appleColor2;
  }
}

class CategoryEnumConverter implements JsonConverter<Category?, String?> {
  const CategoryEnumConverter();

  @override
  Category? fromJson(String? json) => EnumToString.fromString(
        Category.values,
        json ?? '',
      );

  @override
  String? toJson(Category? object) =>
      object == null ? null : EnumToString.convertToString(object);
}
