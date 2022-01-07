INSERT INTO AGENCIES (AGENCY_ID,NAME,WEBSITE,TIMEZONE,TELEPHONE) values (1,'Metro Warszawskie','https://metro.waw.pl/','Europe/Warsaw',null);
INSERT INTO AGENCIES (AGENCY_ID,NAME,WEBSITE,TIMEZONE,TELEPHONE) values (2,'Tramwaje Warszawskie','https://tw.waw.pl/','Europe/Warsaw',null);
COMMIT;

INSERT INTO CALENDARS (CALENDAR_ID,NAME,START_DATE,END_DATE,MONDAY,TUESDAY,WEDNESDAY,THURSDAY,FRIDAY,SATURDAY,SUNDAY) values (1,'Robocze',to_date('01-JAN-22','DD-MON-RR'),null,1,1,1,1,1,0,0);
INSERT INTO CALENDARS (CALENDAR_ID,NAME,START_DATE,END_DATE,MONDAY,TUESDAY,WEDNESDAY,THURSDAY,FRIDAY,SATURDAY,SUNDAY) values (2,'Weekendy',to_date('01-JAN-22','DD-MON-RR'),null,0,0,0,0,0,1,1);
COMMIT;

INSERT INTO LINES (LINE_ID,CODE,DESCRIPTION,TYPE,AGENCY_ID) values (1,'M1','Kabaty - Młociny',1,1);
INSERT INTO LINES (LINE_ID,CODE,DESCRIPTION,TYPE,AGENCY_ID) values (2,'M2','Księcia Janusza - Trocka',1,1);
COMMIT;

INSERT INTO STOPS (STOP_ID,NAME,CODE,LAT,LON,WHEELCHAIR_ACCESSIBLE) values (1,'Kabaty','A1','52.1321','21.065',1);
INSERT INTO STOPS (STOP_ID,NAME,CODE,LAT,LON,WHEELCHAIR_ACCESSIBLE) values (2,'Świętokrzyska','A14/C11','52.235','21.0079',1);
INSERT INTO STOPS (STOP_ID,NAME,CODE,LAT,LON,WHEELCHAIR_ACCESSIBLE) values (3,'Młociny','A23','52.2907','20.93',1);
INSERT INTO STOPS (STOP_ID,NAME,CODE,LAT,LON,WHEELCHAIR_ACCESSIBLE) values (4,'Trocka','C18','52.2754','21.0554',2);
INSERT INTO STOPS (STOP_ID,NAME,CODE,LAT,LON,WHEELCHAIR_ACCESSIBLE) values (5,'Księcia Janusza','C6','52.2391','20.9441',2);
COMMIT;

INSERT INTO PATTERNS (PATTERN_ID,HEADSIGN,DIRECTION,LINE_ID) values (1,'Młociny',0,1);
INSERT INTO PATTERNS (PATTERN_ID,HEADSIGN,DIRECTION,LINE_ID) values (2,'Kabaty',1,1);
INSERT INTO PATTERNS (PATTERN_ID,HEADSIGN,DIRECTION,LINE_ID) values (3,'Trocka',0,2);
INSERT INTO PATTERNS (PATTERN_ID,HEADSIGN,DIRECTION,LINE_ID) values (4,'Księcia Janusza',1,2);
COMMIT;

INSERT INTO PATTERN_STOPS (PATTERN_STOP_ID,STOP_ID,PATTERN_ID,TRAVEL_TIME,IDX) values (1,1,1,0,0);
INSERT INTO PATTERN_STOPS (PATTERN_STOP_ID,STOP_ID,PATTERN_ID,TRAVEL_TIME,IDX) values (2,2,1,22,1);
INSERT INTO PATTERN_STOPS (PATTERN_STOP_ID,STOP_ID,PATTERN_ID,TRAVEL_TIME,IDX) values (3,3,1,39,2);
INSERT INTO PATTERN_STOPS (PATTERN_STOP_ID,STOP_ID,PATTERN_ID,TRAVEL_TIME,IDX) values (4,3,2,0,0);
INSERT INTO PATTERN_STOPS (PATTERN_STOP_ID,STOP_ID,PATTERN_ID,TRAVEL_TIME,IDX) values (5,2,2,17,1);
INSERT INTO PATTERN_STOPS (PATTERN_STOP_ID,STOP_ID,PATTERN_ID,TRAVEL_TIME,IDX) values (6,1,2,39,2);
INSERT INTO PATTERN_STOPS (PATTERN_STOP_ID,STOP_ID,PATTERN_ID,TRAVEL_TIME,IDX) values (7,5,3,0,0);
INSERT INTO PATTERN_STOPS (PATTERN_STOP_ID,STOP_ID,PATTERN_ID,TRAVEL_TIME,IDX) values (8,2,3,9,1);
INSERT INTO PATTERN_STOPS (PATTERN_STOP_ID,STOP_ID,PATTERN_ID,TRAVEL_TIME,IDX) values (9,4,3,23,2);
INSERT INTO PATTERN_STOPS (PATTERN_STOP_ID,STOP_ID,PATTERN_ID,TRAVEL_TIME,IDX) values (10,4,4,0,0);
INSERT INTO PATTERN_STOPS (PATTERN_STOP_ID,STOP_ID,PATTERN_ID,TRAVEL_TIME,IDX) values (11,2,4,14,1);
INSERT INTO PATTERN_STOPS (PATTERN_STOP_ID,STOP_ID,PATTERN_ID,TRAVEL_TIME,IDX) values (12,5,4,23,2);
COMMIT;

INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (1,1,21600,1,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (2,2,28800,1,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (3,0,36000,1,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (4,1,45000,1,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (5,2,57600,1,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (6,1,64800,1,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (7,1,21600,2,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (8,2,28800,2,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (9,0,36000,2,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (10,1,45000,2,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (11,2,57600,2,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (12,1,64800,2,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (13,1,21600,3,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (14,2,28800,3,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (15,0,36000,3,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (16,1,45000,3,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (17,2,57600,3,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (18,1,64800,3,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (19,1,21600,4,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (20,2,28800,4,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (21,0,36000,4,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (22,1,45000,4,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (23,2,57600,4,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (24,1,64800,4,1);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (25,1,25200,1,2);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (26,0,36000,1,2);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (27,2,46800,1,2);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (28,1,57600,1,2);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (29,1,25200,2,2);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (30,0,36000,2,2);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (31,2,46800,2,2);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (32,1,57600,2,2);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (33,1,25200,3,2);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (34,0,36000,3,2);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (35,2,46800,3,2);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (36,1,57600,3,2);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (37,1,25200,4,2);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (38,0,36000,4,2);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (39,2,46800,4,2);
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID) values (40,1,57600,4,2);
COMMIT;
