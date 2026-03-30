import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_images.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/utils/functions.dart';
import 'package:live_score_app/core/widgets/custom_scaffold.dart';
import 'package:live_score_app/features/slider%20menu/presentation/widgets/support_button.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Contact Us', style: AppStyles.heading18),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'We’re always happy to hear from you! ⚽\n\n'
                'If you have any questions, feedback, suggestions, or if you experience any issues while using our Live Score app, feel free to reach out to us. Your feedback helps us improve the app and deliver a better experience for all football fans.\n\n'
                'Our support team will do their best to respond as quickly as possible.',
                style: AppStyles.body14,
              ),
              SizedBox(height: 40),
              Text(
                'Get in touch with us:',
                style: AppStyles.body14.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              SupportButton(
                icon: AppImages.gmail,
                text: 'Email',
                onPressed: () => openUrl(
                  url:
                      'mailto:kareemarafat72@email.com?subject=Live Score App Support',
                ),
              ),
              Text(
                'For general inquiries or detailed issues, send us an email and we’ll get back to you soon.',
                style: AppStyles.grayBody12,
              ),
              SizedBox(height: 20),
              SupportButton(
                icon: AppImages.whatsapp,
                text: 'WhatsApp',
                onPressed: () => openUrl(url: 'https://wa.me/201066962146'),
              ),
              Text(
                'For faster communication, you can contact us directly on WhatsApp.',
                style: AppStyles.grayBody12,
              ),

              SizedBox(height: 24),

              Text(
                'Thank you for using our app and supporting us ❤️',
                style: AppStyles.body14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
