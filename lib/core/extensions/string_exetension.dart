extension StringFormate on String {
  String imageProductFormate() {


    return replaceAll(RegExp(r'^\["?|"\]?|"$'), '');


  }
}

// extension ListFormate on List<String>{
//   String imageProductFormate() {


//     return  replaceFirst(RegExp(r'[]'), '');


//   }
// }