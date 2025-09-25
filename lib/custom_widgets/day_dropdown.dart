// import 'package:flutter/material.dart';

// class DayDropdown extends StatelessWidget {
//   final String? selectedDay;
//   final Function(String?) onChanged;
//   final List<String> daysOfWeek;

//   const DayDropdown({
//     super.key,
//     required this.selectedDay,
//     required this.onChanged,
//     this.daysOfWeek = const [
//       "SUNDAY",
//       "MONDAY",
//       "TUESDAY",
//       "WEDNESDAY",
//       "THURSDAY",
//       "FRIDAY",
//       "SATURDAY",
//     ],
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//       margin: const EdgeInsets.only(bottom: 12),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade200, // match textfield bg
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton<String>(
//           value: selectedDay?.isEmpty ?? true ? null : selectedDay,
//           hint: const Text(
//             "Select Day",
//             style: TextStyle(color: Colors.black54),
//           ),
//           isExpanded: true,
//           icon: const Icon(Icons.arrow_drop_down, color: Colors.black54),
//           onChanged: onChanged,
//           items: daysOfWeek.map((day) {
//             return DropdownMenuItem(
//               value: day,
//               child: Text(
//                 day,
//                 style: const TextStyle(color: Colors.black87),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class DayDropdown extends StatelessWidget {
  final List<String> days;
  final String? selectedDay;
  final ValueChanged<String?> onChanged;

  const DayDropdown({
    Key? key,
    required this.days,
    required this.selectedDay,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

return DropdownButtonFormField<String>(
  value: days.contains(selectedDay) ? selectedDay : null, // ✅ Prevent crash
  items: days
      .map((day) => DropdownMenuItem(
            value: day,
            child: Text(day),
          ))
      .toList(),
  onChanged: onChanged,
  decoration: InputDecoration(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
  ),
  validator: (value) => value == null ? "Please select a day" : null,
);


  }
}
