//
// enum ThumbStyle { circle, rectangle, diamond }
//
// class CustomProgress extends StatefulWidget {
//   final double progress;
//   final double height;
//   final Color backgroundColor;
//   final Color progressColor;
//   final Color thumbColor;
//   final double thumbSize;
//   final double radius;
//   final bool showThumb;
//   final ThumbStyle thumbStyle;
//   final bool thumbShadow;
//   final ValueChanged<double>? onChanged;
//
//   const CustomProgress({
//     Key? key,
//     required this.progress,
//     this.height = 20.0,
//     this.backgroundColor = Colors.grey,
//     this.progressColor = Colors.blue,
//     this.thumbColor = Colors.blue,
//     this.thumbSize = 20.0,
//     this.radius = 10.0,
//     this.showThumb = true,
//     this.thumbStyle = ThumbStyle.circle,
//     this.thumbShadow = false,
//     this.onChanged,
//   }) : super(key: key);
//
//   @override
//   _CustomProgressState createState() => _CustomProgressState();
// }
//
// class _CustomProgressState extends State<CustomProgress> {
//   late double _localProgress;
//   bool _isDragging = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _localProgress = widget.progress;
//   }
//
//   @override
//   void didUpdateWidget(CustomProgress oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.progress != widget.progress && !_isDragging) {
//       _localProgress = widget.progress;
//     }
//   }
//
//   void _updateProgress(Offset localPosition, BoxConstraints constraints) {
//     final RenderBox box = context.findRenderObject() as RenderBox;
//     final Offset offset = box.globalToLocal(localPosition);
//
//     double newProgress = offset.dx / constraints.maxWidth;
//
//     // Clamp progress between 0.0 and 1.0
//     newProgress = newProgress.clamp(0.0, 1.0);
//
//     if (newProgress != _localProgress) {
//       setState(() {
//         _localProgress = newProgress;
//       });
//
//       if (widget.onChanged != null) {
//         widget.onChanged!(_localProgress);
//       }
//     }
//   }
//
//   Widget _buildThumb() {
//     switch (widget.thumbStyle) {
//       case ThumbStyle.rectangle:
//         return Container(
//           width: widget.thumbSize,
//           height: widget.thumbSize,
//           decoration: BoxDecoration(
//             color: widget.thumbColor,
//             borderRadius: BorderRadius.circular(2.0),
//             boxShadow: widget.thumbShadow
//                 ? [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.3),
//                 blurRadius: 3.0,
//                 offset: const Offset(0, 1),
//               )
//             ]
//                 : null,
//           ),
//         );
//       case ThumbStyle.diamond:
//         return Transform.rotate(
//           angle: 0.785398, // 45 degrees in radians
//           child: Container(
//             width: widget.thumbSize,
//             height: widget.thumbSize,
//             decoration: BoxDecoration(
//               color: widget.thumbColor,
//               borderRadius: BorderRadius.circular(2.0),
//               boxShadow: widget.thumbShadow
//                   ? [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.3),
//                   blurRadius: 3.0,
//                   offset: const Offset(0, 1),
//                 )
//               ]
//                   : null,
//             ),
//           ),
//         );
//       case ThumbStyle.circle:
//       default:
//         return Container(
//           width: widget.thumbSize,
//           height: widget.thumbSize,
//           decoration: BoxDecoration(
//             color: widget.thumbColor,
//             shape: BoxShape.circle,
//             boxShadow: widget.thumbShadow
//                 ? [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.3),
//                 blurRadius: 3.0,
//                 offset: const Offset(0, 1),
//               )
//             ]
//                 : null,
//           ),
//         );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return GestureDetector(
//           onHorizontalDragStart: (details) {
//             if (widget.onChanged != null) {
//               _isDragging = true;
//               _updateProgress(details.globalPosition, constraints);
//             }
//           },
//           onHorizontalDragUpdate: (details) {
//             if (widget.onChanged != null) {
//               _updateProgress(details.globalPosition, constraints);
//             }
//           },
//           onHorizontalDragEnd: (details) {
//             if (widget.onChanged != null) {
//               _isDragging = false;
//             }
//           },
//           onTapDown: (details) {
//             if (widget.onChanged != null) {
//               _updateProgress(details.globalPosition, constraints);
//             }
//           },
//           child: Stack(
//             alignment: Alignment.centerLeft,
//             children: [
//               // Background
//               Container(
//                 width: constraints.maxWidth,
//                 height: widget.height,
//                 decoration: BoxDecoration(
//                   color: widget.backgroundColor,
//                   borderRadius: BorderRadius.circular(widget.radius),
//                 ),
//               ),
//               // Progress
//               Container(
//                 width: constraints.maxWidth * _localProgress,
//                 height: widget.height,
//                 decoration: BoxDecoration(
//                   color: widget.progressColor,
//                   borderRadius: BorderRadius.circular(widget.radius),
//                 ),
//               ),
//               // Thumb
//               if (widget.showThumb)
//                 Positioned(
//                   left: (constraints.maxWidth * _localProgress) - (widget.thumbSize / 2),
//                   child: _buildThumb(),
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }