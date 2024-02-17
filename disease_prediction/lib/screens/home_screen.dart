import 'package:disease_prediction/screens/results.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  Map pages = SymptomNames().names;

  Map<int, bool> isChecked = Map.fromEntries(
    List.generate(
      132,
      (index) => MapEntry(index, false),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Symptoms",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Please select symptoms.",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    for (dynamic item in pages.keys
                        .toList()
                        .getRange(currentPage, currentPage + 6))
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked[pages[item]],
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked[pages[item]] = value!;
                              });
                            },
                          ),
                          Text(item)
                        ],
                      ),
                    const SizedBox(height: 20),
                    // right and left arrows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (currentPage > 1)
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                currentPage -= 6;
                              });
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              size: 30,
                            ),
                          ),
                        if (currentPage < 126)
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                currentPage += 6;
                              });
                            },
                            child: const Icon(
                              Icons.arrow_forward,
                              size: 30,
                            ),
                          ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        '${(currentPage / 6 + 1).toString().replaceAll('.0', '')} / ${22}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Results(isCheckedList: isChecked.values.toList()),
                      ));
                },
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(350, 50)),
                    backgroundColor: MaterialStatePropertyAll(Colors.red[900]),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    textStyle: const MaterialStatePropertyAll(
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
                child: const Text('Predict'),
              ),
            )
          ],
        ));
  }
}

class SymptomNames {
  Map<dynamic, dynamic> names = {
    'itching': 0,
    'skin rash': 1,
    'nodal skin eruptions': 2,
    'continuous sneezing': 3,
    'shivering': 4,
    'chills': 5,
    'joint pain': 6,
    'stomach pain': 7,
    'acidity': 8,
    'ulcers on tongue': 9,
    'muscle wasting': 10,
    'vomiting': 11,
    'burning micturition': 12,
    'spotting  urination': 13,
    'fatigue': 14,
    'weight gain': 15,
    'anxiety': 16,
    'cold hands and feets': 17,
    'mood swings': 18,
    'weight loss': 19,
    'restlessness': 20,
    'lethargy': 21,
    'patches in throat': 22,
    'irregular sugar level': 23,
    'cough': 24,
    'high fever': 25,
    'sunken eyes': 26,
    'breathlessness': 27,
    'sweating': 28,
    'dehydration': 29,
    'indigestion': 30,
    'headache': 31,
    'yellowish skin': 32,
    'dark urine': 33,
    'nausea': 34,
    'loss of appetite': 35,
    'pain behind the eyes': 36,
    'back pain': 37,
    'constipation': 38,
    'abdominal pain': 39,
    'diarrhoea': 40,
    'mild fever': 41,
    'yellow urine': 42,
    'yellowing of eyes': 43,
    'acute liver failure': 44,
    'fluid overload': 45,
    'swelling of stomach': 46,
    'swelled lymph nodes': 47,
    'malaise': 48,
    'blurred and distorted vision': 49,
    'phlegm': 50,
    'throat irritation': 51,
    'redness of eyes': 52,
    'sinus pressure': 53,
    'runny nose': 54,
    'congestion': 55,
    'chest pain': 56,
    'weakness in limbs': 57,
    'fast heart rate': 58,
    'pain during bowel movements': 59,
    'pain in anal region': 60,
    'bloody stool': 61,
    'irritation in anus': 62,
    'neck pain': 63,
    'dizziness': 64,
    'cramps': 65,
    'bruising': 66,
    'obesity': 67,
    'swollen legs': 68,
    'swollen blood vessels': 69,
    'puffy face and eyes': 70,
    'enlarged thyroid': 71,
    'brittle nails': 72,
    'swollen extremeties': 73,
    'excessive hunger': 74,
    'extra marital contacts': 75,
    'drying and tingling lips': 76,
    'slurred speech': 77,
    'knee pain': 78,
    'hip joint pain': 79,
    'muscle weakness': 80,
    'stiff neck': 81,
    'swelling joints': 82,
    'movement stiffness': 83,
    'spinning movements': 84,
    'loss of balance': 85,
    'unsteadiness': 86,
    'weakness of one body side': 87,
    'loss of smell': 88,
    'bladder discomfort': 89,
    'foul smell of urine': 90,
    'continuous feel of urine': 91,
    'passage of gases': 92,
    'internal itching': 93,
    'toxic look (typhos)': 94,
    'depression': 95,
    'irritability': 96,
    'muscle pain': 97,
    'altered sensorium': 98,
    'red spots over body': 99,
    'belly pain': 100,
    'abnormal menstruation': 101,
    'dischromic  patches': 102,
    'watering from eyes': 103,
    'increased appetite': 104,
    'polyuria': 105,
    'family history': 106,
    'mucoid sputum': 107,
    'rusty sputum': 108,
    'lack of concentration': 109,
    'visual disturbances': 110,
    'receiving blood transfusion': 111,
    'receiving unsterile injections': 112,
    'coma': 113,
    'stomach bleeding': 114,
    'distention of abdomen': 115,
    'history of alcohol consumption': 116,
    'fluid overload.1': 117,
    'blood in sputum': 118,
    'prominent veins on calf': 119,
    'palpitations': 120,
    'painful walking': 121,
    'pus filled pimples': 122,
    'blackheads': 123,
    'scurring': 124,
    'skin peeling': 125,
    'silver like dusting': 126,
    'small dents in nails': 127,
    'inflammatory nails': 128,
    'blister': 129,
    'red sore around nose': 130,
    'yellow crust ooze': 131,
  };
}
