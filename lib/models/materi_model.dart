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
    description: 
        'The Conditional Sentence Type 2 is a type of English hypothetical sentence used to express a situation that is hypothetical, unreal, or unlikely to happen in the present or future, along with the consequence that would occur if that condition were fulfilled. Simply put, Conditional Type 2 discusses what would happen if a condition that is currently impossible or untrue became a reality.',
    formula: 'If + Past Simple (Subject + V2), Subject + Would/Could/Might + Infinitive',
    examples: [
      'If I won a million dollars, I would buy a new car.\nFact: I haven\'t won a million dollars, so I won\'t/can\'t buy a new car.',
      
      'If I were the president, I would lower taxes.\nFact: I am not the president, so I can\'t lower taxes.',
      
      'If I had more free time, I could travel around the world.\nFact: I don\'t have more free time, so I can\'t travel around the world.',
      
      '【Would】- Used for the main result or something that was almost certain:\nIf I were you, I would accept the job offer.\nFact: I am not you, so I can\'t accept the job offer in your place.',
      
      'If they had more money, they would buy a bigger house.\nFact: They don\'t have enough money, so they can\'t buy a bigger house.',
      
      '【Could】- Used for ability or possibility in the hypothetical situation:\nIf he spoke English, he could travel anywhere in the world.\nFact: He doesn\'t speak English, so he can\'t travel anywhere easily.',
      
      'If we lived closer, we could meet every weekend.\nFact: We don\'t live close to each other, so we can\'t meet every weekend.',
      
      '【Might】- Used for lower possibility or uncertainty of the result:\nIf I told him the secret, he might tell someone else.\nFact: I\'m not telling him the secret, so he won\'t tell anyone else.',
      
      'If you apologized, she might forgive you.\nFact: You aren\'t apologizing, so she might not forgive you.',
    ],
    videoUrl: 'https://youtu.be/71u-NoY4Ag8?si=89KM2PeZox8JixVo',
    type: 2,
  ),
  
  MateriModel(
    title: 'Conditional Sentence Type 3',
    description: 
        'The third conditional (also called conditional type 3) is a structure used to talk about regrets in the past. It describes situations where something did not happen as we wished, and we feel sorry about the result. A third conditional sentence has an if clause and a main clause.',
    formula: 'If + Past Perfect (Subject + had + V3), Subject + would/should/could/might + have + V3',
    examples: [
      'If you had asked me yesterday, I would have answered you.\nFact: You didn\'t ask me yesterday, so I didn\'t answer you.',
      
      'If you had passed your exam, you could have gone to the beach.\nFact: You didn\'t pass your exam, so you couldn\'t go to the beach.',
      
      'If he had known, he wouldn\'t have done that.\nFact: He didn\'t know, so he did that.',
      
      '【Would + have + V3】- Used for the main result or something that was almost certain:\nIf I had studied, I would have passed the exam.\nFact: You didn\'t study, so you didn\'t pass the exam.',
      
      '【Should + have + V3】- Used for duty, responsibility, or something that was supposed to happen. It often shows regret:\nIf you had listened to me, you should have avoided the problem.\nFact: You didn\'t listen to me, so you didn\'t avoid the problem.',
      
      '【Could + have + V3】- Used for ability or possibility in the past:\nIf we had taken a taxi, we could have arrived on time.\nFact: We didn\'t take a taxi, so we didn\'t arrive on time.',
      
      '【Might + have + V3】- Used for a weaker possibility or speculation:\nIf he had practiced more, he might have won the competition.\nFact: He didn\'t practice enough, so he didn\'t win the competition.',
    ],
    videoUrl: 'https://youtu.be/xwOCqtaZDrk?si=U3Yz7Ej6r-xGhUpN',
    type: 3,
  ),
];
