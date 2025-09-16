// import 'package:flutter/material.dart';
// import 'package:StreetSpot/custom_widgets/custom_text.dart';

// class Subscriptionmanagement extends StatefulWidget {
//   const Subscriptionmanagement({super.key});

//   @override
//   State<Subscriptionmanagement> createState() => _SubscriptionmanagementState();
// }

// class _SubscriptionmanagementState extends State<Subscriptionmanagement> {
//   int _selectedPlan = 0; // Default selected plan is 0 (first Pro plan)

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           color: Colors.black,
//         ),
//         title: CustomText(
//           text: 'Subscription Management',
//           fontsize: 18,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Current Plan Container
//             Container(
//               padding: const EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(8.0),
//                 border: Border.all(color: Colors.grey),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CustomText(
//                     text: 'Current Plan: Pro Plan',
//                     fontsize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                   const SizedBox(height: 8),
//                   CustomText(
//                     text: 'Enjoy premium features and support',
//                     fontsize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.grey,
//                   ),
//                   const SizedBox(height: 8),
//                   CustomText(
//                     text: 'Next Billing Date: July 15, 2025',
//                     fontsize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black,
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       Checkbox(
//                         value: true,
//                         onChanged: (value) {},
//                         activeColor: Colors.blue,
//                       ),
//                       CustomText(
//                         text: 'Auto-renewal',
//                         fontsize: 14,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 24),
//             // Basic Plan Container
//             Container(
//               padding: const EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(8.0),
//                 border: Border.all(color: Colors.grey),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CustomText(
//                     text: 'Basic',
//                     fontsize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                   const SizedBox(height: 8),
//                   CustomText(
//                     text: 'Basic features and limited support',
//                     fontsize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.grey,
//                   ),
//                   CustomText(
//                     text: 'Up to 50 orders per month',
//                     fontsize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.grey,
//                   ),
//                   CustomText(
//                     text: 'No priority support',
//                     fontsize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.grey,
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       CustomText(
//                         text: '\$9.99/month',
//                         fontsize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                       ),
//                       const SizedBox(width: 8),
//                       ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                         ),
//                         child: const CustomText(
//                           text: 'Upgrade Plan',
//                           fontsize: 14,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 24),
//             // Pro Plan Containers
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   onTap: () => setState(() => _selectedPlan = 0),
//                   child: Container(
//                     width: (MediaQuery.of(context).size.width - 48) / 3,
//                     padding: const EdgeInsets.all(16.0),
//                     decoration: BoxDecoration(
//                       color: Colors.purple[100],
//                       borderRadius: BorderRadius.circular(8.0),
//                       border: Border.all(
//                         color: Colors.purple,
//                         width: _selectedPlan == 0 ? 2.0 : 0.0,
//                       ),
//                       gradient: _selectedPlan == 0
//                           ? LinearGradient(
//                               colors: [
//                                 Colors.purple[200]!,
//                                 Colors.purple[400]!
//                               ],
//                             )
//                           : null,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CustomText(
//                           text: 'Pro',
//                           fontsize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.purple,
//                         ),
//                         const SizedBox(height: 8),
//                         CustomText(
//                           text: 'Current Plan',
//                           fontsize: 12,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.purple,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () => setState(() => _selectedPlan = 1),
//                   child: Container(
//                     width: (MediaQuery.of(context).size.width - 48) / 3,
//                     padding: const EdgeInsets.all(16.0),
//                     decoration: BoxDecoration(
//                       color: Colors.purple[100],
//                       borderRadius: BorderRadius.circular(8.0),
//                       border: Border.all(
//                         color: Colors.purple,
//                         width: _selectedPlan == 1 ? 2.0 : 0.0,
//                       ),
//                       gradient: _selectedPlan == 1
//                           ? LinearGradient(
//                               colors: [
//                                 Colors.purple[200]!,
//                                 Colors.purple[400]!
//                               ],
//                             )
//                           : null,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CustomText(
//                           text: 'Pro',
//                           fontsize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.purple,
//                         ),
//                         const SizedBox(height: 8),
//                         CustomText(
//                           text: 'Advanced Features',
//                           fontsize: 12,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.purple,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () => setState(() => _selectedPlan = 2),
//                   child: Container(
//                     width: (MediaQuery.of(context).size.width - 48) / 3,
//                     padding: const EdgeInsets.all(16.0),
//                     decoration: BoxDecoration(
//                       color: Colors.purple[100],
//                       borderRadius: BorderRadius.circular(8.0),
//                       border: Border.all(
//                         color: Colors.purple,
//                         width: _selectedPlan == 2 ? 2.0 : 0.0,
//                       ),
//                       gradient: _selectedPlan == 2
//                           ? LinearGradient(
//                               colors: [
//                                 Colors.purple[200]!,
//                                 Colors.purple[400]!
//                               ],
//                             )
//                           : null,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CustomText(
//                           text: 'Pro',
//                           fontsize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.purple,
//                         ),
//                         const SizedBox(height: 8),
//                         CustomText(
//                           text: 'Premium Support',
//                           fontsize: 12,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.purple,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CustomText(
//                   text: 'Unlimited orders',
//                   fontsize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.grey,
//                 ),
//                 CustomText(
//                   text: 'Unlimited orders',
//                   fontsize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.grey,
//                 ),
//                 CustomText(
//                   text: 'Unlimited orders',
//                   fontsize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.grey,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CustomText(
//                   text: 'Priority support',
//                   fontsize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.grey,
//                 ),
//                 CustomText(
//                   text: 'Priority support',
//                   fontsize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.grey,
//                 ),
//                 CustomText(
//                   text: '24/7 support',
//                   fontsize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.grey,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CustomText(
//                   text: '\$19.99/month',
//                   fontsize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                 ),
//                 CustomText(
//                   text: '\$19.99/month',
//                   fontsize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                 ),
//                 CustomText(
//                   text: '\$19.99/month',
//                   fontsize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),
//             // Enterprise Section
//             Container(
//               padding: const EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(8.0),
//                 border: Border.all(color: Colors.grey),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CustomText(
//                     text: 'Enterprise',
//                     fontsize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                   const SizedBox(height: 8),
//                   CustomText(
//                     text: 'Custom features and dedicated support',
//                     fontsize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.grey,
//                   ),
//                   CustomText(
//                     text: 'Unlimited orders and priority access',
//                     fontsize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.grey,
//                   ),
//                   CustomText(
//                     text: 'Dedicated account manager',
//                     fontsize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.grey,
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       CustomText(
//                         text: 'Custom Pricing',
//                         fontsize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 24),
//             // Last Payment History Section
//             CustomText(
//               text: 'Last Payment History',
//               fontsize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//             const SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CustomText(
//                   text: 'Date',
//                   fontsize: 14,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                 ),
//                 CustomText(
//                   text: 'Amount',
//                   fontsize: 14,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                 ),
//                 CustomText(
//                   text: 'Plan',
//                   fontsize: 14,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                 ),
//                 CustomText(
//                   text: 'Status',
//                   fontsize: 14,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CustomText(
//                   text: 'Jul 10, 2025',
//                   fontsize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.black,
//                 ),
//                 CustomText(
//                   text: '\$19.99',
//                   fontsize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.black,
//                 ),
//                 CustomText(
//                   text: 'Pro',
//                   fontsize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.black,
//                 ),
//                 CustomText(
//                   text: 'Paid',
//                   fontsize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.green,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CustomText(
//                   text: 'Need help?',
//                   fontsize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.black,
//                 ),
//                 const SizedBox(width: 8),
//                 CustomText(
//                   text: 'Contact support',
//                   fontsize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.blue,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
