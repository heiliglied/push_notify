import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:push_notify/ui/components/basedrawer.dart';
import 'package:push_notify/extra/UniDialog.dart';

class SetNotify extends StatefulWidget {
  final String title;
  final int id;

  const SetNotify({Key? key, this.title = '', this.id = 0}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SetNotify();
}

class _SetNotify extends State<SetNotify> {
  bool isInit = true;
  String setType = 'insert';
  DateTime alertDate = DateTime.now();
  TimeOfDay alertTime = TimeOfDay.now();
  TextEditingController dateinput = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  TextEditingController alertName = TextEditingController();
  TextEditingController alertContents = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double widgetWidth = MediaQuery
        .of(context)
        .size
        .width;
    double widgetHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("메시지 작성"),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.pushNamed('main');
              //Navigator.pushNamed(context, Routes.mainPage);
            }
        ),
      ),
      endDrawer: const BaseDrawer(),
      body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                      width: widgetWidth,
                      //height: widgetHeight - AppBar().preferredSize.height,
                      child: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.title == '' ? '신규 메시지 작성' : widget.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 24.0),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                controller: dateinput,
                                readOnly: true,
                                //obscureText: true,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: '날짜 선택'
                                ),
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    locale: const Locale('ko', 'KR'),
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    //firstDate: DateTime.now().subtract(Duration(days: 365)),
                                    lastDate: DateTime.now().add(
                                        const Duration(days: 365 * 10)),
                                  );
                                  if (pickedDate != null) {
                                    alertDate = pickedDate;
                                    setState(() {
                                      dateinput.text =
                                          DateFormat('yyyy-MM-dd').format(
                                              pickedDate);
                                    });
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                controller: timeinput,
                                readOnly: true,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: '시간 선택'
                                ),
                                onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    cancelText: '취소',
                                    confirmText: '확인',
                                    helpText: '시간 선택',
                                    errorInvalidText: '에러',
                                    hourLabelText: '시',
                                    minuteLabelText: '분',
                                    initialEntryMode: TimePickerEntryMode.input,
                                  );
                                  if (pickedTime != null) {
                                    alertTime = pickedTime;
                                    String selectHour = alertTime.hour
                                        .toString().padLeft(2, '0');
                                    String selectTime = alertTime.minute
                                        .toString().padLeft(2, '0');
                                    if (selectHour != '' && selectTime != '') {
                                      String timeSelect = selectHour + '시 ' +
                                          selectTime + '분';
                                      setState(() {
                                        timeinput.text = timeSelect;
                                      });
                                    }
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                controller: alertName,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: '알림 이름'
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                controller: alertContents,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: '알림 내용'
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: widgetWidth,
                              height: widgetHeight * 0.15 -
                                  AppBar().preferredSize.height,
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10),
                              child: ElevatedButton(
                                child: setType == 'insert'
                                    ? const Text("등록", style: TextStyle(
                                    fontSize: 20.0, color: Colors.limeAccent))
                                    : const Text("수정", style: TextStyle(
                                    fontSize: 20.0, color: Colors.limeAccent)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightBlueAccent,

                                ),
                                onPressed: () async {
                                  if (dateinput.text.trim() == '') {
                                    UniDialog.showToast(
                                        "날짜를 입력해 주세요.", 'short');
                                    return;
                                  }
                                  if (timeinput.text.trim() == '') {
                                    UniDialog.showToast(
                                        "시간을 입력해 주세요.", 'short');
                                    return;
                                  }
                                  if (alertName.text.trim() == '') {
                                    UniDialog.showToast(
                                        "알림을 입력해 주세요.", 'short');
                                    return;
                                  }

                                  DateTime selecteDate = DateTime(
                                      alertDate.year,
                                      alertDate.month,
                                      alertDate.day,
                                      alertTime.hour,
                                      alertTime.minute
                                  );

                                  if(setType == 'insert') {
                                    //insertNoti()
                                  }
                                  /*
                                  if (setType == 'insert') {
                                    insertNotiData(NotificationCompanion(
                                        date: Value(selecteDate),
                                        title: Value(alertName.text),
                                        contents: Value(alertContents.text),
                                        status: const Value(false)
                                    )).then((result) =>
                                    {
                                      UniDialog.showToast("등록 되었습니다.", 'short'),
                                      resetInput()
                                    }).onError((error, stackTrace) =>
                                    {
                                      if(error.toString().contains(
                                          "SqliteException(2067)")){
                                        UniDialog.showToast(
                                            "이미 등록된 날짜입니다.", 'short'),
                                      } else
                                        {
                                          UniDialog.showToast(
                                              "등록에 실패했습니다.", 'short'),
                                        }
                                    });
                                  } else {
                                    updateNotiDate(
                                        widget.id, NotificationCompanion(
                                        date: Value(selecteDate),
                                        title: Value(alertName.text),
                                        contents: Value(alertContents.text),
                                        status: const Value(false)
                                    )).then((result) =>
                                    {
                                      UniDialog.showToast("수정 되었습니다.", 'short'),
                                    }).onError((error, stackTrace) =>
                                    {
                                      if(error.toString().contains(
                                          "SqliteException(2067)")){
                                        UniDialog.showToast(
                                            "이미 등록된 날짜입니다.", 'short'),
                                      } else
                                        {
                                          UniDialog.showToast(
                                              "수정에 실패했습니다.", 'short'),
                                        }
                                    });
                                  }
                                   */
                                },
                              ),
                            )
                          ]
                      )
                  ),
                )
            ),
          ]
      ),
    );
  }

  void resetInput() {
    dateinput.text = '';
    timeinput.text = '';
    alertName.text = '';
    alertContents.text = '';
  }
}