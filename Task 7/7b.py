'''7b.)Write a class Complex for performing arithmetic with complex numbers. 
The constructor for this class should take two floating-point values. 
Add methods for adding, subtracting, and multiplying two complex numbers.'''
class Complex:
    def __init__(self,x,y):
        self.a=x
        self.b=y
    def add(self):
        return (self.a)+(self.b)
    def sub(self):
        return (self.a)-(self.b)
    def mul(self):
        return (self.a)*(self.b)
    
print("Enter Number in a+bj format only")
a=(str(input('Enter Complex number-1:')))
b=(str(input('Enter Complex number-2:')))
t=Complex(complex(a),complex(b))
print("Addition:",t.add())
print("Subtraction:",t.sub())
print("Multiplication:",t.mul())
'''Output:
PS C:/21241A6625> & c:/Users/HP/Desktop/21241A6625/.conda/python.exe "c:/21241A6625/Task 7/7b.py"
Enter Number in a+bj format only
Enter Complex number-1:4.4+9.8j
Enter Complex number-2:5.2+10.4j
Addition: (9.600000000000001+20.200000000000003j)
Subtraction: (-0.7999999999999998-0.5999999999999996j)
Multiplication: (-79.04000000000002+96.72000000000001j)'''