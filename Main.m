% Author Name: Heidi Kling
% Email: klingh24@rowan.edu
% Course: MATLAB Programming - Fall 2024
% Assignment: Midterm
% Task: Main Script
% Date: 11/11/2024

clear;
clc;


db = StudentDatabase();

%creates 6 students with vaiorus attriutes
s1 = Student('1', 'Ian', 16, 1.9, 'MechE');
s2 = Student('2', 'Nate', 13, 2.9, 'Mathematics');
s3 = Student('3', 'Nolan 21, 3.6, 'Computer Science');
s4 = Student('4', 'Trevor', 23, 4.0, 'Physics');
s5 = Student('5', 'Layla', 21, 3.6, 'EcE');
s6 = Student('6', 'CJ', 20, 3.0, 'MechE');

%add students to the database
db = db.addStudent(s1);
db = db.addStudent(s2);
db = db.addStudent(s3);
db = db.addStudent(s4);
db = db.addStudent(s5);
db = db.addStudent(s6);

%save database to a file
db.saveToFile('studentDatabase.mat');

%load database from a file
loadedDB = db.loadFromFile('studentDatabase.mat');

%find a student by ID
studentFound = loadedDB.findStudentByID('002');
if ~isempty(studentFound)
    studentFound.displayInfo();
end

%gets students by major
csStudents = loadedDB.getStudentsByMajor('Computer Science');
for i = 1:length(csStudents)
    csStudents(i).displayInfo();
end

%generate visualizations
figure;
subplot(3, 1, 1);
plotGPADistribution(loadedDB.Students);

subplot(3, 1, 2);
plotAverageGPAByMajor(loadedDB.Students);

subplot(3, 1, 3);
plotAgeDistribution(loadedDB.Students);
