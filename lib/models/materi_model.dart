class MateriModel {
  final String title;
  final String description;
  final String formula;
  final List<String> examples;
  final String videoUrl;
  final int type;

  MateriModel({
    required this.title,
    required this.description,
    required this.formula,
    required this.examples,
    required this.videoUrl,
    required this.type,
  });
}

final List<MateriModel> materiList = [
  MateriModel(
    title: 'Conditional Sentence Type 2',
    description: 'Used for unreal or imaginary situations in the present or future...',
    formula: 'If + Subject + V2 (past), Subject + would/could/might + V1',
    examples: [
      'If I had money, I would buy a car.',
      'If she studied harder, she could pass the exam.',
    ],
    videoUrl: 'https://youtu.be/kVnecr5a1Sc?si=Ais0ulpr-i1W5GFu',
    type: 2,
  ),
  MateriModel(
    title: 'Conditional Sentence Type 3',
    description: 'Used for situations that did not happen in the past...',
    formula: 'If + Subject + had + V3, Subject + would/could/might + have + V3',
    examples: [
      'If I had known, I would have helped you.',
    ],
    videoUrl: 'https://youtu.be/kVnecr5a1Sc?si=Ais0ulpr-i1W5GFu',
    type: 3,
  ),
];
