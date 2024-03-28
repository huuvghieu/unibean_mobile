import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:unibean_app/data/models.dart';

import '../../../blocs/blocs.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: const Color(0xFF909CDF),
          child: Container(
            width: 285,
            height: 200,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Users:',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    Text(
                      '200',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Expanded(child: SparklineChart()),
              ],
            ),
          ),
        ),
        Card(
          color: const Color(0xFF9C254D),
          child: Container(
            width: 285,
            height: 160,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '# of Users:',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    Text(
                      '134',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Expanded(child: SparkareaChart()),
              ],
            ),
          ),
        ),
        BlocBuilder<CampaignRankingBloc, CampaignRankingState>(
          builder: (context, state) {
            if (state is CampaginRankingLoaded) {
              return Card(
                color: const Color(0xFF131313),
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Số lượng chiến dịch: ${state.campaignRankings.length}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            '59',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      SparkbarChart(
                        campaignRankings: state.campaignRankings,
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ],
    );
  }
}

class SparklineChart extends StatelessWidget {
  const SparklineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfSparkLineChart(
      width: 1,
      axisLineWidth: 0,
      color: Colors.white,
      data: const [100, 60, 80, 50, 110, 50, 60],
      labelDisplayMode: SparkChartLabelDisplayMode.none,
      marker: const SparkChartMarker(
        shape: SparkChartMarkerShape.circle,
        borderColor: Colors.white,
        color: Colors.white,
        displayMode: SparkChartMarkerDisplayMode.all,
      ),
      trackball: SparkChartTrackball(
        activationMode: SparkChartActivationMode.tap,
        color: Theme.of(context).colorScheme.inverseSurface,
        borderWidth: 1,
      ),
    );
  }
}

class SparkbarChart extends StatelessWidget {
  const SparkbarChart({super.key, required this.campaignRankings});
  final List<CampaignRankingModel> campaignRankings;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 253,
      height: 80,
      child: SfSparkBarChart.custom(
        dataCount: campaignRankings.length,
        xValueMapper: (int index) =>
            campaignRankings[index].rank, // x-axis value mapper
        yValueMapper: (int index) =>
            campaignRankings[index].value, // y-axis value mapper
        axisLineWidth: 0,
        color: Colors.white,
        labelDisplayMode: SparkChartLabelDisplayMode.all,
        trackball: SparkChartTrackball(
          activationMode: SparkChartActivationMode.tap,
          color: Theme.of(context).colorScheme.inverseSurface,
          borderWidth: 1,
        ),
      ),
    );
  }
}

class SparkareaChart extends StatelessWidget {
  const SparkareaChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfSparkAreaChart(
      axisLineWidth: 0,
      color: Colors.white,
      data: const [100, 60, 80, 50, 110, 50, 60],
      labelDisplayMode: SparkChartLabelDisplayMode.none,
      marker: const SparkChartMarker(
        shape: SparkChartMarkerShape.circle,
        borderWidth: 0.0,
        color: Colors.white,
        displayMode: SparkChartMarkerDisplayMode.all,
      ),
      trackball: SparkChartTrackball(
        activationMode: SparkChartActivationMode.tap,
        color: Theme.of(context).colorScheme.inverseSurface,
        borderWidth: 1,
      ),
    );
  }
}
