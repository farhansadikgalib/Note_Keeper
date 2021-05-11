import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {



  final _formkey = GlobalKey<FormState>();
  String _title = "";
  String _priority;
  TextEditingController _dateController = TextEditingController();
  DateTime _dateTime = DateTime.now();
  final DateFormat _dateFormat = DateFormat('dd MMM,yyyy');


  List<String> _priorities = ['Low', 'Mid', 'High'];

  @override
  void initState() {
    super.initState();
    _dateController.text = _dateFormat.format(_dateTime);

  }


  @override
  void dispose() {
    super.dispose();
    _dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),

        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 75, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios, color: Colors.lightGreen,
                      size: 30,),


                  ),
                  SizedBox(height: 20,),
                  Text("Add Task", style: TextStyle(fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen),),
                  SizedBox(height: 10,),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            style: TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                              labelText: 'Title',
                              labelStyle: TextStyle(fontSize: 18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),


                              ),
                              focusColor: Colors.lightGreen,


                            ),
                            validator: (input) =>
                            input
                                .trim()
                                .isEmpty ? 'Enter a task title' : null,
                            initialValue: _title,
                            onSaved: (input) => _title = input,


                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(

                            readOnly: true,
                            controller: _dateController,
                            onTap: _handleDatePicker,
                            style: TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                              labelText: 'Date',
                              labelStyle: TextStyle(fontSize: 18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),


                              ),
                              focusColor: Colors.lightGreen,


                            ),


                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: DropdownButtonFormField(


                            icon: Icon(Icons.arrow_drop_down_sharp),
                            iconEnabledColor: Colors.lightGreen,
                            iconSize: 25,
                            decoration: InputDecoration(
                              labelText: 'Priority',
                              labelStyle: TextStyle(fontSize: 18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusColor: Colors.lightGreen,

                            ),
                            isDense: true,
                            items: _priorities.map((String priority) {
                              return DropdownMenuItem(child: Text(priority,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),),
                                  value: priority);
                            }).toList(),

                            validator: (input3) =>
                            input3
                                .trim()
                                .isEmpty ? 'Select a priority level' : null,
                            onChanged: (value) {
                              setState(() {
                                _priority = value;
                              }
                              );

                            },
                            value: _priority,


                          ),
                        ),

                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius: BorderRadius.circular(30.0),


                          ),
                          child: FlatButton(onPressed: _submitBtn,
                              child: Text("Add Task", style: TextStyle(
                                  color: Colors.white, fontSize: 20),)),


                        )


                      ],


                    ),


                  ),


                ],


              ),
            ),
          ),
        ),
      ),


    );
  }

  _handleDatePicker() async {
    final DateTime date = await showDatePicker(context: context,
        initialDate: _dateTime,
        firstDate: DateTime(2020),
        lastDate: DateTime(2050));
    if (date != null && date != _dateTime) {
      setState(() {
        _dateTime = date;
      });
    }
    _dateController.text = _dateFormat.format(date);
  }

  void _submitBtn() {
    if(_formkey.currentState.validate()){
      _formkey.currentState.save();
      print('$_title,$_dateTime,$_priority');

      Navigator.pop(context);
    }

  }


}
