import 'package:flutter/material.dart';

void main() {
  runApp(
      const MaterialApp(debugShowCheckedModeBanner: false, home: MyStapper()));
}

class MyStapper extends StatefulWidget {
  const MyStapper({Key? key}) : super(key: key);

  @override
  State<MyStapper> createState() => _MyStapperState();
}

class _MyStapperState extends State<MyStapper> {
  int stapindex = 0;
  List<GlobalKey<FormState>> formkey =
      List.generate(8, (index) => GlobalKey<FormState>());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stapper",
          style: TextStyle(letterSpacing: 10),
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Stepper(
          onStepTapped: (int index) {
            setState(() {
              (stapindex <= 7)
                  ? (formkey[stapindex].currentState!.validate())
                      ? (stapindex < 7)
                          ? setState(() => stapindex++)
                          : ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  content: Text("All Details Complete")))
                      : null
                  : null;
            });
          },
          currentStep: stapindex,
          controlsBuilder: (context, details) => Container(),
          steps: [
            Step(
              isActive: stapindex >= 0,
              state: stapindex <= 0 ? StepState.editing : StepState.complete,
              content: Form(
                key: formkey[0],
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Details";
                        } else {
                          null;
                        }
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              title: const Text("First Name"),
            ),
            Step(
              isActive: stapindex >= 1,
              state: stapindex <= 1 ? StepState.editing : StepState.complete,
              content: Form(
                key: formkey[1],
                child: TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Details";
                    } else {
                      return null;
                    }
                  },
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              title: const Text("Last Name"),
            ),
            Step(
              isActive: stapindex >= 2,
              state: stapindex <= 2 ? StepState.editing : StepState.complete,
              content: Form(
                key: formkey[2],
                child: TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Details";
                    } else {
                      return null;
                    }
                  },
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              title: const Text("Email"),
            ),
            Step(
              isActive: stapindex >= 3,
              state: stapindex <= 3 ? StepState.editing : StepState.complete,
              content: Form(
                key: formkey[3],
                child: TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Details";
                    } else {
                      return null;
                    }
                  },
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              title: const Text("Contact No."),
            ),
            Step(
              isActive: stapindex >= 4,
              state: stapindex <= 4 ? StepState.editing : StepState.complete,
              content: Form(
                key: formkey[4],
                child: TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Details";
                    } else {
                      return null;
                    }
                  },
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              title: const Text("Address"),
            ),
            Step(
              isActive: stapindex >= 5,
              state: stapindex <= 5 ? StepState.editing : StepState.complete,
              content: Form(
                key: formkey[5],
                child: TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Details";
                    } else {
                      return null;
                    }
                  },
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              title: const Text("Nationality"),
            ),
            Step(
              isActive: stapindex >= 6,
              state: stapindex <= 6 ? StepState.editing : StepState.complete,
              content: Form(
                key: formkey[6],
                child: TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Details";
                    } else {
                      return null;
                    }
                  },
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              title: const Text("Date Of Birth"),
            ),
            Step(
              isActive: stapindex >= 7,
              state: stapindex <= 7 ? StepState.editing : StepState.complete,
              content: Form(
                key: formkey[7],
                child: TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Details";
                    } else {
                      return null;
                    }
                  },
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              title: const Text("Gender"),
            ),
          ],
        ),
      ),
    );
  }
}
