INSERT INTO AGENCIES (AGENCY_ID,NAME,WEBSITE,TIMEZONE,TELEPHONE) values (1,'Metro Warszawskie','https://metro.waw.pl/','Europe/Warsaw',null);
INSERT INTO AGENCIES (AGENCY_ID,NAME,WEBSITE,TIMEZONE,TELEPHONE) values (2,'Tramwaje Warszawskie','https://tw.waw.pl/','Europe/Warsaw',null);
COMMIT;

INSERT INTO CALENDARS (CALENDAR_ID,NAME,START_DATE,END_DATE,MONDAY,TUESDAY,WEDNESDAY,THURSDAY,FRIDAY,SATURDAY,SUNDAY) values (1,'Robocze',to_date('01-JAN-22','DD-MON-RR'),null,'T','T','T','T','T','F','F');
INSERT INTO CALENDARS (CALENDAR_ID,NAME,START_DATE,END_DATE,MONDAY,TUESDAY,WEDNESDAY,THURSDAY,FRIDAY,SATURDAY,SUNDAY) values (2,'Weekendy',to_date('01-JAN-22','DD-MON-RR'),null,'F','F','F','F','F','T','T');
COMMIT;

INSERT INTO CALENDAR_EXCEPTIONS (CALENDAR_EXCEPTION_ID,DAY,CALENDAR_ID,ADDED) values (1,to_date('06-JAN-22','DD-MON-RR'),1,'F');
INSERT INTO CALENDAR_EXCEPTIONS (CALENDAR_EXCEPTION_ID,DAY,CALENDAR_ID,ADDED) values (2,to_date('06-JAN-22','DD-MON-RR'),2,'T');
COMMIT;

INSERT INTO LINES (LINE_ID,CODE,DESCRIPTION,TYPE,AGENCY_ID) values (1,'M1','Kabaty - Młociny',1,1);
INSERT INTO LINES (LINE_ID,CODE,DESCRIPTION,TYPE,AGENCY_ID) values (2,'M2','Księcia Janusza - Trocka',1,1);
COMMIT;

INSERT INTO STOP_GROUPS (STOP_GROUP_ID,NAME) VALUES (1,'Centrum');
COMMIT;

INSERT INTO STOPS (STOP_ID,NAME,CODE,LAT,LON,WHEELCHAIR_ACCESSIBLE) values (1,'Kabaty','A1','52.1321','21.065',1);
INSERT INTO STOPS (STOP_ID,NAME,CODE,LAT,LON,WHEELCHAIR_ACCESSIBLE) values (2,'Świętokrzyska','A14/C11','52.235','21.0079',1);
INSERT INTO STOPS (STOP_ID,NAME,CODE,LAT,LON,WHEELCHAIR_ACCESSIBLE) values (3,'Młociny','A23','52.2907','20.93',1);
INSERT INTO STOPS (STOP_ID,NAME,CODE,LAT,LON,WHEELCHAIR_ACCESSIBLE) values (4,'Trocka','C18','52.2754','21.0554',2);
INSERT INTO STOPS (STOP_ID,NAME,CODE,LAT,LON,WHEELCHAIR_ACCESSIBLE) values (5,'Księcia Janusza','C6','52.2391','20.9441',2);
INSERT INTO STOPS (STOP_ID,NAME,CODE,LAT,LON,WHEELCHAIR_ACCESSIBLE,STOP_GROUP_ID) values (6,'Centrum 01',null,'52.2291','21.0119',0,1);
INSERT INTO STOPS (STOP_ID,NAME,CODE,LAT,LON,WHEELCHAIR_ACCESSIBLE,STOP_GROUP_ID) values (7,'Centrum 02',null,'52.2318','21.0107',0,1);
COMMIT;

INSERT INTO VEHICLE_MODELS (MODEL_ID,BRAND,MODEL,TRACTION_TYPE) VALUES (1,'Metrowagonmash','Seria 81',1);
INSERT INTO VEHICLE_MODELS (MODEL_ID,BRAND,MODEL,TRACTION_TYPE) VALUES (2,'Siemens','Inspiro',1);
INSERT INTO VEHICLE_MODELS (MODEL_ID,BRAND,MODEL,TRACTION_TYPE) VALUES (3,'Pesa','120N Swing',0);
COMMIT;

