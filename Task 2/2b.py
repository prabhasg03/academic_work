'''Q.)Write a program to demonstrate working with dictionaries in python.'''
#Program:
'Adding'
d={"Name":"Prabhas",
   "Age":18,
   "DOB":"10-12-2003"
   }
print(d)
d.update({"Height":5.57})
'Updating'
d["Age"]=19
print(d)
'Removing'
x=d.pop("Height")
y=d.popitem()
print("Items Deleted",x,y)
d.update({"Gender":"M"})
print(d)
'Deleting using del keyword'
del d["Gender"]
print(d)
'Clearing whole dictionary'
d.clear()
print(d)