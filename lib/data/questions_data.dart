import '../models/questions_model.dart';

class QuestionsData {
  // ============================================================
  //   TYPE 2 — 15 SOAL (10 choice + 5 matching)
  // ============================================================
  static List<Question> type2Questions = [
    // ---- 10 CHOICE ---
    Question(
      question: 'If I ____ you, I would take that opportunity.',
      options: ['am', 'was', 'were', 'be'],
      correct: 'were',
      type: 'choice',
      category: 'type2'
    ),
    Question(
      question: 'She would help you if she ____ more time.',
      options: ['has', 'had', 'have', 'having'],
      correct: 'had',
      type: 'choice',
      category: 'type2'
    ),
    Question(
      question: 'If they ____ a car, they would travel more.',
      options: ['have', 'had', 'having', 'has'],
      correct: 'had',
      type: 'choice',
      category: 'type2'
    ),
    Question(
      question: 'If he ____ stronger, he could lift that box.',
      options: ['is', 'was', 'were', 'be'],
      correct: 'were',
      type: 'choice',
      category: 'type2'
    ),
    Question(
      question: 'If we ____ money, we would buy a new house.',
      options: ['have', 'had', 'having', 'has'],
      correct: 'had',
      type: 'choice',
      category: 'type2'
    ),
    Question(
      question: 'If she ____ taller, she would join basketball.',
      options: ['is', 'was', 'were', 'be'],
      correct: 'were',
      type: 'choice',
      category: 'type2'
    ),
    Question(
      question: 'If I ____ enough courage, I would talk to him.',
      options: ['have', 'had', 'having', 'has'],
      correct: 'had',
      type: 'choice',
      category: 'type2'
    ),
    Question(
      question: 'We could go now if the weather ____ better.',
      options: ['is', 'was', 'were', 'be'],
      correct: 'were',
      type: 'choice',
      category: 'type2'
    ),
    Question(
      question: 'If you ____ rich, what would you buy?',
      options: ['are', 'were', 'was', 'be'],
      correct: 'were',
      type: 'choice',
      category: 'type2'
    ),
    Question(
      question: 'If she ____ the skill, she would apply today.',
      options: ['has', 'had', 'have', 'having'],
      correct: 'had',
      type: 'choice',
      category: 'type2'
    ),

    // ---- 5 MATCHING ----
    Question(
      question: 'Match the Type 2 sentences:',
      type: 'matching',
      category: 'type2',
      matchLeft: [
        'If I were rich',
        'If she had time',
        'If they were here',
      ],
      matchRight: [
        'I would travel the world',
        'She would join us',
        'We would start the event',
      ],
      correctPairs: {
        'If I were rich': 'I would travel the world',
        'If she had time': 'She would join us',
        'If they were here': 'We would start the event',
      },
    ),
    Question(
      question: 'Match each Type 2 condition with result:',
      type: 'matching',
      category: 'type2',
      matchLeft: [
        'If I were you',
        'If he had money',
        'If we had a car',
      ],
      matchRight: [
        'I would study abroad',
        'I would buy a bike',
        'We would drive to Bandung',
      ],
      correctPairs: {
        'If I were you': 'I would study abroad',
        'If he had money': 'I would buy a bike',
        'If we had a car': 'We would drive to Bandung',
      },
    ),
  ];
  

  // ============================================================
  //   TYPE 3 — 15 SOAL
  // ============================================================
  static List<Question> type3Questions = [
    // ---- 10 CHOICE ----
    Question(
      question: 'She would have won if she ____ harder.',
      options: ['study', 'studied', 'had studied', 'has studied'],
      correct: 'had studied',
      type: 'choice',
      category: 'type3',
    ),
    Question(
      question: 'If he ____ earlier, he would have caught the bus.',
      options: ['wake', 'woke', 'had woken', 'was waking'],
      correct: 'had woken',
      type: 'choice',
      category: 'type3',
    ),
    Question(
      question: 'If they ____ the truth, they would have helped.',
      options: ['knew', 'know', 'had known', 'have known'],
      correct: 'had known',
      type: 'choice',
      category: 'type3',
    ),
    Question(
      question: 'If we ____ faster, we would have finished earlier.',
      options: ['work', 'worked', 'had worked', 'were working'],
      correct: 'had worked',
      type: 'choice',
      category: 'type3',
    ),
    Question(
      question: 'I would have called you if I ____ your number.',
      options: ['know', 'knew', 'had known', 'have known'],
      correct: 'had known',
      type: 'choice',
      category: 'type3',
    ),
    Question(
      question: 'He would have passed if he ____ more seriously.',
      options: ['study', 'studied', 'had studied', 'was studying'],
      correct: 'had studied',
      type: 'choice',
      category: 'type3',
    ),
    Question(
      question: 'If she ____ earlier, she wouldn’t have been late.',
      options: ['leave', 'left', 'had left', 'was leaving'],
      correct: 'had left',
      type: 'choice',
      category: 'type3',
    ),
    Question(
      question: 'They would have stayed longer if they ____ time.',
      options: ['have', 'had', 'had had', 'having'],
      correct: 'had had',
      type: 'choice',
      category: 'type3',
    ),
    Question(
      question: 'If I ____ the chance, I would have joined.',
      options: ['get', 'got', 'had gotten', 'was getting'],
      correct: 'had gotten',
      type: 'choice',
      category: 'type3',
    ),
    Question(
      question: 'We would have gone if the weather ____ good.',
      options: ['was', 'were', 'had been', 'be'],
      correct: 'had been',
      type: 'choice',
      category: 'type3',
    ),

    // ---- 5 MATCHING ----
    Question(
      question: 'Match the Type 3 sentences:',
      type: 'matching',
      category: 'type3',
      matchLeft: [
        'If I had known',
        'If she had seen you',
        'If we had met earlier',
      ],
      matchRight: [
        'I would have told you',
        'She would have smiled',
        'We would have been friends',
      ],
      correctPairs: {
        'If I had known': 'I would have told you',
        'If she had seen you': 'She would have smiled',
        'If we had met earlier': 'We would have been friends',
      },
    ),
  ];

  // ============================================================
  //   MIX — 15 SOAL BARU
  // ============================================================
  static List<Question> mixQuestions = [
    // --- 8 CHOICE ---
    Question(
      question: 'If I were rich, I ____ donate more.',
      options: ['will', 'would', 'would have', 'had'],
      correct: 'would',
      type: 'choice',
      category: 'mix',
    ),
    Question(
      question: 'She would have come if she ____ the message.',
      options: ['see', 'saw', 'had seen', 'has seen'],
      correct: 'had seen',
      type: 'choice',
      category: 'mix',
    ),
    Question(
      question: 'If he had time, he ____ help us.',
      options: ['would', 'will', 'would have', 'had'],
      correct: 'would',
      type: 'choice',
      category: 'mix',
    ),
    Question(
      question: 'If they had left earlier, they ____ on time.',
      options: ['arrive', 'would arrive', 'would have arrived', 'arrived'],
      correct: 'would have arrived',
      type: 'choice',
      category: 'mix',
    ),

    // --- 7 MATCHING ---
    Question(
      question: 'Match each conditional sentence:',
      type: 'matching',
      category: 'mix',
      matchLeft: [
        'If I had money',
        'If he were here',
        'If she had worked harder',
      ],
      matchRight: [
        'I would buy a bicycle',
        'He would help us',
        'She would have succeeded',
      ],
      correctPairs: {
        'If I had money': 'I would buy a bicycle',
        'If he were here': 'He would help us',
        'If she had worked harder': 'She would have succeeded',
      },
    ),
  ];
}
