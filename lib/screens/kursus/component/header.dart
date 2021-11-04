import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget header() {
  return Padding(
      padding: const EdgeInsets.fromLTRB(90, 10, 30, 30),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Modul Bank',
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ));
}


// ListView.builder(
//               itemCount: 3,
//               shrinkWrap: true,
//               padding: EdgeInsets.all(12),
//               physics: NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 // Course course = Assets.courses[index];
//                 return Container(
//                   height: 120,
//                   margin: EdgeInsets.fromLTRB(
//                     0,
//                     index == 0 ? 0 : 8,
//                     0,
//                     index == 1 ? 0 : 8,
//                   ),
//                   decoration: BoxDecoration(
//                     color: wtColor,
//                     border: Border.all(color: Colors.black),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8),
//                     child: Row(
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child: Image.asset(
//                             courseImg.first,
//                             fit: BoxFit.cover,
//                             height: 100,
//                             width: 100,
//                           ),
//                         ),
//                         SizedBox(width: 16),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'course.name',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                               Text(
//                                 'course.deskripsi',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(width: 16),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             )
