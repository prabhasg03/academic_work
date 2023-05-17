'''7a.)Create a class Rectangle.The constructor for this class should take two numeric arguments, 
which are the length and breadth. 
Add methods to compute the area and perimeter of the rectangle,  
as  well  as  methods  that  simply  return  the  length  and  breadth. 
 Add  a method' isSquare'that returns a Boolean value if the Rectangle is a Square.'''
class Rectangle:
    l,b=0,0
    def __init__(self,x,y):
        self.l=x
        self.b=y
    def area(self):
        return self.l*self.b
    def perimeter(self):
        return 2*(self.l+self.b)
    def lb(self):
        return self.l,self.b
    def isSquare(self):
        return True if self.l==self.b else False

a=int(input('Enter length:'))
b=(int(input('Enter Breadth:')))
l=Rectangle(a,b)
print('Area:',l.area())
print('Perimeter:',l.perimeter())
print('Length,Breadth:',l.lb())
print('isSquare:',l.isSquare())