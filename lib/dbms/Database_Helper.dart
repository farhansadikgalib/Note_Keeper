import 'dart:async';
import 'dart:io';

import 'package:note_keeper/model/task_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Database_Helper {
  static final Database_Helper instance = Database_Helper._instance();
  static Database _db;

  Database_Helper._instance();

  String taskTables = 'task_table';
  String colID = 'id';
  String colTitle = 'title';
  String colDate = 'date';
  String colPriority = 'priority';
  String colStatus = 'status';

Future<Database> get db async{
  if(_db == null){
    _db = await _initDB();
  }
  return _db;

}



  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'note_keeper.db';
    final note_keeperDB = await openDatabase(
        path, version: 1, onCreate: _createDB);
    return note_keeperDB;
  }



  void _createDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $taskTables($colID INTEGER PRIMARY KEY AUTOINCREMENT,$colTitle TEXT,$colDate TEXT,$colPriority TEXT,$colStatus INTEGER )',);
  }


  Future<List<Map<String, dynamic>>> getTaskMapList() async{

    Database db= await this.db;

    final List<Map<String, dynamic>> result = await db.query(taskTables);
    return result;
    
    }







    Future<List<Task>> getTaskList () async{

      final List<Map<String,dynamic>> taskMapList = await getTaskMapList();
      final List<Task> taskList = [];

      taskMapList.forEach((taskMap) {
         
         taskList.add(Task.fromMap(taskMap));

      });

      return taskList;

    }


    Future<int> insertTask(Task task) async{

      Database db = await this.db;
      final int result = await db.insert(taskTables, task.toMap());

      return result;



    }





    Future<int> updateTask (Task task) async{

        Database db = await this.db;

        final int result = await db.update(taskTables, task.toMap(),where: '$colID=?',whereArgs: [task.id]);

        return result;

    }



    Future<int> deleteTask (int id) async{

        Database db = await this.db;
        final int result = await db.delete(taskTables,where: '$colID=?',whereArgs: [id]);

        return result;

    }

    




}
