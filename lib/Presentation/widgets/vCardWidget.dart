// import 'package:flutter/material.dart';
// import 'package:in_stealth/Data/providers/cartProvider.dart';
// import 'package:provider/provider.dart';
//
// Widget vCardWidget(
//     String pName,
//     bool pInStock,
//     double pStrikePrice,
//     double pPrice,
//     String pImageURL,
//     int pQuantity,
//     int pID,
//     String pBrand,
//     String pSKU,
//     BuildContext context) {
//   final cartProvider = Provider.of<CartProvider>(context);
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//     child: Container(
//       width: 120,
//       height: 230,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Container(
//             height: 120,
//             width: 120,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(8.0),
//               child: Image.network(
//                 pImageURL,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   child: Text(
//                     pName,
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
//                   ),
//                 ),
//                 Container(
//                   child: Text(pSKU),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   child: Text(
//                     pPrice.toString(),
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
//                   ),
//                 ),
//                 Container(
//                   child: Text(
//                     pStrikePrice.toString(),
//                     style: TextStyle(
//                         decoration: TextDecoration.lineThrough,
//                         fontStyle: FontStyle.italic),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           pInStock == true
//               ? Text('In stock', style: TextStyle(color: Colors.green))
//               : Text('Out of stock', style: TextStyle(color: Colors.red)),
//           GestureDetector(
//             onTap: () {
//               cartProvider.addItemToCart(
//                 pID,
//                 pName,
//                 pPrice,
//                 pImageURL,
//                 pSKU,
//                 pQuantity,
//               );
//               print(pQuantity);
//             },
//             child: Container(
//               width: 120,
//               height: 40,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(4.0),
//                   color: Colors.green),
//               child: Center(
//                 child: Text('Add to card'),
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
