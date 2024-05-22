import 'package:flutter/material.dart';
import 'package:do_an_cuoi_ki/models/food_model.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(
    this.todo, {
    super.key,
    this.onTap,
    this.onEditing,
    this.onDelete,
  });

  final Function()? onTap;
  final Function()? onEditing;
  final Function()? onDelete;
  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14.0)
            .copyWith(left: 16.0, right: 12.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0.0, 3.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              todo.isDone == true
                  ? Icons.check_box_outlined
                  : Icons.check_box_outline_blank,
              size: 16.8,
              color: Colors.orange,
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                todo.text ?? '-:-',
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  decoration: () {
                    if (todo.isDone == true) {
                      return TextDecoration.lineThrough;
                    }
                    return TextDecoration.none;
                  }(),
                ),
              ),
            ),
            GestureDetector(
              onTap: onEditing,
              behavior: HitTestBehavior.translucent,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  backgroundColor: Colors.orange.withOpacity(0.8),
                  radius: 12.6,
                  child:
                      const Icon(Icons.edit, size: 14.0, color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: onDelete,
              behavior: HitTestBehavior.translucent,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.8),
                  radius: 12.6,
                  child: const Icon(Icons.delete,
                      size: 14.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
