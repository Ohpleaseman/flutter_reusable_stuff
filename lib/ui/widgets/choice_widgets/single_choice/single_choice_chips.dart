import 'package:flutter/material.dart';
import 'package:flutter_reusable_stuff/ui/widgets/choice_widgets/option.dart';

class SingleChoiceChips extends StatelessWidget {
  final Set<Option> options;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? foregroundSelectedColor;
  final Color? foregroundUnselectedColor;
  final Color? borderColor;
  final Option selected;
  final void Function(Option selected) onSelected;

  SingleChoiceChips({
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var option in options)
            Row(
              children: [
                OutlinedButton(
                  style: ButtonStyle(
                    padding: WidgetStateProperty.resolveWith(
                      (states) => const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 9,
                      ),
                    ),
                    shape: WidgetStateProperty.resolveWith(
                      (states) => const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.resolveWith(
                      (states) => selected == option
                          ? selectedColor ??
                              Theme.of(context).colorScheme.primary
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
                        color: borderColor ??
                            Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  onPressed: () => onSelected(option),
                  child: Text(
                    option.value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 12)
              ],
            )
        ],
      ),
    );
  }
}
