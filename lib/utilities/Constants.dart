import 'package:flutter/material.dart';

typedef FallbackFunction<T> = void Function(T item);
typedef Fallback0Param = void Function();

typedef ListItemBuilderCallback = Widget? Function(
  BuildContext context,
  int index,
  Object? item,
);
