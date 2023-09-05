// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// enum ProducTypeEnum { positive, negative }

// class Radio_button extends StatelessWidget {
//   Radio_button({
//     Key? key,
//     required this.title,
//     required this.value,
//     required this.producTypeEnum,
//     required this.onChanged,
//   }) : super(key: key);

//   String title;
//   ProducTypeEnum value;
//   ProducTypeEnum? producTypeEnum;
//   Function(ProducTypeEnum?)? onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: RadioListTile<ProducTypeEnum>(
//           title: Text('ผลเป็นบวก'),
//           value: ProducTypeEnum.positive,
//           groupValue: producTypeEnum,
//           contentPadding: EdgeInsets.all(0.0),
//           activeColor: Colors.red[400],
//           onChanged: onChanged),
//     );
//   }
// }
