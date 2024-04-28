import 'package:empresta/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/entities/simulation_entity.dart';
import '../../../theme/app_text_styles.dart';

class SimulationCard extends StatelessWidget {
  final String valuePrice;
  final SimulationEntity simulationFather;
  final numberFormater = NumberFormat("#,##0.00", "pt_BR");

  SimulationCard({
    super.key,
    required this.simulationFather,
    required this.valuePrice,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...simulationFather.simulations.map(
          (simulation) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    backgroundImage:
                        _buildAssetImage(simulationFather.institution),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            '$valuePrice  -',
                            style: defaultTextStyle.bold,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            style: defaultTextStyle.bold,
                            '${simulation.installments.toString()} x R\$ ${numberFormater.format(simulation.installmentValue)}',
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          simulationFather.institution.toUpperCase(),
                          style: defaultTextStyle.cl(AppColors.primaryGray),
                        ),
                        Text(
                          ' (${simulation.covenant}) - ',
                          style: defaultTextStyle.cl(AppColors.primaryGray),
                        ),
                        Text(
                          '${simulation.tax.toString()}%',
                          style: defaultTextStyle.cl(AppColors.primaryGray),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  AssetImage _buildAssetImage(String institution) {
    if (institution == 'BMG') {
      return const AssetImage('lib/app/assets/banco_bmg.png');
    }
    if (institution == 'PAN') {
      return const AssetImage('lib/app/assets/banco_pan.png');
    }
    return const AssetImage('lib/app/assets/banco_ole.png');
  }
}
