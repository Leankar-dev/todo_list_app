import 'package:flutter/material.dart';

class CustomInfoCard extends StatelessWidget {
  final String titleText;
  final String imageUrl;
  final String firstText;
  final String secondText;
  final double borderRadius;
  final Color backgroundColor;
  final EdgeInsets padding;
  final double imageHeight;
  final double imageWidth;
  final BoxFit imageFit;
  final VoidCallback? onTap;

  const CustomInfoCard({
    super.key,
    required this.titleText,
    required this.imageUrl,
    required this.firstText,
    required this.secondText,
    this.borderRadius = 12,
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.all(16),
    this.imageHeight = 150,
    this.imageWidth = double.infinity,
    this.imageFit = BoxFit.cover,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: padding,
              child: Text(
                titleText,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Image.network(
                imageUrl,
                height: imageHeight,
                width: imageWidth,
                fit: imageFit,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: imageHeight,
                    width: imageWidth,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.image_not_supported,
                      size: 50,
                      color: Colors.grey,
                    ),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: imageHeight,
                    width: imageWidth,
                    color: Colors.grey[300],
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    firstText,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    secondText,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
