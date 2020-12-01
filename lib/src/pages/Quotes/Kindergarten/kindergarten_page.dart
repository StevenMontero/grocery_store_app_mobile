import 'package:flutter/material.dart';
import 'package:lamanda_petshopcr/src/theme/colors.dart';
import 'package:lamanda_petshopcr/src/widgets/custom_button.dart';
import 'package:table_calendar/table_calendar.dart';

class KindergartenScreen extends StatefulWidget {
  @override
  _KindergartenScreenState createState() => _KindergartenScreenState();
}

class _KindergartenScreenState extends State<KindergartenScreen> {
  CalendarController _calendarController;
  String _valueTypeFur = "1";
  int edad = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.primaryColorPink,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () => Navigator.of(context).pop()),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Seleccione una fecha",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          TableCalendar(
            calendarController: _calendarController,
            initialCalendarFormat: CalendarFormat.week,
            startingDayOfWeek: StartingDayOfWeek.monday,
            formatAnimation: FormatAnimation.slide,
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonVisible: false,
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
              leftChevronIcon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 15,
              ),
              rightChevronIcon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 15,
              ),
              leftChevronMargin: EdgeInsets.only(left: 70),
              rightChevronMargin: EdgeInsets.only(right: 70),
            ),
            calendarStyle: CalendarStyle(
                selectedColor: ColorsApp.primaryColorOrange,
                weekendStyle: TextStyle(color: Colors.white),
                weekdayStyle: TextStyle(color: Colors.white)),
            daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: TextStyle(color: Colors.white),
                weekdayStyle: TextStyle(color: Colors.white)),
          ),
          SizedBox(
            height: 5,
          ),
          buildForm()
        ],
      ),
    );
  }

  Expanded buildForm() {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            color: Colors.white),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Hora de entrada',
                          style: TextStyle(
                              fontSize: 15.0, color: Colors.blueGrey[700]),
                        ),
                        buildTimePiker(''),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Hora de salida',
                          style: TextStyle(
                              fontSize: 15.0, color: Colors.blueGrey[700]),
                        ),
                        buildTimePiker(''),
                      ],
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    buildCupos(10)
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                buildTypeDog(),
                SizedBox(
                  height: 10,
                ),
                buildAgeDog(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Encargado de entrega',
                  style: TextStyle(fontSize: 15.0, color: Colors.blueGrey[700]),
                ),
                buildTextField(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Encargado de retiro',
                  style: TextStyle(fontSize: 15.0, color: Colors.blueGrey[700]),
                ),
                buildTextField(),
                SizedBox(
                  height: 10,
                ),
                buildLastDateOf('Última fecha de desparasitación'),
                SizedBox(
                  height: 10,
                ),
                buildLastDateOf('Ultima protección contra pulgas y garrapatas'),
                SizedBox(
                  height: 10,
                ),
                buildOptionsLsit(),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  color: ColorsApp.primaryColorPink,
                  press: () {},
                  text: 'Reservar',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildTimePiker(String type) {
    return Container(
      width: 160,
      child: OutlineButton(
        borderSide: BorderSide(color: ColorsApp.primaryColorPink),
        highlightedBorderColor: ColorsApp.primaryColorPink,
        highlightColor: ColorsApp.primaryColorPink,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onPressed: () => _selectTime(type),
        child: Row(
          children: [
            Icon(Icons.access_time),
            SizedBox(
              width: 10,
            ),
            Text('10:00 a.m'),
          ],
        ),
      ),
    );
  }

  Widget buildDatePiker(String type) {
    return Container(
      width: 160,
      child: OutlineButton(
        borderSide: BorderSide(color: ColorsApp.primaryColorPink),
        highlightedBorderColor: ColorsApp.primaryColorPink,
        highlightColor: ColorsApp.primaryColorPink,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onPressed: () => _presentDatePicker(),
        child: Row(
          children: [
            Icon(Icons.calendar_today),
            SizedBox(
              width: 10,
            ),
            Text('22/03/2020'),
          ],
        ),
      ),
    );
  }

  void _selectTime(String typeTime) async {
    // final date = context.read<ReservationCubit>().state.date.value;
    final date = DateTime.now();
    if (date != null) {
      TimeOfDay selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      final dateWithTime = DateTime(date.year, date.month, date.day,
          selectedTime.hour, selectedTime.minute);
      if (typeTime == 'CheckIn') {
        // context.read<ReservationCubit>().dateCheckInChanged(dateWithTime);
      } else {
        // context.read<ReservationCubit>().dateCheckOutChanged(dateWithTime);
      }
    }
  }

  Widget buildTypeDog() {
    return Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            'Raza',
            style: TextStyle(fontSize: 15.0, color: Colors.blueGrey[700]),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton(
                  items: [
                    DropdownMenuItem(
                      child: Text('Liso'),
                      value: '1',
                    ),
                    DropdownMenuItem(
                      child: Text('Colocho'),
                      value: '2',
                    )
                  ],
                  value: _valueTypeFur,
                  onChanged: (value) {
                    setState(() {
                      _valueTypeFur = value;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildAgeDog() {
    return Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            'Edad',
            style: TextStyle(fontSize: 15.0, color: Colors.blueGrey[700]),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton(
                  items: List.generate(
                      20,
                      (index) => DropdownMenuItem(
                            child: Text('$index'),
                            value: index,
                          )),
                  value: edad,
                  onChanged: (value) {
                    setState(() {
                      edad = value;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTextField() {
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      child: TextField(
          maxLines: 1,
          decoration: InputDecoration(
            hintText: 'Escriba aqui',
            filled: true,
            fillColor: Color(0xFFDBEDFF),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
          )),
    );
  }

  Widget buildLastDateOf(String mensaje) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mensaje,
          style: TextStyle(fontSize: 15.0, color: Colors.blueGrey[700]),
        ),
        buildDatePiker('')
      ],
    );
  }

  _presentDatePicker() async {
    final refDate = DateTime.now();
    final picked = await showDatePicker(
        context: context,
        initialDate: refDate,
        firstDate: refDate,
        lastDate: DateTime(refDate.year + 1, refDate.month, refDate.day));

    // context.read<ReservationCubit>().dateReservationChange(picked);
  }

  Widget buildOptionsLsit() {
    return Column(
      children: [
        SwitchListTile(
          title: Text('Vacunas al dia'),
          activeColor: ColorsApp.primaryColorPink,
          value: true,
          onChanged: (value) {},
        ),
        SwitchListTile(
          title: Text('Castrado'),
          activeColor: ColorsApp.primaryColorPink,
          value: true,
          onChanged: (value) {},
        ),
        SwitchListTile(
          title: Text('Sociable'),
          activeColor: ColorsApp.primaryColorPink,
          value: true,
          onChanged: (value) {},
        ),
        SwitchListTile(
          title: Text('Traslado'),
          activeColor: ColorsApp.primaryColorPink,
          value: true,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget buildCupos(int cupos) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(width: 1, color: ColorsApp.primaryColorPink)),
      child: Stack(
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: ColorsApp.primaryColorPink,
            ),
            child: Center(
              child: Text(
                'Cupos',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Positioned(
            top: 85,
            left: 45,
            child: Container(
              height: 50,
              width: 60,
              child: Center(
                child: Text(
                  '$cupos',
                  style: TextStyle(
                      fontSize: 20,
                      color: ColorsApp.primaryColorPink,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
