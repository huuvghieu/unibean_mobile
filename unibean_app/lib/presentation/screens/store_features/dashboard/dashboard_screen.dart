import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:unibean_app/data/models.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import '../../../blocs/blocs.dart';

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('CHN', 12),
      _ChartData('GER', 15),
      _ChartData('RUS', 30),
      _ChartData('BRZ', 6.4),
      _ChartData('IND', 14)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 20,
              ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<RankingBloc, RankingState>(
                  builder: (context, state) {
                    if (state is CampaignRankingLoaded) {
                      return Card(
                        color: Color(0xFF909CDF),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 10,
                          
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'SỐ LƯỢNG CHIẾN DỊCH: ${state.campaignRankings.length}',
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.0),
                              // SparkbarChart(
                              //   campaignRankings: state.campaignRankings,
                              // ),
                              SfCartesianChart(
                                  primaryXAxis: CategoryAxis(
                                      labelStyle: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      )),
                                      maximumLabelWidth: 50),
                                  primaryYAxis: NumericAxis(
                                    labelStyle: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    )),
                                  ),
                                  tooltipBehavior: _tooltip,
                                  series: <CartesianSeries<CampaignRankingModel,
                                      String>>[
                                    BarSeries<CampaignRankingModel, String>(
                                        dataSource: state.campaignRankings,
                                        xValueMapper:
                                            (CampaignRankingModel data, _) =>
                                                data.name,
                                        yValueMapper:
                                            (CampaignRankingModel data, _) =>
                                                data.value,
                                        name: 'Chiến dịch',
                                        color: Colors.white)
                                  ]),
                            ],
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                BlocProvider(
                  create: (context) => RankingBloc(
                      storeRepository: context.read<StoreRepository>())
                    ..add(LoadStudentRanking()),
                  child: BlocBuilder<RankingBloc, RankingState>(
                    builder: (context, state) {
                      if (state is StudentRankingLoaded) {
                        return Card(
                          color: kPrimaryColor,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'SỐ LƯỢNG SINH VIÊN: ${state.studentRankings.length}',
                                      style: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.0),
                                SfCartesianChart(
                                    primaryXAxis: CategoryAxis(
                                      labelStyle: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      )),
                                      ),
                                  primaryYAxis: NumericAxis(
                                    labelStyle: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    )),
                                  ),
                                    
                                    tooltipBehavior: _tooltip,
                                    series: <CartesianSeries<
                                        StudentRankingModel, String>>[
                                      ColumnSeries<StudentRankingModel, String>(
                                          dataSource: state.studentRankings,
                                          xValueMapper:
                                              (StudentRankingModel data, _) =>
                                                  data.name,
                                          yValueMapper:
                                              (StudentRankingModel data, _) =>
                                                  data.value,
                                          name: 'Sinh viên',
                                          color: Colors.white)
                                    ]),
                              ],
                            ),
                          ),
                        );
                      }
                      return Container(
                        child: Center(child: Lottie.asset('assets/animations/loading-screen.json'),),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
           SizedBox(
                height: 150,
              ),
        ]))
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
      width: 320,
      height: 200,
      child: SfSparkBarChart.custom(
        dataCount: campaignRankings.length,
        xValueMapper: (int index) =>
            campaignRankings[index].name, // x-axis value mapper
        yValueMapper: (int index) =>
            campaignRankings[index].value, // y-axis value mapper
        axisLineWidth: 1,
        axisLineColor: Colors.white,
        color: Colors.white,
        labelDisplayMode: SparkChartLabelDisplayMode.all,
        trackball: SparkChartTrackball(
          activationMode: SparkChartActivationMode.tap,
          width: 1,
          labelStyle: GoogleFonts.openSans(
              textStyle: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          )),
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

String shortenName(String fullName) {
  const maxLength = 10;

  if (fullName.length > maxLength) {
    return fullName.substring(0, maxLength);
  } else {
    return fullName;
  }
}
