import 'package:flutter/material.dart';
import 'package:note_keeper/Screens/add_task_screen.dart';
class todoListScreen extends StatefulWidget {
  @override
  _todoListScreenState createState() => _todoListScreenState();
}

class _todoListScreenState extends State<todoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add,color: Colors.white,),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder:(_)=> AddTaskScreen())),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 30),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Tasks",
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "1-5",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            );
          }
          return _buildTask(index);
        },
      ),



    );
  }

  Widget _buildTask(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ListTile(
            title: Text("Task Title"),
            subtitle: Text("Jan"),
            trailing: Checkbox( onChanged:(value){
              print(value);
            },
              activeColor: Theme.of(context).primaryColor,
              value: true,
            ),

          ),
          Divider()

        ],
      ),


    );


  }
}
