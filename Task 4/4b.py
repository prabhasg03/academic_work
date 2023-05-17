'''4b.)Write a program to demonstrate 'finally' keyword in python.'''
try:
    a=int(input('Enter Age:'))
    if(a<0):
        raise Exception("Enter Age above 0")
    if(a<18):
        raise Exception("Not eligible to vote")
    print('Eligible to vote')
except ValueError:
    print("Enter a number in age")
except Exception:
      print(Exception)
finally:
        print('You are welcome')