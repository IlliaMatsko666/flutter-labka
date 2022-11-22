import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      home: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: MyStatefulWidget(),

      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Center(
              child: Container(
                height: 200,
                width: 400,
                alignment: Alignment.center,
                child: const Text(
                  "Вхід",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                  // textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(550, 10, 550, 0),
              child: TextField(
                style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black
                ),
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  labelText: "Імʼя",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(550, 10, 550, 0),
              child: TextField(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
                controller: surnameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(

                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  labelText: 'Пароль',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(550, 10, 550, 0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(0, 0, 0, 1.0),
                        fixedSize: const Size(60, 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: const Text('Ввійти'),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return NewRoute(surnameController.text,nameController.text);
                      }));
                    }
                )
            ),
          ],
        ));
  }
}

class NewRoute extends StatelessWidget {
  final String password,name;
  const NewRoute(this.password, this.name, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: const Text("Вітаю"),
      ),
      body: Center(
          child: Text('Ну шо, ти зайшов сюда і маєш keylogger з майнером, дякую тобі \n$name',
            style: const TextStyle(color: Colors.black,fontSize: 27),)
      ),
    );
  }
}
