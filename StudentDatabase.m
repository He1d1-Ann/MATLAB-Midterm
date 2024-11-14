% Author Name: Heidi Kling
% Email: klingh24@rowan.edu
% Course: MATLAB Programming - Fall 2024
% Assignment: Midterm
% Task: Student Data Base
% Date: 11/11/2024

classdef StudentDatabase
    properties
        Students = [];
    end
    
    methods
    %adds students
        function obj = addStudent(obj, student)
            obj.Students = [obj.Students; student];
        end
    %finds students by ID
        function student = findStudentByID(obj, id)
            student = obj.Students(strcmp({obj.Students.ID}, id));
        end
    %gets students by major
        function list = getStudentsByMajor(obj, major)
            list = obj.Students(strcmp({obj.Students.Major}, major));
        end
    %saves the founf student to a file
        function saveToFile(obj, filename)
            save(filename, 'obj');
        end
    %loads the saved student from the file
        function obj = loadFromFile(obj, filename)
            loadedData = load(filename);
            obj = loadedData.obj;
        end
    end
end

