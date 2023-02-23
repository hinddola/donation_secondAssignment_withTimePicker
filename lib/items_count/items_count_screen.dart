import 'dart:io';

import 'package:donation_app_second_assignment/consts/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';



class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {

  final itemCountController=TextEditingController();

  var date;
  var time;
  final dateTime = DateTime.now();
  final timeOfDay = TimeOfDay.now();
  String ?dateID ;
  File? image;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                    //  margin: EdgeInsets.all(10),
                      decoration: K.boxDecoration,
                      height: 300,
                      child: image == null
                      ? Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThGnzqP2A8anXXPUVtVHg828_lWK3QMwAFSUq8FmVMMyfqCf5SmOLNLkajY5b39D8VY1s&usqp=CAU',
                        fit: BoxFit.fill,
                        width: 330,
                      ): Image.file(image!),

                  ),
                  onTap: (){
                    pickImage();
                  },
                ),
                K.sizedBoxH,
                Container(
                  // decoration: K.boxDecoration,
                  //margin: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: itemCountController,
                    decoration:  InputDecoration(
                      hintText: ' Item count',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black12)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: K.primaryColor)
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black12)
                      ),
                    ),

                  ),
                ),
                 K.sizedBoxH,
                Container(
                 // margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),

                  decoration: K.boxDecoration,
                  height: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: (){},
                        icon:  const Icon(
                            Icons.add_location
                        ),
                      ),
                      Text(
                        'address',
                        style: TextStyle(
                            color: Colors.grey.shade700
                        ),
                      ),
                    ],
                  ),

                ),
                K.sizedBoxH,

                Row(
                  children: [
                    Expanded(
                        child: Container(
                            height: 50,
                            decoration: K.boxDecoration,
                            child: ElevatedButton(
                              onPressed: () async{

                                await showTime(context: context);
                                if (timeOfDay == null) return; //break
                                setState(() {
                                  date = timeOfDay;
                                });
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.white)),
                              child: date != null
                                  ? Text('${date.hour}',style: TextStyle(color: K.blackColor),)
                                  : Image.network(
                                // 'assets/images/snap.png',
                                'https://cdn.pixabay.com/photo/2017/06/26/00/46/flat-2442462__340.png',
                                height: 30,
                              ),
                            ))),
                    K.sizedBoxW,

                    Expanded(
                        child: Container(
                            height: 50,
                            decoration: K.boxDecoration,
                            child: ElevatedButton(
                              onPressed: () async {
                                //DateFormat dateFormat = DateFormat("yyyy-MM-dd ");
                                await showCalender(context: context);
                                if (dateTime == null) return; //break
                                setState(() {
                                  time = dateTime;
                                  //dateID = dateFormat.format(time);
                                });


                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.white)),
                              child: time != null
                                  ? Text(
                                 //'${dateID}',
                                 '${time.year}/${time.month}/${time.day}',
                                style: const TextStyle(color: K.blackColor),
                              )
                                  : Image.network(
                                'https://thumbs.dreamstime.com/b/calendar-icon-vector-calendar-icon-vector-agenda-app-business-deadline-date-page-icon-vector-illustration-isolated-white-140057422.jpg',
                                height: 40,
                              ),
                            ))),
                  ],
                ),

                K.sizedBoxH,

                MaterialButton(
                  onPressed: () {
                    print('Pressed');
                  },
                  child: const Text(
                    'confirm',
                    style: TextStyle(
                        color: K.whiteColor
                    ),
                  ),
                  color: K.primaryColor,
                  elevation: 5,
                  minWidth: 200,
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }


  pickImage() async {
    //class ImagePicker ( obj) , (class )
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(pickedImage!.path);
    });
  }


  Future<DateTime?> showCalender({required BuildContext context}) async =>
      await showDatePicker(
          context: context,
          initialDate: dateTime,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          builder: (BuildContext context, Widget? child) {
            return Theme(
                data: ThemeData.light().copyWith(
                    primaryColor: K.primaryColor,
                    colorScheme: ColorScheme.light(primary: K.primaryColor)),
                child: child!);
          });

  Future<TimeOfDay?> showTime({required BuildContext context}) async =>
      await showTimePicker(//Flutter SDK
          context: context,
          initialTime: timeOfDay,
          builder: (BuildContext context, Widget? child) {
            return Theme(
                data: ThemeData.light().copyWith(
                    primaryColor: Colors.yellow,
                    // primaryColor: K.primaryColor,
                    accentColor: Colors.red,
                    colorScheme: ColorScheme.light(primary: K.primaryColor)),
                child: child!);
          });







}

//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceAround,
//                  children: [
//                    Container(
//                      decoration: K.boxDecoration,
//                      width: 150,
//                      child: IconButton(
//                          onPressed: (){}
//                           ,
//                          icon: Icon(
//                            Icons.calendar_today_outlined,
//                            color: K.primaryColor,
//                          ),
//                      ),
//                    ),
//                    K.sizedBoxW,
//                    Container(
//                      decoration: K.boxDecoration,
//                      width: 150,
//                      child: IconButton(
//                        onPressed: () {},
//                        icon: date != null
//                            ? Text('${date.hour}',style: TextStyle(color: K.blackColor),)
//                            : Icon(
//                               Icons.access_time_rounded,
//                               color: K.primaryColor,
//                        ),
////                        Icon(
////                          Icons.access_time_rounded,
////                          color: K.primaryColor,
////                        ),
//                      ),
//                    ),
//                  ],
//                ),