import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lamanda_petshopcr/src/theme/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class NurseryScreen extends StatefulWidget {
  @override
  _NurseryScreenState createState() => _NurseryScreenState();
}

class _NurseryScreenState extends State<NurseryScreen> {
  CalendarController _calendarController;
  int _valueM = 1;
  int _valueL = 1;
  String _valueTypeFur = "1";
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
              children: [],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTimeTable() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      child: Wrap(
        spacing: 15.0,
        children: List<Widget>.generate(
          6,
          (int index) {
            return ChoiceChip(
              label: Text(
                '4:00' + ' a.m',
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
              selected: _valueM == index,
              selectedColor: ColorsApp.primaryColorBlue,
              backgroundColor: ColorsApp.secondaryColorlightBlue,
              avatar: Icon(
                FontAwesomeIcons.clock,
                color: Colors.white,
              ),
              onSelected: (bool selected) {
                setState(() {
                  _valueM = selected ? index : null;
                });
              },
            );
          },
        ).toList(),
      ),
    );
  }

  Widget buildTypeFur() {
    return Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            'Tipo de pelaje',
            style: TextStyle(fontSize: 20.0, color: Colors.blueGrey[700]),
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

  Widget buildTextField() {
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      child: TextField(
          maxLines: 10,
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
}
