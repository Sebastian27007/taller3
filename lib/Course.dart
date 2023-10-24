import 'package:flutter/material.dart';

class Course {
  final String title;
  final String description;
  bool isEnrolled;

  Course(this.title, this.description, this.isEnrolled);
}

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  List<Course> courses = [
    Course('Curso 1', 'Descripción del curso 1', false),
    Course('Curso 2', 'Descripción del curso 2', false),
    Course('Curso 3', 'Descripción del curso 3', false),
    Course('Curso 4', 'Descripción del curso 4', false),
    Course('Curso 5', 'Descripción del curso 5', false),
    Course('Curso 6', 'Descripción del curso 6', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscripción Cursos'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(courses[index].title),
            subtitle: Text(courses[index].description),
            trailing: ElevatedButton(
              onPressed: () {
                setState(() {
                  courses[index].isEnrolled = true;
                });
              },
              child: Text(courses[index].isEnrolled ? 'Inscrito' : 'Inscribirse'),
            ),
          );
        },
      ),
    );
  }
}
