import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicle_hrvices/Controller/ServiceDetailsController.dart';
import 'package:practicle_hrvices/Constant/colors.dart';
import 'package:practicle_hrvices/Custom/CheckBox.dart';

class ServiceDetailsView extends StatelessWidget {
  ServiceDetailsView({super.key});

  TextStyle textStyle = const TextStyle(color: Colors.white, fontSize: 12);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ServiceViewController(),
        builder: (ServiceViewController controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Service Details'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(color: ExpensionTileColor),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Pre-Procedure Review',
                              style: TextStyle(
                                  color: PatientnameColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                controller.ShowServiceDetails();
                              },
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                                decoration: BoxDecoration(
                                    color: PatientnameColor,
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Text(
                                  'Start',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.SubmitPreProcedure();
                            },
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                              decoration: BoxDecoration(
                                  color: ServiceEndBg,
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Text(
                                'End',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            child: (controller.isExpand.value)
                                ? const Icon(Icons.arrow_drop_up_outlined)
                                : const Icon(Icons.arrow_drop_down_outlined),
                          )
                        ],
                      ),
                    ),
                    (controller.isExpand.value)
                        ? Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: HintColor)),
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          10, 5, 10, 5),
                                      child: const Text(
                                        "LABS",
                                        style: TextStyle(
                                            color: PatientnameColor,
                                            fontWeight: FontWeight.w900),
                                      )),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                    child: Container(
                                      //width: MediaQuery.of(context).size.width,
                                      height: 1,
                                      decoration: BoxDecoration(
                                        color: HintColor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.zero,
                                    margin:const  EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children:const  [
                                                Text('Blood Thinner :')
                                              ],
                                            ),
                                            CheckBox(
                                                title: 'Apixaban',
                                                isChacked: true),
                                            CheckBox(
                                                title: 'Dabigatran',
                                                isChacked: true),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 5, 5),
                                    child: Container(
                                      //width: MediaQuery.of(context).size.width,
                                      height: 1,
                                      decoration: BoxDecoration(
                                        color: HintColor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Text('INR: '),
                                            Container(
                                              padding:const  EdgeInsets.fromLTRB(
                                                  7, 5, 7, 5),
                                              decoration: BoxDecoration(
                                                  color: Green,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                '1.1',
                                                style: textStyle,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text('Patient Count(k): '),
                                            Container(
                                              padding:const  EdgeInsets.fromLTRB(
                                                  7, 5, 7, 5),
                                              decoration: BoxDecoration(
                                                  color: Brown,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                '550 ul/dL',
                                                style: textStyle,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text('PT: '),
                                            Container(
                                              padding: const EdgeInsets.fromLTRB(
                                                  7, 5, 7, 5),
                                              decoration: BoxDecoration(
                                                  color: Green,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                '8 Sec',
                                                style: textStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            const Text('PTT: '),
                                            Container(
                                              padding:const  EdgeInsets.fromLTRB(
                                                  7, 5, 7, 5),
                                              decoration: BoxDecoration(
                                                  color: Green,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                '30 Sec',
                                                style: textStyle,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text('BUN: '),
                                            Container(
                                              padding:const  EdgeInsets.fromLTRB(
                                                  7, 5, 7, 5),
                                              decoration: BoxDecoration(
                                                  color: Green,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                '150 mg/dL',
                                                style: textStyle,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text('Creatinine: '),
                                            Container(
                                              padding: const EdgeInsets.fromLTRB(
                                                  7, 5, 7, 5),
                                              decoration: BoxDecoration(
                                                  color: Brown,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                '3.5 mg/dL',
                                                style: textStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text('GFR: '),
                                            Container(
                                              padding:const  EdgeInsets.fromLTRB(
                                                  7, 5, 7, 5),
                                              decoration: BoxDecoration(
                                                  color: Orange,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                '75 Stage-2',
                                                style: textStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            5, 5, 5, 5),
                                    child: Container(
                                      //width: MediaQuery.of(context).size.width,
                                      height: 1,
                                      decoration: BoxDecoration(
                                        color: HintColor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children:const  [
                                            Text('Dialaysis'),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('History of \n Nephrectomy'),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: SkyblueLight,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                          color: SkyBlue)),
                                                  padding:const  EdgeInsets.fromLTRB(
                                                      5, 5, 5, 5),
                                                  child:const  Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                        color:
                                                            PatientnameColor),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                          color: Colors.grey)),
                                                  padding:const  EdgeInsets.fromLTRB(
                                                      5, 5, 5, 5),
                                                  child:const  Text(
                                                    'No',
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: SkyblueLight,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                          color: SkyBlue)),
                                                  padding:const  EdgeInsets.fromLTRB(
                                                      5, 5, 5, 5),
                                                  child: const Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                        color:
                                                            PatientnameColor),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                          color: Colors.grey)),
                                                  padding:const  EdgeInsets.fromLTRB(
                                                      5, 5, 5, 5),
                                                  child:const  Text(
                                                    'No',
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children:const  [
                                            Text('Renal Transplant'),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'Renal Status \n Approveed By'),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: SkyblueLight,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                          color: SkyBlue)),
                                                  padding: const EdgeInsets.fromLTRB(
                                                      5, 5, 5, 5),
                                                  child: const Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                        color:
                                                            PatientnameColor),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                          color: Colors.grey)),
                                                  padding: const EdgeInsets.fromLTRB(
                                                      5, 5, 5, 5),
                                                  child: const Text(
                                                    'No',
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children:  [
                                                Container(
                                                  height: 30,
                                                  width: 80,
                                                  child: TextField(
                                                    controller: controller
                                                        .renalcontroller,
                                                    decoration: const InputDecoration(
                                                        border:
                                                            OutlineInputBorder()),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            5, 5, 5, 5),
                                    child: Container(
                                      //width: MediaQuery.of(context).size.width,
                                      height: 1,
                                      decoration: BoxDecoration(
                                        color: HintColor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    child: Row(
                                      children: [
                                        const Text('WBC: '),
                                        Container(
                                          padding:const
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                          decoration: BoxDecoration(
                                              color: Green,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            '08/ml',
                                            style: textStyle,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            5, 5, 5, 5),
                                    child: Container(
                                      //width: MediaQuery.of(context).size.width,
                                      height: 1,
                                      decoration: BoxDecoration(
                                        color: HintColor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Row(
                                      children: [
                                       const Text('Blood Cluture Date: '),
                                        InkWell(
                                          onTap: () {
                                            controller.SelectDate(context);
                                          },
                                          child: Container(
                                            height: 30,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.45,
                                            child: TextField(
                                              enabled: false,
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  suffixIcon: Icon(Icons
                                                      .calendar_month_rounded)),
                                              controller:
                                                  controller.datecontroller,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            5, 5, 5, 5),
                                    child: Container(
                                      //width: MediaQuery.of(context).size.width,
                                      height: 1,
                                      decoration: BoxDecoration(
                                        color: HintColor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Row(
                                      children: [
                                        const Text('Results: '),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: SkyblueLight,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                border:
                                                    Border.all(color: SkyBlue)),
                                            padding:const
                                                EdgeInsets.fromLTRB(5, 5, 5, 5),
                                            child:const  Center(
                                              child: Text(
                                                'Negative',
                                                style: TextStyle(
                                                    color: PatientnameColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                border: Border.all(
                                                    color: Colors.grey)),
                                            padding:const
                                                EdgeInsets.fromLTRB(5, 5, 5, 5),
                                            child:const Center(
                                              child:  Text(
                                                'Positive',
                                                style:
                                                    TextStyle(color: Colors.grey),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(4),
                                                border: Border.all(
                                                    color: Colors.grey)),
                                            padding:const
                                            EdgeInsets.fromLTRB(5, 5, 5, 5),
                                            child:const Center(
                                              child:  Text(
                                                'Pending',
                                                style:
                                                TextStyle(color: Colors.grey),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
