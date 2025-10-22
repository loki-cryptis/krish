import 'package:flutter/material.dart';

class NoDataFound extends StatelessWidget {
  final String message;
  final String? imagePath;
  final double? imageSize;
  final Color? textColor;
  final double? fontSize;
  final VoidCallback? onRetry;
  final String? retryText;

  const NoDataFound({
    Key? key,
    this.message = 'No data found',
    this.imagePath,
    this.imageSize = 120.0,
    this.textColor,
    this.fontSize = 16.0,
    this.onRetry,
    this.retryText = 'Retry',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image or Icon
            _buildImage(theme),

            const SizedBox(height: 24.0),

            // Message
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                color: textColor ?? theme.colorScheme.onSurface.withOpacity(0.8),
              ),
            ),

            // Retry button if provided
            if (onRetry != null) ...[
              const SizedBox(height: 24.0),
              _buildRetryButton(theme),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildImage(ThemeData theme) {
    if (imagePath != null) {
      // Use provided image
      return Image.asset(
        imagePath!,
        height: imageSize,
        width: imageSize,
      );
    } else {
      // Default icon with a decorative container
      return Container(
        height: imageSize,
        width: imageSize,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.inbox_rounded,
          size: imageSize! * 0.6,
          color: theme.colorScheme.primary,
        ),
      );
    }
  }

  Widget _buildRetryButton(ThemeData theme) {
    return ElevatedButton.icon(
      onPressed: onRetry,
      icon: const Icon(Icons.refresh_rounded),
      label: Text(retryText!),
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}

// Example usage
class ExampleNoDataScreen extends StatelessWidget {
  const ExampleNoDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('No Data Example'),
      ),
      body: NoDataFound(
        message: 'No items found in your list',
        onRetry: () {
          // Handle retry action
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Refreshing data...')),
          );
        },
      ),
    );
  }
}

// For even more visual appeal, create a custom animated version
class AnimatedNoDataFound extends StatefulWidget {
  final String message;
  final VoidCallback? onRetry;

  const AnimatedNoDataFound({
    Key? key,
    required this.message,
    this.onRetry,
  }) : super(key: key);

  @override
  State<AnimatedNoDataFound> createState() => _AnimatedNoDataFoundState();
}

class _AnimatedNoDataFoundState extends State<AnimatedNoDataFound>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.sentiment_dissatisfied_rounded,
                  size: 80,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                widget.message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.onBackground,
                ),
              ),
              if (widget.onRetry != null) ...[
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: widget.onRetry,
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text('Try Again'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}