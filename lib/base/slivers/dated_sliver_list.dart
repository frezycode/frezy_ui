import 'package:flutter/material.dart';

class DatedSliverList<T> extends StatelessWidget {
  const DatedSliverList({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.formatter,
  });

  final Map<DateTime, List<T>> items;
  final Widget Function(BuildContext context, T item) itemBuilder;

  final String Function(DateTime date) formatter;

  @override
  Widget build(BuildContext context) {
    final versesWidgets = <Widget>[];
    for (final date in items.keys) {
      versesWidgets.add(DateGroupTitle(date: date, formatter: formatter));
      for (final item in items[date]!) {
        versesWidgets.add(itemBuilder(context, item));
      }
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final widget = versesWidgets[index];
          return widget;
        },
        childCount: versesWidgets.length,
      ),
    );
  }
}

class DateGroupTitle extends StatelessWidget {
  const DateGroupTitle({
    super.key,
    required this.date,
    required this.formatter,
  });

  final DateTime date;
  final String Function(DateTime date) formatter;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18).copyWith(top: 16),
      child: Text(
        formatter(date),
        style: theme.textTheme.titleMedium?.copyWith(fontSize: 22),
      ),
    );
  }
}
