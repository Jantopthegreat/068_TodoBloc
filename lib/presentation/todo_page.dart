import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todo_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();
    final _controller = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            spacing: 10,
            children: [
              SizedBox(height: 25.0),
              Text(
                'Todo List',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Row(
                spacing: 10,
                children: [
                  Column(
                    children: [
                      Text('Selected Date'),
                      BlocBuilder<TodoBloc, TodoState>(
                        builder: (context, state) {
                          if (state is TodoLoaded) {
                            if (state.selectedDate != null) {
                              return Text(
                                '${state.selectedDate!.day}/${state.selectedDate!.month}/${state.selectedDate!.year}',
                              );
                            }
                          }
                          return Text('No date selected');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
