import 'package:covid_data/result/medtic.dart';
import 'package:flutter/material.dart';

import '../page/cont_med.dart';

class Medtic extends StatefulWidget {
   // Detail({super.key});
  String fristname;
  String lastname;
  String date;
  String selectedTime;
  
  Medtic( this.fristname, this.lastname,this.date ,this.selectedTime,{super.key});
  @override
  State<Medtic> createState() => _MedticState(fristname, lastname ,date, selectedTime);
}

class _MedticState extends State<Medtic> {
  String fristname;
  String lastname;
  String date;
  String selectedTime;
  _MedticState(this.fristname, this.lastname, this.date,this.selectedTime);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('บันทึกการเข้ารับยา'),
        backgroundColor: Color.fromARGB(255, 239, 154, 154),
      ),
      backgroundColor: Colors.red[100],
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(8),
                alignment: Alignment.topLeft,
                color: Colors.pink[100],
                child: Text("ชื่อ: $fristname  $lastname", style: TextStyle(fontSize: 16)),
              ),
              
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(8),
                alignment: Alignment.topLeft,
                color: Colors.pink[100],
                child: Text("วัน/เดือน/ปี: $date ", style: TextStyle(fontSize: 16)),
              ),
               Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(8),
                alignment: Alignment.topLeft,
                color: Colors.pink[100],
                child: Text("เวลา: $selectedTime", style: TextStyle(fontSize: 16)),
              ),
              
           
            ],
          ),
          
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.black,
          backgroundColor: Colors.red[50],
          highlightElevation: 40,
          elevation: 12,
          tooltip: 'เพิ่ม',
          child: Icon(Icons.add_box_outlined,color: Color.fromARGB(255, 77, 75, 75),),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cont_Medic(),
                ));
          }),
    
    );
  }
}
