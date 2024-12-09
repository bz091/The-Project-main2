import 'package:flutter/material.dart';
import 'shedule.dart';
class B extends StatefulWidget {
  final String departments;
  final String text1, text2, text3;
  final String stage1, stage2, stage3, stage4;

  B({
    required this.departments,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.stage1,
    required this.stage2,
    required this.stage3,
    required this.stage4,
  });

  @override
  _BState createState() => _BState();
}

class _BState extends State<B> {
  void _navigateToStage(String stage, String department, int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageViewer(
            stage: stage,
            department: department,
          ),
        ),
      );
    }
  }

  List<bool> _expanded = [false, false, false, false];

  void _toggleExpansion(int index) {
    setState(() {
      for (int i = 0; i < _expanded.length; i++) {
        _expanded[i] = i == index ? !_expanded[i] : false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _description(widget.text1, widget.stage1, widget.stage2, widget.stage3,
            widget.stage4, widget.departments, 0),
        _description(widget.text2, widget.stage1, widget.stage2, widget.stage3,
            widget.stage4, widget.departments, 1),
        _description(widget.text3, widget.stage1, widget.stage2, widget.stage3,
            widget.stage4, widget.departments, 2),
      ],
    );
  }

  Widget _description(String text, String stage1, String stage2, String stage3,
      String stage4, String departments, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => _toggleExpansion(index),
          child: Row(
            children: [
              if (index != 2)
                Icon(
                  _expanded[index] ? Icons.expand_less : Icons.expand_more,
                  color: Colors.white,
                  size: 30,
                ),
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        if (_expanded[index])
          if (index == 2)
            ...[]
          else
            _buildExpandableRow(widget.stage1, widget.stage2, widget.stage3,
                widget.stage4, widget.departments, index),
      ],
    );
  }

  Widget _buildExpandableRow(String stage1, String stage2, String stage3,
      String stage4, String departments, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => _navigateToStage(stage1, departments, index),
          child: Text(
            stage1,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _navigateToStage(stage2, departments, index),
          child: Text(
            stage2,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _navigateToStage(stage3, departments, index),
          child: Text(
            stage3,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _navigateToStage(stage4, departments, index),
          child: Text(
            stage4,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
