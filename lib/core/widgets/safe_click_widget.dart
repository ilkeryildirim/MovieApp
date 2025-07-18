import 'package:flutter/material.dart';

class SafeClickWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Duration cooldownDuration;
  final bool enabled;
  
  const SafeClickWidget({
    super.key,
    required this.child,
    this.onTap,
    this.cooldownDuration = const Duration(milliseconds: 500),
    this.enabled = true,
  });
  
  @override
  State<SafeClickWidget> createState() => _SafeClickWidgetState();
}

class _SafeClickWidgetState extends State<SafeClickWidget> {
  bool _isProcessing = false;
  
  void _handleTap() {
    if (!widget.enabled || _isProcessing || widget.onTap == null) return;
    
    setState(() => _isProcessing = true);
    widget.onTap!();
    
    Future.delayed(widget.cooldownDuration, () {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AbsorbPointer(
        absorbing: _isProcessing || !widget.enabled,
        child: AnimatedOpacity(
          opacity: (_isProcessing || !widget.enabled) ? 0.5 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: widget.child,
        ),
      ),
    );
  }
}

class SafeButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final ButtonStyle? style;
  final Duration? cooldownDuration;
  
  const SafeButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.style,
    this.cooldownDuration,
  });
  
  factory SafeButton.elevated({
    Key? key,
    required VoidCallback? onPressed,
    required Widget child,
    ButtonStyle? style,
    Duration? cooldownDuration,
  }) = _SafeElevatedButton;
  
  factory SafeButton.text({
    Key? key,
    required VoidCallback? onPressed,
    required Widget child,
    ButtonStyle? style,
    Duration? cooldownDuration,
  }) = _SafeTextButton;
  
  factory SafeButton.outlined({
    Key? key,
    required VoidCallback? onPressed,
    required Widget child,
    ButtonStyle? style,
    Duration? cooldownDuration,
  }) = _SafeOutlinedButton;
  
  @override
  Widget build(BuildContext context) {
    return SafeClickWidget(
      onTap: onPressed,
      cooldownDuration: cooldownDuration ?? const Duration(milliseconds: 500),
      enabled: onPressed != null,
      child: ElevatedButton(
        onPressed: () {}, // Handled by SafeClickWidget
        style: style,
        child: child,
      ),
    );
  }
}

class _SafeElevatedButton extends SafeButton {
  const _SafeElevatedButton({
    super.key,
    required super.onPressed,
    required super.child,
    super.style,
    super.cooldownDuration,
  });
  
  @override
  Widget build(BuildContext context) {
    return SafeClickWidget(
      onTap: onPressed,
      cooldownDuration: cooldownDuration ?? const Duration(milliseconds: 500),
      enabled: onPressed != null,
      child: ElevatedButton(
        onPressed: () {}, // Handled by SafeClickWidget
        style: style,
        child: child,
      ),
    );
  }
}

class _SafeTextButton extends SafeButton {
  const _SafeTextButton({
    super.key,
    required super.onPressed,
    required super.child,
    super.style,
    super.cooldownDuration,
  });
  
  @override
  Widget build(BuildContext context) {
    return SafeClickWidget(
      onTap: onPressed,
      cooldownDuration: cooldownDuration ?? const Duration(milliseconds: 500),
      enabled: onPressed != null,
      child: TextButton(
        onPressed: () {}, // Handled by SafeClickWidget
        style: style,
        child: child,
      ),
    );
  }
}

class _SafeOutlinedButton extends SafeButton {
  const _SafeOutlinedButton({
    super.key,
    required super.onPressed,
    required super.child,
    super.style,
    super.cooldownDuration,
  });
  
  @override
  Widget build(BuildContext context) {
    return SafeClickWidget(
      onTap: onPressed,
      cooldownDuration: cooldownDuration ?? const Duration(milliseconds: 500),
      enabled: onPressed != null,
      child: OutlinedButton(
        onPressed: () {}, // Handled by SafeClickWidget
        style: style,
        child: child,
      ),
    );
  }
} 