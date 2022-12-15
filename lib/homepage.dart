import 'package:employee_bloc/Models/employee.dart';
import 'package:employee_bloc/utils/emloyee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmployeeBloc _employeeBloc = EmployeeBloc();

  //Make sure to dispose the streams
  @override
  void dispose() {
    super.dispose();
    _employeeBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Salary"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<List<Employee>>(
          stream: _employeeBloc.getEmployeeListStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      leading: Text("${snapshot.data![index].getId}"),
                      title: Text(snapshot.data![index].getName),
                      subtitle: Text("${snapshot.data![index].getSalary}"),
                      trailing: SizedBox(
                        width: 96,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () {
                                _employeeBloc.getDecrementStream
                                    .add(snapshot.data![index]);
                              },
                              icon: const Icon(
                                Icons.arrow_downward_rounded,
                                color: Colors.red,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                _employeeBloc.getIncrementStream
                                    .add(snapshot.data![index]);
                              },
                              icon: const Icon(
                                Icons.arrow_upward_rounded,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(
                              width: 24,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
