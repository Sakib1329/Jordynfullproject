// import 'package:canvel/app/modules/home/controllers/home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class DateSelectorWidget extends StatelessWidget {
//   final Color selectedColor;
//   final Color unselectedColor;
//   final Color textColor;
//   final Color selectedTextColor;
//
//   const DateSelectorWidget({
//     Key? key,
//     this.selectedColor = Colors.black,
//     this.unselectedColor = Colors.white,
//     this.textColor = Colors.black,
//     this.selectedTextColor = Colors.white,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Get the controller
//     final HomeController controller = Get.find<HomeController>();
//
//     return Container(
//       height: 80,
//       decoration: BoxDecoration(
//         color: Colors.grey[100],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Obx(
//         () => Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children:
//               controller.dates.map((date) {
//                 final bool isSelected = controller.isSameDay(
//                   date,
//                   controller.selectedDate.value,
//                 );
//                 final dayName = controller.formatDayName(date);
//                 final dayNumber = controller.getDayNumber(date);
//
//                 return GestureDetector(
//                   onTap: () => controller.updateSelectedDate(date),
//                   child: Container(
//                     width: 40,
//                     margin: const EdgeInsets.symmetric(horizontal: 2),
//                     decoration: BoxDecoration(
//                       color: isSelected ? selectedColor : unselectedColor,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           dayName,
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                             color: isSelected ? selectedTextColor : textColor,
//                           ),
//                         ),
//                         const SizedBox(height: 6),
//                         Text(
//                           dayNumber,
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: isSelected ? selectedTextColor : textColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               }).toList(),
//         ),
//       ),
//     );
//   }
// }
// //
// // Example of a HomeScreen that uses the DateSelectorWidget
// // class HomeScreen extends StatelessWidget {
// //   const HomeScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final HomeController controller = Get.find<HomeController>();
// //
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Date Selector Demo')),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             const Text(
// //               'Select a date:',
// //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //             ),
// //             const SizedBox(height: 16),
// //             // Date selector widget
// //             const DateSelectorWidget(
// //               selectedColor: Colors.black,
// //               selectedTextColor: Colors.white,
// //             ),
// //             const SizedBox(height: 32),
// //             // Display selected date information
// //             Obx(
// //               () => Text(
// //                 'Selected date: ${controller.formatFullDate(controller.selectedDate.value)}',
// //                 style: const TextStyle(fontSize: 18),
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //             // Display events for selected date
// //             Obx(
// //               () => Text(
// //                 'Events: ${controller.getEventsFor(controller.selectedDate.value)}',
// //                 style: const TextStyle(fontSize: 16),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // // Example of another screen that uses the same DateSelectorWidget
// // class EventsScreen extends StatelessWidget {
// //   const EventsScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final HomeController controller = Get.find<HomeController>();
// //
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Events')),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // Date selector widget
// //             const DateSelectorWidget(
// //               selectedColor: Colors.blue,
// //               selectedTextColor: Colors.white,
// //             ),
// //             const SizedBox(height: 24),
// //             // Display selected date information with a card
// //             Obx(
// //               () => Card(
// //                 elevation: 4,
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(16.0),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         'Events for ${controller.formatFullDate(controller.selectedDate.value)}',
// //                         style: const TextStyle(
// //                           fontSize: 18,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       const SizedBox(height: 12),
// //                       Text(
// //                         controller.getEventsFor(controller.selectedDate.value),
// //                         style: const TextStyle(fontSize: 16),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // // Example of how to add the DateSelectorWidget to another custom widget
// // class CustomWidget extends StatelessWidget {
// //   const CustomWidget({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final HomeController controller = Get.find<HomeController>();
// //
// //     return Column(
// //       children: [
// //         // Include the date selector
// //         const DateSelectorWidget(
// //           selectedColor: Colors.green,
// //           selectedTextColor: Colors.white,
// //         ),
// //
// //         const SizedBox(height: 20),
// //
// //         // Use the selected date from the controller
// //         Obx(
// //           () => Container(
// //             padding: const EdgeInsets.all(16),
// //             decoration: BoxDecoration(
// //               color: Colors.grey[200],
// //               borderRadius: BorderRadius.circular(10),
// //             ),
// //             child: Column(
// //               children: [
// //                 Text(
// //                   'Tasks for ${DateFormat('MMM d').format(controller.selectedDate.value)}',
// //                   style: const TextStyle(
// //                     fontWeight: FontWeight.bold,
// //                     fontSize: 18,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 10),
// //                 // Content based on selected date
// //                 Text(controller.getEventsFor(controller.selectedDate.value)),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }
