/*
a. Create a structure student with name ,rollno,marks of 3 subjects as members . Write a c 
program to sort student details based on total using structures and functions .
*/
//Program:
#include <stdio.h>
#include <string.h>

struct student {
    char name[50];
    int rollno;
    int marks[3];
    int total;
};

void sort_students(struct student students[], int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (students[j].total < students[j + 1].total) {
                struct student temp = students[j];
                students[j] = students[j + 1];
                students[j + 1] = temp;
            }
        }
    }
}

int main() {
    struct student students[3] = {
        {"Alice", 1, {90, 85, 95}},
        {"Bob", 2, {80, 75, 70}},
        {"Charlie", 3, {95, 90, 85}}
    };
    
    int n = sizeof(students) / sizeof(students[0]);
    
    for (int i = 0; i < n; i++) {
        students[i].total = students[i].marks[0] + students[i].marks[1] + students[i].marks[2];
    }
    
    sort_students(students, n);
    
    printf("Sorted student details based on total marks:\n");
    for (int i = 0; i < n; i++) {
        printf("Name: %s, Roll No: %d, Total Marks: %d\n", students[i].name, students[i].rollno, students[i].total);
    }
    
    return 0;
}
