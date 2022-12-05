import 'package:bmi_calculator2/result_screen.dart';
import 'package:bmi_calculator2/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

enum Gender { male, female }

final Color? activeCardColor = Colors.indigo[400];
final Color? inActiveCardColor = Colors.indigo[200];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Task 8'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gender selectedGender = Gender.male;
  double tall = 100.0;
  // TextEditingController _textController = TextEditingController();
  double weight = 0;

  final border = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: RCard(
                  title: 'Male',
                  color: selectedGender == Gender.male
                      ? activeCardColor!
                      : inActiveCardColor!,
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                ),
              ),
              Expanded(
                child: RCard(
                  title: 'Female',
                  color: selectedGender == Gender.female
                      ? activeCardColor!
                      : inActiveCardColor!,
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "What's Your Tall:",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Colors.white70,
                          activeTrackColor: Colors.greenAccent,
                          thumbColor: Colors.green,
                          overlayColor: const Color(0x2227d20c),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                          overlayShape:
                              const RoundSliderOverlayShape(overlayRadius: 30),
                        ),
                        child: Slider(
                          value: tall,
                          min: 50,
                          max: 300,
                          onChanged: (value) {
                            setState(() {
                              tall = double.parse(value.toString());
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: Text(
                        tall.toStringAsFixed(0),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              // color: Colors.redAccent,
              child: TextField(
                // controller: _textController,
                onChanged: (value) {
                  setState(() {
                    // print(value);
                    if (value.isEmpty) {
                      weight = 0;
                    } else {
                      weight = double.parse(value);
                    }
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: 'Enter Your weight here',
                  border: border,
                  focusedBorder: border,
                  suffixIcon: const Icon(Icons.tag),
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (weight <= 0) {
                Alert(
                  context: context,
                  type: AlertType.error,
                  title: "ERROR",
                  desc: "Please enter your weight!",
                  buttons: [
                    DialogButton(
                      onPressed: () => Navigator.pop(context),
                      width: 120,
                      child: const Text(
                        "OK!",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ).show();
              } else {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => ResultScreen(
                      tall: tall.toInt(),
                      weight: weight,
                    ),
                  ),
                );
              }
            },
            child: Ink(
              color: Colors.green,
              child: Container(
                height: 90,
                alignment: Alignment.center,
                child: const Text(
                  'Calculator',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
