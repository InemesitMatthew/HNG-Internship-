import 'package:flutter/material.dart';
import 'filter_sheet.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override

  /// Builds an ElevatedButton with an icon and label for applying filters.
  ///
  /// The button displays a filter icon and a 'Filter' label. When pressed,
  /// it triggers the `_showFilterSheet` method to display a modal bottom
  /// sheet for filter selection. The button's style is customized with theme
  /// colors for background and icon/text color, and it has rounded corners.

  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      icon: Icon(
        Icons.filter_list_rounded,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      label: Text(
        'Filter',
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      onPressed: () => _showFilterSheet(context),
    );
  }

  /// Displays a modal bottom sheet for filter selection when the ElevatedButton
  /// is pressed.
  //
  /// The bottom sheet displays a `FilterSheet` widget with a title and a list
  /// of filter options. The sheet has a rounded top border and is displayed
  /// with an animation. The builder argument is used to create the content
  /// of the sheet, and the context argument is used to determine the parent
  /// widget for the sheet.
  void _showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) => const FilterSheet(),
    );
  }
}
