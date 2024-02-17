import 'package:flutter/material.dart';

import '../services/predict_service.dart';

class Results extends StatefulWidget {
  final List isCheckedList;
  const Results({super.key, required this.isCheckedList});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  bool isLoading = false;

  late Map result;

  @override
  void initState() {
    predict(widget.isCheckedList);
    super.initState();
  }

  void predict(isCheckedList) async {
    setState(() {
      isLoading = true;
    });
    result = await PredictService().sendDataToAPI(isCheckedList);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Results',
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Disease Name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          result['disease_name'],
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Probability',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          result['probability'] + "%",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
