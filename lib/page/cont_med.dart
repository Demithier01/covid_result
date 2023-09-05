import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:covid_data/result/result_medtic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';

import 'check_covid.dart';

class Cont_Medic extends StatefulWidget {
  const Cont_Medic({Key? key}) : super(key: key);

  @override
  State<Cont_Medic> createState() => _Cont_MedicState();
}

class _Cont_MedicState extends State<Cont_Medic> {
  TextEditingController date = TextEditingController();
  TextEditingController fristname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  final contMedic = GlobalKey<FormState>();
  String selectedTime = '';
  get hintText => null;

  @override
  void initState() {
    date.text = ""; //set the initial value of text field
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[100],
        appBar: AppBar(
          title: const Text(
            "ติดต่อเข้ารับยา",
            style: TextStyle(fontSize: 30),
          ),
          backgroundColor: const Color.fromARGB(255, 239, 154, 154),
        ),
        body: SingleChildScrollView(
            child: Form(
                key: contMedic,
                child: Container(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.all(16),
                    color: const Color.fromARGB(255, 255, 182, 190),
                    child: Column(children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 30),
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 250, 218,
                                218), //new Color.fromRGBO(255, 0, 0, 0.0),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: TextFormField(
                          controller:
                              date, //editing controller of this TextField
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.calendar_today,
                              color: Colors.black,
                            ), //icon of text field
                            labelText: ("วัน/เดือน/ปี"),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 120, 119, 119)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 120, 119, 119)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            contentPadding: const EdgeInsets.all(14),
                          ),

                          validator: RequiredValidator(
                              errorText: "กรุณาระบุวัน/เดือน/ปี"),
                          readOnly:
                              true, //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                locale: const Locale("th", "TH"),
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
                      const Text('ช่วงเวลาเข้ารับยา',
                          style: TextStyle(
                              color: Colors.white,
                              backgroundColor:
                                  Color.fromARGB(255, 235, 128, 141),
                              fontWeight: FontWeight.bold)),
                  
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                          children: <Widget>[
                            RadioListTile(
                              title: Text('12.00น.'),
                              value: '12.00น.',
                              groupValue: selectedTime,
                              onChanged: (value) {
                                setState(() {
                                  selectedTime = value!;
                                });
                              },
                            ),
                            RadioListTile(
                              title: Text('13.00น.'),
                              value: '13.00น.',
                              groupValue: selectedTime,
                              onChanged: (value) {
                                setState(() {
                                  selectedTime = value!;
                                });
                              },
                            ),
                            RadioListTile(
                              title: Text('14.00น.'),
                              value: '14.00น.',
                              groupValue: selectedTime,
                              onChanged: (value) {
                                setState(() {
                                  selectedTime = value!;
                                });
                              },
                            ),
                            RadioListTile(
                              title: Text('15.00น.'),
                              value: '15.00น.',
                              groupValue: selectedTime,
                              onChanged: (value) {
                                setState(() {
                                  selectedTime = value!;
                                });
                              },
                            ),

                            ]),
                              ),
                          const SizedBox(height: 20),
                          const Text(
                            'รายละเอียดผู้นัดรับ',
                            style: TextStyle(
                                color: Colors.white,
                                backgroundColor:
                                    Color.fromARGB(255, 235, 128, 141),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 300,
                            height: 50,
                            child: TextField(
                              controller: fristname,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[ก-๙a-zA-Z ]")),
                              ],
                              decoration: InputDecoration(
                                  labelText: "ชื่อจริง",
                                  border: myinputborder(), //normal border
                                  enabledBorder:
                                      myinputborder(), //enabled border
                                  focusedBorder: myinputborder()),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 300,
                            height: 50,
                            child: TextField(
                              controller: lastname,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[ก-๙a-zA-Z ]")),
                              ],
                              decoration: InputDecoration(
                                  labelText: "นามสกุล",
                                  border: myinputborder(), //normal border
                                  enabledBorder:
                                      myinputborder(), //enabled border
                                  focusedBorder: myinputborder()),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                              width: 120,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    AnimatedButton(
                                        text: 'บันทึก',
                                        color: Colors.green,
                                        pressEvent: () {
                                          if (contMedic.currentState!.validate()) {
                                            // ignore: unnecessary_null_comparison
                                            if (selectedTime == null)
                                            // กรอกข้อมูลไม่สำเร็จ
                                            AwesomeDialog(
                                              context: context,
                                              dialogType: DialogType.error,
                                              title: 'ข้อมูลไม่ครบถ้วน',
                                              desc: 'กรุณากรอกข้อมูล',
                                              btnOkOnPress: () {},
                                            ).show();
                                          } else {
                                            // กรอกข้อมูลสำเร็จ
                                            AwesomeDialog(
                                              context: context,
                                              dialogType: DialogType.success,
                                              animType: AnimType.leftSlide,
                                              headerAnimationLoop: false,
                                              showCloseIcon: true,
                                              title:
                                                  'บันทึกข้อมูลเรียบร้อยแล้ว',
                                              desc: 'แบร่ แบร่',
                                              btnOkOnPress: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Medtic(
                                                        fristname.text,
                                                        lastname.text,
                                                        date.text,
                                                        selectedTime,
                                                      ),
                                                    )
                                                  );
                                              },
                                            ).show();
                                          }
                                        }
                                        ),
                                    const SizedBox(height: 10),
                                    AnimatedButton(
                                      text: 'ยกเลิก',
                                      color: Colors.red,
                                      pressEvent: () {},
                                    ),
                                  ]))
                        ]),
                      ),
                    )));
  }
}

OutlineInputBorder myinputborder() {
  //return type is OutlineInputBorder
  return const OutlineInputBorder(
      //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 95, 95, 95),
        width: 2,
      ));
}
