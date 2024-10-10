import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:microbiocol/api_services/apiservice.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/custom_form.dart';
import 'package:microbiocol/free_tire_pages/feature_page.dart'; // Import your feature page
import 'package:microbiocol/global.dart' as globals;

class SubmitTicket extends StatefulWidget {
  SubmitTicket({super.key});

  @override
  _SubmitTicketState createState() => _SubmitTicketState();
}

class _SubmitTicketState extends State<SubmitTicket> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  File? selectedFile;
  bool isLoading = false;

  // Function to pick image or file from gallery
  Future<void> pickFile() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedFile = File(pickedFile.path);
      });
    }
  }

  // Upload file to Firebase Storage and get URL
  Future<String?> uploadFile(File file) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child('tickets/${file.path.split('/').last}');
      await storageRef.putFile(file);
      return await storageRef.getDownloadURL();
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }

  Future<void> submitTicket() async {
    // Simple form validation
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        subjectController.text.isEmpty ||
        descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields.')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    int? userId = globals.userId;
    String? attachmentUrl;

    try {
      if (selectedFile != null) {
        attachmentUrl = await uploadFile(selectedFile!);
        if (attachmentUrl == null) {
          throw Exception('Failed to upload the attachment.');
        }
      } else {
        // Use a dummy URL if no file is selected
        attachmentUrl = 'https://example.com/dummy-file-url';
      }

      // Call API to submit the ticket
      bool result = await ApiService.submitTicket(
        userId: userId ?? 0,
        name: nameController.text,
        email: emailController.text,
        subject: subjectController.text,
        description: descriptionController.text,
        attachmentUrl: attachmentUrl,
      );

      setState(() {
        isLoading = false;
      });

      if (result) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ticket submitted successfully!'), backgroundColor: Colors.green),
        );
      } else {
        throw Exception('API returned false.');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });

      // Log the detailed error to help identify the issue
      print('Error submitting ticket: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit the ticket: $error'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit a Ticket'),
      ),
      backgroundColor: mwhiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomForm(
                      noOfField: 4,
                      controllers: [
                        nameController,
                        emailController,
                        subjectController,
                        descriptionController,
                      ],
                      hintText: const [
                        "Your Name",
                        "Email",
                        "Subject",
                        "Issue Description",
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Attachments \n(optional)",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: mprimaryColor,
                          ),
                        ),
                        CustommBox(
                          isHasBoxShadow: false,
                          width: 184,
                          height: 36,
                          borderRadius: 8,
                          color: mwhiteColor,
                          widget: GestureDetector(
                            onTap: pickFile,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.file_upload_outlined,
                                  color: mprimaryColor,
                                  size: 20,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Choose from gallery",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: mprimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          isHasBorder: true,
                        ),
                      ],
                    ),
                    if (selectedFile != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Selected File: ${selectedFile!.path.split('/').last}",
                          style: const TextStyle(fontSize: 14, color: mprimaryColor),
                        ),
                      ),
                    const SizedBox(height: 30),
                    isLoading
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            isHasWidget: false,
                            isHasBorder: false,
                            title: "Raise Ticket",
                            onTap: submitTicket,
                          ),
                  ],
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Feature(), // Navigates to the feature suggestion screen
                      ),
                    );
                  },
                  child: const CustomButton(
                    isHasWidget: false,
                    isHasBorder: true,
                    title: "Suggest a Feature",
                    color: mwhiteColor,
                    textColor: mprimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}