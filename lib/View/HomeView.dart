import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicle_hrvices/Constant/colors.dart';
import 'package:practicle_hrvices/Controller/HomeController.dart';
import 'package:intl/intl.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (HomeController contrller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: (contrller.isLoading.value) ?
              (contrller.serviceModel != null ) ?
              Container(
                padding: const EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: HintColor)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                                child: Text(
                                  "${contrller.serviceModel?.result!.data!.facilities![0].serviceRequests![0].patient!.name},${contrller.serviceModel?.result!.data!.facilities![0].serviceRequests![0].patient!.age} Years",
                                  style: const TextStyle(
                                      color: PatientnameColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                                child: Text(
                                    '${contrller.serviceModel?.result!.data!.facilities![0].serviceRequests![0].caseId}'),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 35,
                            height: 35,
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                color: ContainerColor),
                            child:const Icon(
                              Icons.message,
                              size: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding:const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                          child: Container(
                            width: 1,
                            height: 30,
                            decoration: BoxDecoration(
                              color: HintColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: 30,
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Green),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  icon:const Icon(
                                    Icons.access_time,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                                Padding(
                                  padding:
                                       const EdgeInsets.fromLTRB(0.0, 0, 8, 0),
                                  child: Text(
                                    '${contrller.serviceModel?.result!.data!.facilities![0].serviceRequests![0].srEta}',
                                    style:const TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:const EdgeInsetsDirectional.fromSTEB(5, 1, 5, 5),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        decoration: BoxDecoration(
                          color: HintColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children:  [
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(5, 0, 2, 2),
                                      child: Icon(
                                        Icons.calendar_month_rounded,
                                        size: 17,
                                        color: Grey,
                                      ),
                                    ),
                                    Padding(
                                      padding:const EdgeInsets.fromLTRB(2, 0, 2, 2),
                                      child: Text(
                                        DateFormat('dd MMM yyyy').format(DateTime.parse("${contrller.serviceModel?.result!.data!.facilities![0].serviceRequests![0].patient!.dob}")),
                                        style:const TextStyle(
                                            color: Grey, fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children:  [
                                   const Padding(
                                      padding: EdgeInsets.fromLTRB(5, 0, 2, 2),
                                      child: Icon(
                                        Icons.bed_outlined,
                                        size: 17,
                                        color: Grey,
                                      ),
                                    ),
                                    Padding(
                                      padding:const EdgeInsets.fromLTRB(2, 0, 2, 2),
                                      child: Text(
                                        '${contrller.serviceModel!.result!.data!.facilities![0].serviceRequests![0].roomNo!}',
                                        style:const TextStyle(
                                            color: Grey, fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children:  [
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(5, 0, 2, 2),
                                      child: Icon(
                                        Icons.list_alt,
                                        size: 17,
                                        color: Grey,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(2, 0, 2, 2),
                                      child: Text(
                                        '${contrller.serviceModel!.result!.data!.facilities![0].serviceRequests![0].procedureDetails![0].status}',
                                        style:const TextStyle(
                                            color: Grey, fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children:  [
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(5, 0, 2, 2),
                                      child: Icon(
                                        Icons.list_alt,
                                        size: 17,
                                        color: Grey,
                                      ),
                                    ),
                                    Padding(
                                      padding:const EdgeInsets.fromLTRB(2, 0, 2, 2),
                                      child: Text(
                                        '${contrller.serviceModel!.result!.data!.facilities![0].serviceRequests![0].procedureDetails![1].status}',
                                        style:const TextStyle(
                                            color: Grey, fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(5, 0, 2, 2),
                                      child: Icon(
                                        Icons.groups_outlined,
                                        size: 17,
                                        color: Grey,
                                      ),
                                    ),
                                    Padding(
                                      padding:const EdgeInsets.fromLTRB(2, 0, 0, 2),
                                      child: Text(
                                        '${contrller.serviceModel?.result!.data!.facilities![0].serviceRequests![0].clinicians![0].name} - ${contrller.serviceModel!.result!.data!.facilities![0].serviceRequests![0].clinicians![0].role} - ',
                                        style:const TextStyle(
                                            color: Grey, fontSize: 12),
                                      ),
                                    ),
                                    /*Padding(
                                      padding:const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Text(
                                        '${contrller.serviceModel?.result!.data!.facilities![0].serviceRequests![0].clinicians![0].state})',
                                        style:const TextStyle(
                                            color: Colors.red, fontSize: 12),
                                      ),
                                    )*/
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 1, 5, 1),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 1,
                            decoration: BoxDecoration(
                              color: HintColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                              Padding(
                              padding: EdgeInsets.fromLTRB(8.0,10,25,10),
                              child:InkWell(child: Text('View Details',style: TextStyle(color: SkyBlue),),onTap: (){
                                contrller.ViewDetails("${contrller.serviceModel?.result!.data!.facilities![0].serviceRequests![0].caseId}");
                              },),),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0,10,5,10),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(15, 7, 15, 7),
                                width: MediaQuery.of(context).size.width*0.3,
                                  decoration: BoxDecoration(
                                    color: PatientnameColor,
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Center(child: Text("Acknowledge",style: TextStyle(color: Colors.white),))),
                            )],
                        )
                      ],
                    )
                  ],
                ),
              ) : Center(
                child: Container(
                  child: Text('No Service Found'),
                ),
              ):Center(child: CircularProgressIndicator()),
            ),
          );
        });
  }
}
