'''7b.)Write a class Complex for performing arithmetic with complex numbers. 
The constructor for this class should take two floating-point values. 
Add methods for adding, subtracting, and multiplying two complex numbers.'''
class Complex:
    a=complex(0)
    def __init__(self,x) -> a:
        a=complex(x)

class Arithmetic:
    a,b=complex(0.0),complex(0.0)
    def __init__(self,x,y):
        self.a=x
        self.b=y
    def add(self):
        return complex(self.a)+complex(self.b)
    def sub(self):
        return complex(self.a)-complex(self.b)
    def mul(self):
        return complex(self.a)*complex(self.b)

a=(str(input('Enter Complex number-1').split()))
b=(str(input('Enter Complex number-2').split()))
x=Complex(a)
y=Complex(b)
t=Arithmetic(x,y)
print(t.add())
print(t.sub())
print(t.mul())
