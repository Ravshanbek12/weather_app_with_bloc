import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_with_bloc/bloc/get_weather_bloc.dart';
import 'package:weather_app_with_bloc/data/models/status.dart';

class BasicScreen extends StatefulWidget {
  const BasicScreen({Key? key}) : super(key: key);

  @override
  State<BasicScreen> createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFFEE3BC).withOpacity(.23),
                  const Color(0xFFF39876).withOpacity(.99),
                ],
              ),
            ),
            child: BlocBuilder<GetWeatherBloc, GetWeatherState>(
              builder: (context, state) {
                if (state.status == LoadingStatus.pure) {
                  print(state.status.name);
                  context.read<GetWeatherBloc>().add(
                        GetFullWeather(
                          onSuccess: () {},
                          onFailure: (onFailure) {},
                        ),
                      );
                } else if (state.status == LoadingStatus.loading) {
                  print(state.baseModel.length);
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                } else if (state.status == LoadingStatus.loadedWithSuccess) {
                  print(state.status.name);
                  final base = state.baseModel[0];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12.h,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search_rounded,
                                size: 24.h,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 18.0.w),
                        child: Text(
                          "${base.name},",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF313341)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 18.0.w),
                        child: Text(
                          base.sysCountry,
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF313341)),
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 18.0.w),
                        child: Text(
                          "asfsdfgsg",
                          style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF9A938C)),
                        ),
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.network(
                            "https://openweathermap.org/img/wn/${base.weather[0].icon}@2x.png",
                            width: 83.h,
                            height: 80.h,
                            fit: BoxFit.cover,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Text(
                                    "${(base.main.temp - 273).toInt()}",
                                    style: TextStyle(
                                      fontSize: 43.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Positioned(
                                    right: -0.5.h,
                                    top: 8.h,
                                    child: Icon(
                                      Icons.circle_outlined,
                                      size: 8.h,
                                      color: const Color(0xFF313341),
                                    ),
                                  )
                                ],
                              ),
                              Positioned(
                                bottom: 10.h,
                                child: Text(
                                  base.weather[0].main,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        children: [
                          Center(
                            child: Container(
                              width: 164.w,
                              height: 38.h,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.36),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const Icon(Icons.wind_power),
                                    const Text("Wind"),
                                    Text('${base.windSpeed}km/h'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h,),
                          Center(
                            child: Container(
                              width: 164.w,
                              height: 38.h,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.36),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const Icon(Icons.cloud),
                                    const Text("Cloud"),
                                    Text('${base.clouds}%')
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h,),
                          Center(
                            child: Container(
                              width: 164.w,
                              height: 38.h,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.36),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(Icons.hub),
                                  const Text("Humidity"),
                                  Text('${base.clouds}%')
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else if (state.status == LoadingStatus.loadedWithFailure) {
                  print(context.read<GetWeatherBloc>().state);
                  return const SizedBox(
                    child: Center(
                      child: Text("Status:loadedWithFailure"),
                    ),
                  );
                }
                return const Center(
                  child: Text("Xato boshqa narsada"),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
