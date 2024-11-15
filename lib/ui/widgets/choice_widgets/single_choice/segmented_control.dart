import 'package:flutter/material.dart';

// Suited for single choice collection with few items
class SegmentedControl extends StatelessWidget {
  final Set<Option> options;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? foregroundSelectedColor;
  final Color? foregroundUnselectedColor;
  final Color? borderColor;
  final Option selected;
  final void Function(Option selected) onSelected;

  SegmentedControl({
    super.key,
    required this.options,
    this.selectedColor,
    this.unselectedColor,
    this.foregroundSelectedColor,
    this.foregroundUnselectedColor,
    this.borderColor,
    required this.selected,
    required this.onSelected,
  }) {
    if (options.length < 2) {
      throw Exception('There are less than two options in SingleChoiceButtons');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var option in options)
          Expanded(
            child: OutlinedButton(
              style: ButtonStyle(
                shape: WidgetStateProperty.resolveWith(
                  (states) => RoundedRectangleBorder(
                    borderRadius: option == options.first
                        ? const BorderRadius.horizontal(
                            left: Radius.circular(30),
                          )
                        : option == options.last
                            ? const BorderRadius.horizontal(
                                right: Radius.circular(30),
                              )
                            : BorderRadius.zero,
                  ),
                ),
                backgroundColor: WidgetStateProperty.resolveWith(
                  (states) => selected == option
                      ? selectedColor ?? Theme.of(context).colorScheme.primary
                      : unselectedColor ??
                          Theme.of(context).colorScheme.surface,
                ),
                foregroundColor: WidgetStateProperty.resolveWith(
                  (states) => selected == option
                      ? foregroundSelectedColor ??
                          Theme.of(context).colorScheme.onPrimary
                      : foregroundUnselectedColor ??
                          Theme.of(context).colorScheme.onSurface,
                ),
                side: WidgetStateBorderSide.resolveWith(
                  (states) => BorderSide(
                    color: borderColor ?? Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              onPressed: () => onSelected(option),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                child: Text(
                  option.value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          )
      ],
    );
  }
}

class Option {
  final String name;
  final String value;

  const Option({required this.name, required this.value});
}

