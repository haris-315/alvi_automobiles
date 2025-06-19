import 'package:alvi_automobiles/presentation/ui/theme/palette/app_palette.dart';
import 'package:flutter/material.dart';

class FaqsSection extends StatefulWidget {
  const FaqsSection({super.key});

  @override
  State<FaqsSection> createState() => _FaqsSectionState();
}

class _FaqsSectionState extends State<FaqsSection> {
  final List<FAQ> _faqs = [
    FAQ(
      question: "Can I do financing?",
      answer:
          "Most of the owners secure their own financing by getting a personal loan.",
    ),
    FAQ(
      question: "Does Alvi Automobiles have any dealers?",
      answer:
          "We sell all our cars online through our platform. This lets us keep the pricing as low as possible.",
    ),
    FAQ(
      question: "Current Capacity",
      answer:
          "Our current capacity is to build 12 Rollers and 3 Turnkey minus cars in 12 months. We are working on expanding our production capacity based on demand.",
    ),
    FAQ(
      question: "EXTRAS & OPTIONS",
      answer:
          "GENZCars supply every single part required to complete the car. Buy online or email us at sales@genz40.com to learn more.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/faq_image.webp",
              width: 300,
              height: 250,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),

        const SizedBox(height: 24),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "FAQs",
            style: TextStyle(
              color: AppPalette.goldAccent,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.1,
            ),
          ),
        ),

        const SizedBox(height: 8),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Find answers to common questions",
            style: TextStyle(
              color: AppPalette.secondaryText.withValues(alpha: 0.8),
              fontSize: 14,
            ),
          ),
        ),

        const SizedBox(height: 24),

        ..._faqs.map((faq) => _buildFaqTile(faq)),

        const SizedBox(height: 32),

        // Text(
        //   "Still have questions?",
        //   style: TextStyle(color: AppPalette.secondaryText, fontSize: 16),
        // ),

        // const SizedBox(height: 12),

        // ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: AppPalette.goldAccent,
        //     padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //   ),
        //   onPressed: () {},
        //   child: Text(
        //     "CONTACT US",
        //     style: TextStyle(
        //       color: Colors.black,
        //       fontWeight: FontWeight.w700,
        //       letterSpacing: 0.8,
        //     ),
        //   ),
        // ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildFaqTile(FAQ faq) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[800]!, width: 1.5),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: Text(
              faq.question,
              style: TextStyle(
                color: Colors.grey[100],
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            iconColor: AppPalette.goldAccent,
            collapsedIconColor: AppPalette.goldAccent,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Text(
                  faq.answer,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FAQ {
  final String question;
  final String answer;

  FAQ({required this.question, required this.answer});
}
