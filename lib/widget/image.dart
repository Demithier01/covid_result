// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   XFile? image;

//   final ImagePicker picker = ImagePicker();

//   //we can upload image from camera or from gallery based on parameter
//   Future getImage(ImageSource media) async {
//     var img = await picker.pickImage(source: media);

//     setState(() {
//       image = img;
//     });
//   }

//   //show popup dialog
//   void myAlert() {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//             title: Text('Please choose media to select'),
//             content: Container(
//               height: MediaQuery.of(context).size.height / 6,
//               child: Column(
//                 children: [
//                   ElevatedButton(
//                     //if user click this button, user can upload image from gallery
//                     onPressed: () {
//                       Navigator.pop(context);
//                       getImage(ImageSource.gallery);
//                     },
//                     child: Row(
//                       children: [
//                         Icon(Icons.image),
//                         Text('  From Gallery'),
//                       ],
//                     ),
//                     style: TextButton.styleFrom(
//                         primary: Colors.white,
//                         backgroundColor: Color.fromARGB(255, 238, 100, 146)),
//                   ),
//                   ElevatedButton(
//                     //if user click this button. user can upload image from camera
//                     onPressed: () {
//                       Navigator.pop(context);
//                       getImage(ImageSource.camera);
//                     },
//                     child: Row(
//                       children: [
//                         Icon(Icons.camera),
//                         Text('  From Camera'),
//                       ],
//                     ),
//                     style: TextButton.styleFrom(
//                         disabledBackgroundColor: Colors.white,
//                         backgroundColor: Color.fromARGB(255, 238, 100, 146)),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 238, 100, 146),
//         title: Center(
//           child: Text('ชำระเงิน',
//               style: TextStyle(
//                   fontFamily: 'Mitr', fontSize: 25, color: Colors.white)),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(
//               height: 30,
//               width: double.infinity,
//             ),
//             const Text('QrCode',
//                 style: TextStyle(
//                     fontFamily: 'Mitr', fontSize: 30, color: Colors.black)),
//             const SizedBox(
//               height: 20,
//             ),

//             const Image(
//               width: 200,
//               image: AssetImage('assets/img/qrcode/payment.jpg'),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 myAlert();
//               },
//               style: TextButton.styleFrom(
//                   primary: Colors.purpleAccent,
//                   backgroundColor: Color.fromARGB(255, 238, 100, 146)),
//               child: Text('แนบสลิป',
//                   style: TextStyle(
//                       fontFamily: 'Mitr', fontSize: 20, color: Colors.white)),
//             ),
//             SizedBox(
//               height: 10,
//             ),

//             //if image not null show the image
//             //if image null show text
//             image != null
//                 ? Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: Image.file(
//                         //to show image, you type like this.
//                         File(image!.path),
//                         fit: BoxFit.cover,
//                         width: MediaQuery.of(context).size.width,
//                         height: 300,
//                       ),
//                     ),
//                   )
//                 : Text(
//                     "No Image",
//                     style: TextStyle(fontSize: 20),
//                   ),
//             const SizedBox(
//               height: 100,
//             ),

//             SizedBox(
//               width: 100,
//               // width: ,
//               child: ElevatedButton(
//                 // style: ElevatedButton.styleFrom(fixedSize: const Size(40, 10)),
//                 //   child: Text('บันทึก'),
//                 //   style: ElevatedButton.styleFrom(
//                 //       textStyle: TextStyle(fontFamily: 'Mitr', fontSize: 20)),
//                 //   onPressed: () {
//                 //     Navigator.of(context).push(MaterialPageRoute(
//                 //       builder: (context) => DialogExample(),
//                 //     ));
//                 //   },
//                 // ),
//                 onPressed: () => showDialog<String>(
//                   context: context,
//                   builder: (BuildContext context) => AlertDialog(
//                     icon: Icon(
//                       Icons.done,
//                       size: 60,
//                       color: Colors.green,
//                     ),
//                     title: const Text(
//                       'ชำระเงินเสร็จสิ้น \n ________________________',
//                       style: TextStyle(fontFamily: 'Mitr'),
//                     ),
//                     content: const Text(
//                       'ขอบคุณ คุณได้ทำการจองห้องพักเสร็จสิ้นแล้ว',
//                       style: TextStyle(fontFamily: 'Mitr'),
//                     ),
//                     actions: <Widget>[
//                       TextButton(
//                         onPressed: () => Navigator.pop(context, 'Cancel'),
//                         child: const Text('Cancel'),
//                       ),
//                       TextButton(
//                         // onPressed: () => Navigator.pop(, 'OK',)
//                         onPressed: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                             builder: (
//                               context,
//                             ) =>
//                                 Home(),
//                           ));
//                         },

//                         child: const Text('OK'),
//                       ),
//                     ],
//                   ),
//                 ),
//                 child: const Text(
//                   'บันทึก',
//                   style: TextStyle(fontFamily: 'Mitr', fontSize: 20),
//                 ),
//                 style: TextButton.styleFrom(
//                     primary: Colors.white,
//                     backgroundColor: Color.fromARGB(255, 238, 100, 146)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
