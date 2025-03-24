import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String? id;
  final String title;
  final String description;
  final DateTime dueDate;
  final String? location;
  final List<String> assignedMembers;
  final DateTime createdAt;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    this.location,
    required this.assignedMembers,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  // Convert Task to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'dueDate': Timestamp.fromDate(dueDate),
      'location': location,
      'assignedMembers': assignedMembers,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  // Create Task from Firestore document
  factory Task.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Task(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      dueDate: (data['dueDate'] as Timestamp).toDate(),
      location: data['location'],
      assignedMembers: List<String>.from(data['assignedMembers'] ?? []),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  // Create copy of Task with modifications
  Task copyWith({
    String? title,
    String? description,
    DateTime? dueDate,
    String? location,
    List<String>? assignedMembers,
  }) {
    return Task(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      location: location ?? this.location,
      assignedMembers: assignedMembers ?? this.assignedMembers,
      createdAt: createdAt,
    );
  }
}
