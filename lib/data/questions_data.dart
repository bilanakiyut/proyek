import '../models/questions_model.dart';

class QuestionsData {
  //TYPE 2
  static List<Question> type2Questions = [
    //10 CHOICE
    Question(
      question: 'If I ____ you, I would take that opportunity.',
      options: ['am', 'was', 'were', 'be'],
      correct: 'were',
      type: 'choice',
      category: 'type2',
    ),
    Question(
      question: 'If she studied harder, she would pass the exam. Which fact is correct?',
      options: [
        'She doesn’t study hard, so she doesn’t pass the exam.',
        'She studies hard, so she passes the exam.',
        'She passed the exam because she studied hard.',
        'She studies hard, but doesn’t pass.'
      ],
      correct: 'She doesn’t study hard, so she doesn’t pass the exam.',
      type: 'choice',
      category: 'type2',
    ),
    Question(
      question: 'If he had more free time, he could learn to play the guitar. Which fact is correct?',
      options: [
        'He has a lot of free time, so he can learn the guitar.',
        'He doesn’t have much free time, so he cannot learn the guitar.',
        'He practiced the guitar every day.',
        'He learned the guitar last year.'
      ],
      correct: 'He doesn’t have much free time, so he cannot learn the guitar.',
      type: 'choice',
      category: 'type2',
    ),
    Question(
      question: 'If we lived near the beach, we would go swimming every day. Which fact is correct?',
      options: [
        'We live near the beach, so we go swimming every day.',
        'We don’t live near the beach, so we don’t go swimming every day.',
        'We live near the beach and go swimming.',
        'We used to live near the beach.'
      ],
      correct: 'We don’t live near the beach, so we don’t go swimming every day.',
      type: 'choice',
      category: 'type2',
    ),
    Question(
      question: 'If they were taller, they might join the volleyball team. Which fact is correct?',
      options: [
        'They aren’t tall, so they can’t join the volleyball team.',
        'They are tall, so they join the volleyball team.',
        'They were tall last year.',
        'They used to play volleyball.'
      ],
      correct: 'They aren’t tall, so they can’t join the volleyball team.',
      type: 'choice',
      category: 'type2',
    ),
    Question(
      question: 'If I _ (see) her yesterday, I would tell you.',
      options: ['see', 'saw', 'were', 'be'],
      correct: 'saw',
      type: 'choice',
      category: 'type2',
    ),
    Question(
      question: 'If he _ (know) your number, he would call you.',
      options: ['knew', 'known', 'know', 'knaw'],
      correct: 'knew',
      type: 'choice',
      category: 'type2',
    ),
    Question(
      question: 'We could go now if the weather ____ better.',
      options: ['is', 'was', 'were', 'be'],
      correct: 'were',
      type: 'choice',
      category: 'type2',
    ),
    Question(
      question: 'If I had more money, I _ buy a new computer.',
      options: ['would', 'could', 'will', 'can'],
      correct: 'would',
      type: 'choice',
      category: 'type2',
    ),
    Question(
      question: 'If he spoke English, he __ travel anywhere in the world.',
      options: ['would', 'could', 'might', 'should'],
      correct: 'could',
      type: 'choice',
      category: 'type2',
    ),

    //5 MATCHING
    Question(
      question: 'Match the Type 2 sentences:',
      type: 'matching',
      category: 'type2',
      matchLeft: [
        'If I were rich',
        'If she had time',
        'If they were here',
        'If we lived in Japan',
        'If he knew the answer'
      ],
      matchRight: [
        'We would start the event',
        'She would join us',
        'I would travel the world',
        'We would speak Japanese daily',
        'He would tell the teacher'
      ],
      correctPairs: {
        'If I were rich': 'I would travel the world',
        'If she had time': 'She would join us',
        'If they were here': 'We would start the event',
        'If we lived in Japan': 'We would speak Japanese daily',
        'If he knew the answer': 'He would tell the teacher',
      },
    ),
  ];

