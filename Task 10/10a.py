'''Task 10 a) :Write a Python program that creates a user interface to perform integer
divisions. The user enters two numbers in the text fields, Num1 and Num2. The division
of Num1 and Num2 is displayed in the Result field when the Divide button is clicked. If
Num1 or Num2 were not an integer Num2 is Zero, the program should Display an
appropriate message in the result field in Red color.'''
#Program:
import tkinter as tk
def Divide():
    a=Num1.get()
    b=Num2.get()
    if a.isnumeric() and b.isnumeric():
        try:
            result=int(a)//int(b)
            info1.config(text=result)
        except ZeroDivisionError:
            zdemessage='Num2 cannot be zero'
            info1.config(text=zdemessage)
        except:
            message='Something Went Wrong'
            info1.config(text=message)
    else:
        emessage='enter only integer values'
        info1.config(text=emessage)
            
window = tk.Tk()
window.title('Integer division')
window.geometry("350x200")
#window.resizable(0, 0)
Num1 = tk.Entry(text=1, bg='white', fg='black')
Num1.place(x = 10, y = 25, width=100, height=25)
Num2 = tk.Entry(text=2, bg='white', fg='black')
Num2.place(x = 200, y = 25, width=100, height=25)
btn = tk.Button(text='Divide', command=Divide)
btn.place(x = 100, y = 75, width=100, height=25)
info1 = tk.Label(text='result', bg='white', fg='red')
info1.place(x = 50, y = 125, width=200, height=25)
window.mainloop()