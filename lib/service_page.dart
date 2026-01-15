import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  bool isUrgent = false;

  late DateTime selectedDate;
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    // 🔒 HUBIN 100%
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.now();
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ExpansionTile(
              title: const Text('ID Card request'),
              children: [
                const TextField(
                  decoration: InputDecoration(hintText: 'Student Name'),
                ),
                const TextField(
                  decoration: InputDecoration(hintText: 'Reason'),
                ),

                // 📅 DATE PICKER (SAFE)
                ListTile(
                  title: Text(
                    'Date: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () => _pickDate(context),
                ),

                // ⏰ TIME PICKER (SAFE)
                ListTile(
                  title: Text(
                    'Time: ${selectedTime.format(context)}',
                  ),
                  trailing: const Icon(Icons.access_time),
                  onTap: () => _pickTime(context),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Urgent request'),
                    Switch(
                      value: isUrgent,
                      onChanged: (value) {
                        setState(() {
                          isUrgent = value;
                        });
                      },
                    ),
                  ],
                ),

                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Request sent successfully'),
                      ),
                    );
                  },
                  child: const Text('Submit Request'),
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Text('Request Progress'),
            const LinearProgressIndicator(value: 0.7),
            const Text('70% completed'),
          ],
        ),
      ),
    );
  }
}
