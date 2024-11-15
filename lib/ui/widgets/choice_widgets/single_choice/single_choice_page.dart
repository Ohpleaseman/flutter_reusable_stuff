import 'package:flutter/material.dart';
import 'package:flutter_reusable_stuff/ui/widgets/choice_widgets/single_choice/segmented_control.dart';

class SingleChoicePage extends StatefulWidget {
  const SingleChoicePage({super.key});

  @override
  State<SingleChoicePage> createState() => _SingleChoicePageState();
}

class _SingleChoicePageState extends State<SingleChoicePage> {
  late Option _selectedOption;

  final options = const {
    Option(name: 'name', value: 'value'),
    Option(name: 'name2', value: 'value2'),
    Option(name: 'name3', value: 'value3'),
    Option(name: 'name4', value: 'value4'),
  };

  @override
  void initState() {
    setState(() {
      _selectedOption = options.first;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SegmentedControl(
            options: options,
            selected: _selectedOption,
            onSelected: (option) {
              setState(() {
                _selectedOption = option;
              });
            },
          )
        ],
      ),
    );
  }
}
