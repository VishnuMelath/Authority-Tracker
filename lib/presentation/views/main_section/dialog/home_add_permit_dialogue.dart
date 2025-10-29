import 'package:authority_tracker/presentation/views/shared/widgets/custom_textfield.dart';
import 'package:authority_tracker/utils/methods/date_fns.dart';
import 'package:flutter/material.dart';

Future<void> showAddUPermitDailogue(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) => const HomeAddUpdatePermitDialogue(),
  );
}

class HomeAddUpdatePermitDialogue extends StatefulWidget {
  const HomeAddUpdatePermitDialogue({super.key});

  @override
  State<HomeAddUpdatePermitDialogue> createState() =>
      _HomeAddUpdatePermitDialogueState();
}

class _HomeAddUpdatePermitDialogueState
    extends State<HomeAddUpdatePermitDialogue> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Column(
          spacing: 10,
          children: [
            CustomTextfield(hintText: 'name'),
            CustomTextfield(hintText: 'pdf link'),
          ],
        ),
      ),
    );
  }
}

class CustomDatePicker extends StatefulWidget {
  final DateTime? selected;
  final void Function(DateTime? date) onChanged;
  const CustomDatePicker({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? pickedDate;
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    if (widget.selected != null) {
      controller.text = dateString(widget.selected!);
    }
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(color: Colors.grey.withAlpha(120)),
    );
    return GestureDetector(
      onTap: () {
        showDatePicker(
          context: context,
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 36500)),
        ).then((value) {
          pickedDate = value;
        });
      },
      child: TextFormField(
        controller: TextEditingController(),
        readOnly: true,
        enabled: false,
        style: const TextStyle(fontSize: 14),
        cursorColor: Colors.black,
        cursorHeight: 20,
        cursorWidth: 1.5,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          suffixIcon: const Icon(Icons.calendar_month),
          // hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey.withAlpha(150)),
          isCollapsed: true,
          border: border,
          enabledBorder: border,
          focusedBorder: border,
        ),
      ),
    );
  }
}
