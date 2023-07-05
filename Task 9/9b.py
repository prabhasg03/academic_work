'''9b.)Develop a Python GUI application that receives an integer in one text field,
 and computes its  factorial Value and fills it in another text field, 
 when the button named “Compute” is clicked'''
 #Program:
import tkinter as tk
from tkinter.colorchooser import *
def factorial(n): 
 # single line to find factorial
    return 1 if (n==1 or n==0) else n * factorial(n - 1); 
def calculate():
    result=factorial(int(entryText.get()))
    info.config(text=result)
mw = tk.Tk()
mw.title('COLOR ME!!!')
mw.geometry("200x200")
mw.resizable(0, 0)
entryText = tk.Entry(text=1, bg='white', fg='black')
entryText.place(x = 50, y = 25, width=100, height=25)
btn = tk.Button(text='Calculate', command=calculate)
btn.place(x = 50, y = 75, width=100, height=25)
info = tk.Label(text='result', bg='white', fg='black')
info.place(x = 50, y = 125, width=100, height=25)
mw.mainloop()