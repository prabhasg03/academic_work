'''TASK 10b). Write a Python program that simulates a traffic light. The program lets the
user select one of three lights: red, yellow, or green. When a radio button is selected, the
light is turned on, and only one light can be on at a time. No light is on when the program
starts.'''
#Program:
from tkinter import *

class TrafficLights:
    def _init_(self):
        window = Tk()
        window.title("Traffic Light")
        frame = Frame(window)
        frame.pack()
        self.color = IntVar()
        radio_red = Radiobutton(frame, text="Red", bg="red", variable=self.color, value=1,
        command=self.on_RadioChange)
        radio_red.grid(row=10, column=1)
        radio_yellow = Radiobutton(frame, text="Yellow", bg="yellow", variable=self.color,value=2, command=self.on_RadioChange)
        radio_yellow.grid(row = 10, column = 2) 
        radio_green = Radiobutton(frame, text="Green", bg="green", variable=self.color, value=3,command=self.on_RadioChange)
        radio_green.grid(row = 10, column = 3)
        self.canvas = Canvas(window, width=450, height=300, bg="white")
        self.canvas.pack()
        self.oval_red = self.canvas.create_oval(10, 10, 110, 110, fill="white")
        self.oval_yellow = self.canvas.create_oval(10, 120, 110, 220, fill="white")
        self.oval_green = self.canvas.create_oval(10,230, 110, 330, fill="white")
#self.color.set('R')
#self.canvas.itemconfig(self.oval_red, fill="red")
        window.mainloop()
    def on_RadioChange(self):
        color = self.color.get()
        if color == 1:
            self.canvas.itemconfig(self.oval_red, fill="red")
            self.canvas.itemconfig(self.oval_yellow, fill="white")
            self.canvas.itemconfig(self.oval_green, fill="white")
        elif color == 2:
            self.canvas.itemconfig(self.oval_red, fill="white")
            self.canvas.itemconfig(self.oval_yellow, fill="yellow")
            self.canvas.itemconfig(self.oval_green, fill="white")
        elif color == 3:
            self.canvas.itemconfig(self.oval_red, fill="white")
            self.canvas.itemconfig(self.oval_yellow, fill="white")
            self.canvas.itemconfig(self.oval_green, fill="green")

t=TrafficLights()