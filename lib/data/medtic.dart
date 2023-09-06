import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';

class MedicationRecord {
  final String date;
  final String time;
  final String firstName;
  final String lastName;

  MedicationRecord({
    required this.date,
    required this.time,
    required this.firstName,
    required this.lastName,
  });
}

class ContMedic extends StatefulWidget {
  const ContMedic({super.key});

  @override
  State<ContMedic> createState() => _ContMedicState();
}

class _ContMedicState extends State<ContMedic> {
  TextEditingController date = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    date.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ... ส่วนอื่น ๆ ของหน้านี้
  backgroundColor: Colors.red[100],
      appBar: AppBar(
        title: Text(
          "การนัดหมาย",
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: Color.fromARGB(255, 239, 154, 154),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: formKey,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          color: Colors.pink[50],
          child: Column(children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.white, //new Color.fromRGBO(255, 0, 0, 0.0),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: TextFormField(
                controller: date, //editing controller of this TextField
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.calendar_today,
                    color: Colors.black,
                  ), //icon of text field
                  labelText: ("วัน/เดือน/ปี"),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  contentPadding: EdgeInsets.all(14),
                ),

                validator:
                    RequiredValidator(errorText: "กรุณาระบุวัน/เดือน/ปี"),
                readOnly:
                    true, //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      locale: Locale("th", "TH"),
                      initialDate: DateTime.now(),
                      firstDate: DateTime(
                          2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      date.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              ),
            ),
            Text('ช่วงเวลาเข้ารับยา'),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                children: [
                  Expanded(
                    child: GroupButton(
                      borderRadius: BorderRadius.circular(10),
                      isRadio: true,
                      spacing: 10,
                      onSelected: (index, isSelected) => print(
                          '$index button is ${isSelected ? 'selected' : 'unselected'}'),
                      buttons: [
                        "09:00 น.",
                        "10:00 น.",
                        "11:00 น.",
                        "13:00 น.",
                        "14:00 น."
                      ],
                      selectedTextStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      unselectedTextStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'รายละเอียดผู้นัดรับ',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SizedBox(
             width: 300,
             height: 50,
              child: TextField(
                controller: firstName,
                decoration: InputDecoration(
                    labelText: "ชื่อจริง",
                    border: myinputborder(), //normal border
                    enabledBorder: myinputborder(), //enabled border
                    focusedBorder: myinputborder()),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 300,
              height: 50,
              child: TextField(
                controller: lastName,
                decoration: InputDecoration(
                    labelText: "นามสกุล",
                    border: myinputborder(), //normal border
                    enabledBorder: myinputborder(), //enabled border
                    focusedBorder: myinputborder()),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
                width: 120,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AnimatedButton(
                          text: 'บันทึก',
                          color: Colors.green,
                          pressEvent: () {
                            if (date.text.isEmpty) {
      AnimatedButton(
        text: 'บันทึก',
        color: Colors.green,
        pressEvent: () {
          if (formKey.currentState!.validate()) {
            MedicationRecord medicationRecord = MedicationRecord(
              date: date.text,
              time: '', // ต้องดึงข้อมูลจากการเลือกช่วงเวลา
              firstName: firstName.text,
              lastName: lastName.text,
            );

            // แสดงค่าที่ถูกบันทึก
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('ข้อมูลที่ถูกบันทึก'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('วันที่: ${medicationRecord.date}'),
                      Text('เวลา: ${medicationRecord.time}'),
                      Text('ชื่อ: ${medicationRecord.firstName}'),
                      Text('นามสกุล: ${medicationRecord.lastName}'),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('ปิด'),
                    ),
                  ],
                );
              },
            );
          }
        },
      );
      
   }}) ]))])))));
  }
  OutlineInputBorder myinputborder() {
  //return type is OutlineInputBorder
  return OutlineInputBorder(
      //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 232, 179, 179),
        width: 3,
      ));
}
}