// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Shared/SideBar.dart';
import 'package:frist_file_taj_alwaqar/Shared/color.dart';

import '../Shared/appBar.dart';
import 'quran.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: GradientGreen,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: CustomAppBar("المعلمين"),
          backgroundColor: darkGreen,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.account_circle_rounded,
                  size: 40, color: goldenColor),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                Navigator.popAndPushNamed(context, '/search' );
                
                },
                icon: Icon(
                  Icons.search,
                  size: 33,
                  color: goldenColor,
                ))
          ],
        ),
        drawer: SideBar(),
      ),
    );
  }
}

// class CustomSearch {
//   List<String> surahName = [
//     "الفاتحة",
//     "البقرة",
//     "ال عمران",
//     "النساء",
//     "المَائدة",
//     "الأنعَام",
//     "الأعرَاف",
//     "الأنفَال",
//     "التوبَة",
//     "يُونس",
//     "هُود",
//     "يُوسُف",
//     "الرَّعْد",
//   ];

//   Widget buildSearchBar(BuildContext context) {
//     return  Container(
//       height: 50,
//       decoration: BoxDecoration(
//         color: greenColor,
//         border: Border.all(
//           color: goldenColor,
//           width: 1.4,
//         ),
//         borderRadius: BorderRadius.circular(25),
//       ),
//       child: Row(
//         children: [
//           Container(
//             height: 50,
//             width: 50,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(25),
//               color: greenColor,
//               border: Border.all(
//                 color: goldenColor,
//                 width: 2,
//               ),
//             ),
//             child: Icon(
//               Icons.search,
//               color: goldenColor,
//             ),
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             child: CupertinoSearchTextField(
//               onChanged: (value) {
//                 // Perform search operation
//               },
//               placeholder: 'Search',
//               placeholderStyle: TextStyle(
//                 color: goldenColor.withOpacity(0.7),
//               ),
//               style: TextStyle(
//                 color: goldenColor,
//               ),
//               decoration: BoxDecoration(
//                 color: greenColor,
//                 border: Border.all(
//                   color: Colors.transparent,
//                 ),
//                 borderRadius: BorderRadius.circular(25),
//               ),
//             ),
//           ),
//         ],
//       ));
//   }

  // @override
  // List<Widget> buildActions(BuildContext context) {
  //   return [
  //     IconButton(
  //         onPressed: () {
  //             close(context, null);
            
  //         },
  //           icon: Icon(Icons.arrow_forward))
         
  //   ];
  // }

  // @override
  // Widget buildLeading(BuildContext context) {
  //   return IconButton(
  //       onPressed: () {
  //       query = "";
  //       },
  //      icon: Icon(Icons.clear));
  // }

  // @override
  // Widget buildResults(BuildContext context) {
  //   List<String> match = [];
  //   for (var element in surahName) {
  //     if (element.toLowerCase().contains(query.toLowerCase())) {
  //       match.add(element);
  //     }
  //   }
  //   return ListView.builder(
  //     itemCount: match.length,
  //     itemBuilder: (context, index) {
  //       var resultSearch = match[index];
  //       return ListTile(
  //         title: Text(resultSearch),
  //       );
  //     },
  //   );
  // }

  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   List<String> match = [];
  //   for (var element in surahName) {
  //     if (element.toLowerCase().contains(query.toLowerCase())) {
  //       match.add(element);
  //     }
  //   }
  //   return ListView.builder(
  //     itemCount: match.length,
  //     itemBuilder: (context, index) {
  //       var resultSearch = match[index];
  //       return ListTile(
  //         title: Text(resultSearch),
  //       );
  //     },
  //   );

    // Other methods...
  // }

