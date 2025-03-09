import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

 class Paddinglist extends StatelessWidget {
   const Paddinglist(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
     required this.onChanged,
       required this.deleteFucntion,

      });
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

final Function(BuildContext)? deleteFucntion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 0,
      ),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(onPressed: deleteFucntion,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(20),

          )
        ],),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                checkColor: Colors.black,
                activeColor: Colors.white,
                side:const BorderSide(
                  color: Colors.white,
                ),
              ),
              Text(
                taskName,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.white,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
