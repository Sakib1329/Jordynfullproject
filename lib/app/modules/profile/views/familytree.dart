import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FamilyMember {
  final String id;
  final String name;
  Rx<File?> image;

  FamilyMember({required this.id, required this.name, File? initialImage})
      : image = Rx<File?>(initialImage);
}

class FamilyTreeController extends GetxController {
  // Map to store all family members
  final familyMembers = <String, FamilyMember>{}.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with default family structure
    _initializeFamilyTree();
  }

  void _initializeFamilyTree() {
    // First generation
    familyMembers['grandpa'] = FamilyMember(id: 'grandpa', name: 'GRANDPA', initialImage: null);
    familyMembers['grandma'] = FamilyMember(id: 'grandma', name: 'GRANDMA', initialImage: null);

    // Second generation
    familyMembers['dad'] = FamilyMember(id: 'dad', name: 'DAD', initialImage: null);
    familyMembers['mom'] = FamilyMember(id: 'mom', name: 'MOM', initialImage: null);
    familyMembers['uncle'] = FamilyMember(id: 'uncle', name: 'UNCLE', initialImage: null);
    familyMembers['aunt'] = FamilyMember(id: 'aunt', name: 'AUNT', initialImage: null);

    // Third generation
    familyMembers['son1'] = FamilyMember(id: 'son1', name: 'SON', initialImage: null);
    familyMembers['son2'] = FamilyMember(id: 'son2', name: 'SON', initialImage: null);

    // Fourth generation
    familyMembers['grand1'] = FamilyMember(id: 'grand1', name: 'GRAND', initialImage: null);
    familyMembers['grand2'] = FamilyMember(id: 'grand2', name: 'GRAND', initialImage: null);
    familyMembers['grand3'] = FamilyMember(id: 'grand3', name: 'GRAND', initialImage: null);
  }

  Future<void> pickImage(String memberId) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      if (familyMembers.containsKey(memberId)) {
        familyMembers[memberId]!.image.value = imageFile;
      }
    }
  }
}

class FamilyTreePage extends StatelessWidget {
  FamilyTreePage({Key? key}) : super(key: key);

  final FamilyTreeController controller = Get.put(FamilyTreeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              'FAMILY TREE',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        actions: [
          // Empty action to balance the appbar
          SizedBox(width: 48),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // First generation - Grandparents
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFamilyMember('grandpa'),
                const SizedBox(width: 20),
                _buildFamilyMember('grandma'),
              ],
            ),
            _buildConnector(),
            // Second generation - Parents & Aunts/Uncles
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFamilyMember('dad'),
                _buildFamilyMember('mom'),
                _buildFamilyMember('uncle'),
                _buildFamilyMember('aunt'),
              ],
            ),
            _buildConnector(),
            // Third generation - Children
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFamilyMember('son1'),
                const SizedBox(width: 20),
                _buildFamilyMember('son2'),
              ],
            ),
            _buildConnector(),
            // Fourth generation - Grandchildren
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFamilyMember('grand1'),
                const SizedBox(width: 10),
                _buildFamilyMember('grand2'),
                const SizedBox(width: 10),
                _buildFamilyMember('grand3'),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildFamilyMember(String id) {
    return Column(
      children: [
        Obx(() {
          final member = controller.familyMembers[id]!;
          return GestureDetector(
            onTap: () => controller.pickImage(id),
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: const Color(0xFFB3C9A9), // Light green color
                shape: BoxShape.circle,
                image: member.image.value != null
                    ? DecorationImage(
                  image: FileImage(member.image.value!),
                  fit: BoxFit.cover,
                )
                    : null,
              ),
              child: member.image.value == null
                  ? const Icon(Icons.add, color: Colors.white, size: 30)
                  : null,
            ),
          );
        }),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Obx(() {
            final name = controller.familyMembers[id]!.name;
            return Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildConnector() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            width: 2,
            height: 20,
            color: Colors.green,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 180,
                height: 2,
                color: Colors.green,
              ),
            ],
          ),
          Container(
            width: 2,
            height: 20,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}