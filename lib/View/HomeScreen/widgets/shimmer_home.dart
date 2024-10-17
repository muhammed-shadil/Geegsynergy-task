import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: MediaQuery.of(context).size.height * 0.15,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: const Color.fromARGB(255, 230, 228, 228),
                      highlightColor: const Color.fromARGB(255, 255, 255, 255),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 215, 250, 250),
                        ),
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Shimmer.fromColors(
                                baseColor:
                                    const Color.fromARGB(255, 230, 228, 228),
                                highlightColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                child: Container(
                                  color: Colors.blueAccent,
                                  child: const Text(
                                    "fetcheddata.data[index].name",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Shimmer.fromColors(
                                baseColor:
                                    const Color.fromARGB(255, 230, 228, 228),
                                highlightColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                child: Container(
                                  color: Colors.blueAccent,
                                  child: const Text(
                                    "fetch",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w200),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Shimmer.fromColors(
                            baseColor: const Color.fromARGB(255, 230, 228, 228),
                            highlightColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            child: Container(
                              color: Colors.blueAccent,
                              child: const Text(
                                "fetched",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
