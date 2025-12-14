import 'package:flutter/material.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverdue;

  final Map<String, int> allStatus = {
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => allStatus[status] ?? -1;

  OrderStatusWidget({super.key, required this.status, required this.isOverdue});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StatusDot(isActive: true, title: 'Pedido confirmado'),

        _CustomDivider(),

        if (currentStatus == 1) ...[
          _StatusDot(
            isActive: true,
            title: 'Estorno realizado',
            backgroundColor: Colors.orange,
          ),
        ] else if (isOverdue) ...[
          _StatusDot(
            isActive: true,
            title: 'Pagamento Pix vencido',
            backgroundColor: Colors.red,
          ),
        ] else ...[
          _StatusDot(isActive: currentStatus >= 2, title: 'Pagamento'),
          _CustomDivider(),
          _StatusDot(isActive: currentStatus >= 3, title: 'Preparando'),
          _CustomDivider(),
          _StatusDot(isActive: currentStatus >= 4, title: 'Em transporte'),
          _CustomDivider(),
          _StatusDot(isActive: currentStatus >= 5, title: 'Entregue'),
        ],
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color? backgroundColor;
  const _StatusDot({
    super.key,
    required this.isActive,
    required this.title,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Dot
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.green),
            color:
                isActive ? backgroundColor ?? Colors.green : Colors.transparent,
          ),
          child:
              isActive
                  ? Icon(Icons.check, color: Colors.white, size: 15)
                  : SizedBox.shrink(),
        ),
        SizedBox(width: 5),

        // Texto
        Expanded(child: Text(title, style: TextStyle(fontSize: 12))),
      ],
    );
  }
}
