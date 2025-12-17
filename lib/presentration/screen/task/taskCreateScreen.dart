import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils_style/style.dart';
import '../../getx/taskGetx/createTask.dart';

class CreateTaskScreen extends StatelessWidget {
  CreateTaskScreen({super.key});
  final createTaskGetx ctg=Get.put(createTaskGetx());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Task"),
        centerTitle: true,
        backgroundColor: colorGreen,
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Center(
            child: ctg.loading.value
                ? CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Add New Task", style: Head1Text(colorDarkBlue)),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) {
                            ctg.importValue("title", value);
                          },
                          decoration: AppInputDecoration("Task Name"),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) {
                            ctg.importValue("description", value);
                          },
                          maxLines: 10,
                          decoration: AppInputDecoration("Task Description"),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            ctg.callData();
                          },
                          style: AppButtonStyle(colorGreen),
                          child: Text("Add Task", style: ButtonTextStyle()),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
