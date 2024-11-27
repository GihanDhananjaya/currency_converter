// // import 'package:flutter/material.dart';
// //
// // Widget customDropDown(List<String> items, String value, void onChange(val)
// //     ) {
// //   return Container(
// //     child: DropdownButton<String>(
// //       value: value,
// //       onChanged: (String val){
// //         onChange(val);
// //       },
// //       items: items.map<DropdownMenuItem<String>>((String val){
// //         return DropdownMenuItem(
// //           child: Text(val),
// //           value: val,
// //         );
// //       }),
// //     ),
// //   );
// // }
//
//
// import 'package:flutter/material.dart';
//
// typedef DropDownChange<T> = void Function(T val); // Typedef for change callback
//
// Widget customDropDown<T>(
//     List<T> items, // Use a generic type for flexibility (String, int, etc.)
//     T value,
//     DropDownChange<T?>? onChange,
//     ) {
//   assert(items != null); // Assert that items is not null
//
//   return Container(
//     child: DropdownButton<T>(
//       value: value,
//       onChanged: onChange,
//       items: items.map<DropdownMenuItem<T>>((T val) {
//         return DropdownMenuItem<T>(
//           child: Text(val.toString()), // Ensure proper conversion to String
//           value: val,
//         );
//       }).toList(), // Convert to a list for the `items` property
//     ),
//   );
// }