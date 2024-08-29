Create Database railway_management_system;
use railway_management_system;

create table Trains(
train_id int auto_increment primary key,
train_name varchar(100) not Null,
capacity int not null,
train_type varchar(50) Not Null
);

create table Stations(
station_id int auto_increment primary key,
station_name varchar(100) not null,
location varchar(100) not null
);

create table Routes(
route_id int auto_increment primary key,
origin_station_id int not null,
destination_station_id int not null,
distance int not null,
Foreign Key (origin_station_id) References stations(station_id),
Foreign key (destination_station_id) references stations(station_id)
);

create table Schedules(
schedule_id int auto_increment primary key,
train_id int not null,
route_id int not null,
departure_time Datetime not null,
arrival_time datetime not null,
foreign key (train_id) references trains(train_id),
foreign key (route_id) references routes(route_id)
);

create table Passengers(
passenger_id int auto_increment primary key,
first_name varchar(100) not null,
last_name varchar(100) not null,
email_id varchar(100) not null,
phone varchar(30) not null
);

create table Bookings(
booking_id int auto_increment primary key,
passenger_id int not null,
schedule_id int not null,
booking_date Datetime not null,
seat_number varchar(50) not null,
status varchar(50) not null,
foreign key (passenger_id) references passengers(passenger_id),
foreign key (schedule_id) references schedules(schedule_id)
);

-- Insert data into Trains table
INSERT INTO Trains (train_name, capacity, train_type) VALUES
('Express 101', 300, 'Express'),
('Local 202', 150, 'Local'),
('Superfast 303', 350, 'Superfast'),
('Intercity 404', 200, 'Intercity'),
('Highspeed 505', 400, 'Highspeed');

-- Insert data into Stations table
INSERT INTO Stations (station_name, location) VALUES
('Central Station', 'City Center'),
('North Station', 'North District'),
('South Station', 'South District'),
('East Station', 'East District'),
('West Station', 'West District');

-- Insert data into Routes table
INSERT INTO Routes (origin_station_id, destination_station_id, distance) VALUES
(1, 2, 100),
(2, 3, 150),
(3, 4, 200),
(4, 5, 250),
(1, 5, 600);

-- Insert data into Schedules table
INSERT INTO Schedules (train_id, route_id, departure_time, arrival_time) VALUES
(1, 1, '2024-08-30 08:00:00', '2024-08-30 10:00:00'),
(2, 2, '2024-08-30 09:00:00', '2024-08-30 11:30:00'),
(3, 3, '2024-08-30 10:00:00', '2024-08-30 13:00:00'),
(4, 4, '2024-08-30 11:00:00', '2024-08-30 15:00:00'),
(5, 5, '2024-08-30 12:00:00', '2024-08-30 18:00:00');

-- Insert data into Passengers table
INSERT INTO Passengers (first_name, last_name, email_id, phone) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890'),
('Jane', 'Smith', 'jane.smith@example.com', '123-456-7891'),
('Alice', 'Johnson', 'alice.johnson@example.com', '123-456-7892'),
('Bob', 'Brown', 'bob.brown@example.com', '123-456-7893'),
('Charlie', 'Davis', 'charlie.davis@example.com', '123-456-7894');

-- Insert data into Bookings table
INSERT INTO Bookings (passenger_id, schedule_id, booking_date, seat_number, status) VALUES
(1, 1, '2024-08-29 14:00:00', 'A1', 'Confirmed'),
(2, 2, '2024-08-29 15:00:00', 'B2', 'Pending'),
(3, 3, '2024-08-29 16:00:00', 'C3', 'Cancelled'),
(4, 4, '2024-08-29 17:00:00', 'D4', 'Confirmed'),
(5, 5, '2024-08-29 18:00:00', 'E5', 'Confirmed');