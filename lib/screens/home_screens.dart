import 'package:flutter/material.dart';
import 'package:untitled11/utils/padding.dart';

class HomeScreens extends StatefulWidget {
 const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  List toDoList = [['Grocery 1pm', false,],
                    ['Drink Coffe', false,],
  ];

  void checkBoxchange(int index){
    setState(() {
      toDoList[index][1]=!toDoList[index][1];
    });
  }

  final controller=TextEditingController();
  void saveNewTask(){
    setState(() {
      toDoList.add([controller.text, false]);
         controller.clear();
    });
  }

  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        title: const Text('today'),
      ),
      body: ListView.builder(itemCount: toDoList.length,
          itemBuilder: (BuildContext context, index) {
            return Paddinglist(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged:(value)=> checkBoxchange(index),
              deleteFucntion: (context)=> deleteTask(index),

            );}),
      floatingActionButton: Row(
        children: [
          Expanded(
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                    hintText: 'Add new items',
                    fillColor: Colors.deepPurple.shade200,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,),
                    borderRadius: BorderRadius.circular(15),
                    ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.deepPurple,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: FloatingActionButton(onPressed:
             saveNewTask, child: const Icon(Icons.add,),),
          ),
        ],
      ),

    );
  }
}
