import 'package:donation_app_second_assignment/components/shared_components.dart';
import 'package:donation_app_second_assignment/consts/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';



class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {

  final itemCountController=TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();

  TimeOfDay selectedTime = TimeOfDay.now();


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
                Container(
                  //  margin: EdgeInsets.all(10),
                    decoration: K.boxDecoration,
                    height: 300,
                    child: Image.network(
                      'https://media.istockphoto.com/id/1139913278/vector/woman-with-laptop-sitting-in-nature-and-leaves-concept-illustration-for-working-freelancing.jpg?s=612x612&w=0&k=20&c=Uox6lJYdis3DmG3qdP8x06q4WZdVKSUR8LyL6O3-TWo=',
                      fit: BoxFit.fill,
                    ),

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
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceAround,
//                  children: [
//                    Container(
//                      decoration: K.boxDecoration,
//                      width: 150,
//                      child: IconButton(
//                          onPressed: (){
//                          },
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
//                        onPressed: (){
//                        },
//                        icon: Icon(
//                          Icons.access_time_rounded,
//                          color: K.primaryColor,
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
                K.sizedBoxH,


                defaultFormField(
                  controller: dateController,
                  type: TextInputType.datetime,
                  onTap:(){
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.parse('2022-08-25'),
                    ).then(( dynamic value)
                    {
                      dateController.text = DateFormat.yMMMd().format(value);
                    });
                  } ,
                  validate: (String value)
                  {
                    if (value.isEmpty)
                    {
                      return('date must not be empty');
                    }
                    return null;
                  },
                  label: 'Date',
                  prefix: Icons.calendar_today_outlined,
                ),

                defaultFormField(
                  controller: timeController,
                  type: TextInputType.datetime,
                  onTap:(){
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((dynamic value)
                    {
                      timeController.text = value.format(context).toString();
                      print(value.format(context));
                    });
                  } ,
                  validate: (String value)
                  {
                    if (value.isEmpty)
                    {
                      return('time must not be empty');
                    }
                    return null;
                  },
                  label: 'Task Time',
                  prefix: Icons.watch_later_outlined,
                ),


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
}