INSERT INTO VEHICLES (SIDE_NUMBER,REGISTRATION_NUMBER,WHEELCHAIR_ACCESSIBLE,HAS_AIR_CONDITIONING,MODEL_ID) VALUES ('001','FOO-1-81',2,'F',1);
INSERT INTO VEHICLES (SIDE_NUMBER,REGISTRATION_NUMBER,WHEELCHAIR_ACCESSIBLE,HAS_AIR_CONDITIONING,MODEL_ID) VALUES ('002','FOO-2-81',2,'F',1);
INSERT INTO VEHICLES (SIDE_NUMBER,REGISTRATION_NUMBER,WHEELCHAIR_ACCESSIBLE,HAS_AIR_CONDITIONING,MODEL_ID) VALUES ('101','BAR-1-IN',1,'T',2);
INSERT INTO VEHICLES (SIDE_NUMBER,REGISTRATION_NUMBER,WHEELCHAIR_ACCESSIBLE,HAS_AIR_CONDITIONING,MODEL_ID) VALUES ('102','BAR-2-IN',1,'T',2);
INSERT INTO VEHICLES (SIDE_NUMBER,REGISTRATION_NUMBER,WHEELCHAIR_ACCESSIBLE,HAS_AIR_CONDITIONING,MODEL_ID) VALUES ('3101','',1,'T',3);
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

INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (1,1,'52.13117','21.06611');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (1,2,'52.16056','21.02783');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (1,3,'52.18119','21.02165');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (1,4,'52.21434','21.00517');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (1,5,'52.21697','21.01547');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (1,6,'52.23558','21.00843');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (1,7,'52.26868','20.98646');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (1,8,'52.29063','20.92999');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (2,1,'52.29063','20.92999');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (2,2,'52.26868','20.98646');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (2,3,'52.23558','21.00843');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (2,4,'52.21697','21.01547');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (2,5,'52.21434','21.00517');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (2,6,'52.18119','21.02165');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (2,7,'52.16056','21.02783');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (2,8,'52.13117','21.06611');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (3,1,'52.23936','20.94217');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (3,2,'52.23726','20.96535');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (3,3,'52.22822','20.96749');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (3,4,'52.23973','21.03195');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (3,5,'52.24667','21.04328');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (3,6,'52.25560','21.03384');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (3,7,'52.26469','21.05058');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (3,8,'52.27729','21.05766');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (4,1,'52.27729','21.05766');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (4,2,'52.26469','21.05058');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (4,3,'52.25560','21.03384');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (4,4,'52.24667','21.04328');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (4,5,'52.23973','21.03195');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (4,6,'52.22822','20.96749');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (4,7,'52.23726','20.96535');
INSERT INTO PATTERN_SHAPE_POINTS (PATTERN_ID,IDX,LAT,LON) VALUES (4,8,'52.23936','20.94217');
COMMIT;

INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (1,2,21600,1,1,'001');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (2,2,28800,1,1,'002');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (3,2,36000,1,1,'001');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (4,2,45000,1,1,'002');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (5,2,57600,1,1,'001');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (6,2,64800,1,1,'002');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (7,2,21600,2,1,'002');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (8,2,28800,2,1,'001');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (9,2,36000,2,1,'002');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (10,2,45000,2,1,'001');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (11,2,57600,2,1,'002');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (12,2,64800,2,1,'001');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (13,1,21600,3,1,'101');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (14,1,28800,3,1,'102');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (15,1,36000,3,1,'101');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (16,1,45000,3,1,'102');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (17,1,57600,3,1,'101');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (18,1,64800,3,1,'102');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (19,1,21600,4,1,'102');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (20,1,28800,4,1,'101');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (21,1,36000,4,1,'102');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (22,1,45000,4,1,'101');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (23,1,57600,4,1,'102');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (24,1,64800,4,1,'101');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (25,1,25200,1,2,'101');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (26,0,36000,1,2,'001');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (27,0,46800,1,2,'101');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (28,0,57600,1,2,'001');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (29,0,25200,2,2,'001');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (30,0,36000,2,2,'101');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (31,0,46800,2,2,'001');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (32,0,57600,2,2,'101');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (33,0,25200,3,2,'102');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (34,0,36000,3,2,'002');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (35,0,46800,3,2,'102');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (36,0,57600,3,2,'002');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (37,0,25200,4,2,'002');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (38,0,36000,4,2,'102');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (39,0,46800,4,2,'002');
INSERT INTO TRIPS (TRIP_ID,WHEELCHAIR_ACCESSIBLE,DEPARTURE,PATTERN_ID,CALENDAR_ID,VEHICLE_SIDE_NUMBER) values (40,0,57600,4,2,'102');
COMMIT;
