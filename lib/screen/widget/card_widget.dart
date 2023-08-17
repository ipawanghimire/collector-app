import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  final String title;
  final String amount;
  final String secondaryText;
  final Color cardColor;
  final IconData? icon; // Add this property for the icon

  const CardWidget({
    Key? key,
    required this.title,
    required this.amount,
    required this.secondaryText,
    required this.cardColor,
    this.icon, // Initialize the icon property
  }) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool showActualAmount = true;

  String getDisplayedAmount() {
    return showActualAmount ? widget.amount : 'XXX-XXX-XXX';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Card(
        color: widget.cardColor.withOpacity(0.9),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0)
              .copyWith(top: 16, bottom: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              if (widget.amount.isNotEmpty) // Conditionally show eye icon
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        getDisplayedAmount(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          showActualAmount = !showActualAmount;
                        });
                      },
                      icon: Icon(
                        showActualAmount
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  widget.secondaryText,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (widget.icon != null)
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 16),
                  child: Icon(
                    widget.icon,
                    color: Colors.black,
                    size: 60,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