  //TYPE 3
  static List<Question> type3Questions = [
    //10 CHOICE
    Question(
      question:
          'If you had taken better care of your favorite doll, it wouldn’t have been damaged. Which fact is correct?',
      options: [
        'You didn’t take good care of your doll, so it got damaged.',
        'You took good care of your doll, so it didn’t get damaged.',
        'Your doll was new.',
        'You lost your doll.'
      ],
      correct: 'You didn’t take good care of your doll, so it got damaged.',
      type: 'choice',
      category: 'type3',
    ),
    Question(
      question:
          'If they had checked the map carefully, they might not have gotten lost in the forest. Which fact is correct?',
      options: [
        'They checked the map carefully, so they didn’t get lost.',
        'They didn’t check the map carefully, so they got lost in the forest.',
        'They went to the forest yesterday.',
        'They stayed at home.'
      ],
      correct: 'They didn’t check the map carefully, so they got lost in the forest.',
      type: 'choice',
      category: 'type3',
    ),
    Question(
      question: 'If he __ (not play) games all night, he __ (finish) his homework.',
      options: [
        'had played – would have finished',
        'played – will finish',
        'has played – finishes',
        'hadn’t played – would have finished',
      ],
      correct: 'hadn’t played – would have finished',
      type: 'choice',
      category: 'type3',
    ),
    Question(
      question: 'If he __ (buy) me flowers yesterday, I __ (feel) happier.',
      options: [
        'had bought – would have felt',
        'buys – feels',
        'had been buying – would have felt',
        'bought – feels',
      ],
      correct: 'had bought – would have felt',
      type: 'choice',
      category: 'type3',
    ),
    Question(
      question: 'Jika polisi datang lebih awal, mereka akan menangkap pencurinya.',
      options: [
        'If the police had came earlier, they would have arrested the burglar.',
        'If the police had come earlier, they would have arrested the burglar',
        'If the police come earlier, they arrest the burglar.',
        'If the police were early, they would catch him.'
      ],
      correct: 'If the police had come earlier, they would have arrested the burglar',
      type: 'choice',
      category: 'type3',
    ),
    Question(
      question: 'They ... the task if you had not helped them.',
      options: [
        'would not have complete',
        'completed',
        'would not have completed',
        'had not completed'
      ],
      correct: 'would not have completed',
      type: 'choice',
      category: 'type3',
    ),
    Question(
      question: 'If the driver ...(be) more careful, the accident ... (not happen).',
      options: [
        'had been – might not have happened',
        'was – would not happen',
        'is – does not happen',
        'were – would not happen'
      ],
      correct: 'had been – might not have happened',
      type: 'choice',
      category: 'type3',
    ),
    Question(
      question: 'If you ... (follow) the instructions, you ... (avoid) the mistake.',
      options: [
        'follow – avoided',
        'followed – avoid',
        'had followed – should have avoided',
        'follow – should avoid'
      ],
      correct: 'had followed – should have avoided',
      type: 'choice',
      category: 'type3',
    ),
    Question(
      question: 'Which sentence is better?',
      options: [
        'Her grandfather died last week. If she had known that he was ill, she would have visited him more often.',
        'She knew he was ill and visited him.',
        'Her grandfather was healthy.',
        'She visited him last week.'
      ],
      correct:
          'Her grandfather died last week. If she had known that he was ill, she would have visited him more often.',
      type: 'choice',
      category: 'type3',
    ),
    Question(
      question: 'She would not have given them money if we ... her to.',
      options: [
        'had not advised',
        'did not advise',
        'advise',
        'were not advising'
      ],
      correct: 'had not advised',
      type: 'choice',
      category: 'type3',
    ),

    //5 MATCHING
    Question(
      question: 'Match the Type 3 sentences:',
      type: 'matching',
      category: 'type3',
      matchLeft: [
        'If I had known',
        'If she had seen you',
        'If we had met earlier',
        'If he had studied harder',
        'If they had left earlier'
      ],
      matchRight: [
        'She would have smiled',
        'I would have told you',
        'We would have been friends',
        'He would have passed the exam',
        'They would not have been late'
      ],
      correctPairs: {
        'If I had known': 'I would have told you',
        'If she had seen you': 'She would have smiled',
        'If we had met earlier': 'We would have been friends',
        'If he had studied harder': 'He would have passed the exam',
        'If they had left earlier': 'They would not have been late',
      },
    ),
  ];

  //MIX
  static List<Question> mixQuestions = [
    //10 CHOICE
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
    Question(
      question: 'If she were taller, she ____ join the basketball team.',
      options: ['will', 'would', 'would have', 'can'],
      correct: 'would',
      type: 'choice',
      category: 'mix',
    ),
    Question(
      question: 'If we had known the truth, we ____ helped him.',
      options: ['will', 'would', 'would have', 'must'],
      correct: 'would have',
      type: 'choice',
      category: 'mix',
    ),
    Question(
      question: 'He ____ pass the test if he studied harder.',
      options: ['would', 'could', 'might', 'all are possible'],
      correct: 'all are possible',
      type: 'choice',
      category: 'mix',
    ),
    Question(
      question: 'If you had called me, I ____ come.',
      options: ['would', 'would have', 'will', 'can'],
      correct: 'would have',
      type: 'choice',
      category: 'mix',
    ),
    Question(
      question: 'If we lived in Korea, we ____ speak Korean daily.',
      options: ['would', 'will', 'would have', 'should'],
      correct: 'would',
      type: 'choice',
      category: 'mix',
    ),
    Question(
      question: 'If he had not rushed, he ____ the accident.',
      options: ['avoids', 'would avoid', 'would have avoided', 'avoid'],
      correct: 'would have avoided',
      type: 'choice',
      category: 'mix',
    ),

    //MATCHING
    Question(
      question: 'Match the conditional with its fact:',
      type: 'matching',
      category: 'mix',
      matchLeft: [
        'If I had money',
        'If he were here',
        'If she had worked harder',
        'If they had helped us',
        'If we lived in Japan',
      ],
      matchRight: [
        'I don’t have money',
        'He is not here',
        'She didn’t work hard',
        'They didn’t help us',
        'We don’t live in Japan',
      ],
      correctPairs: {
        'If I had money': 'I don’t have money',
        'If he were here': 'He is not here',
        'If she had worked harder': 'She didn’t work hard',
        'If they had helped us': 'They didn’t help us',
        'If we lived in Japan': 'We don’t live in Japan',
      },
    ),
  ];
}
