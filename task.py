d=dict()
d={
    "Father":{
    "Name":"HariPrasad",
    "Age":51,
    "Gender":"M",
    },
    "Mother":{
    "Name":"Lakshmi",
    "Age":46,
    "Gender":"F",
    },
    "Son":{
    "Name":"Prabhas",
    "Age":19,
    "Gender":"M",},
}
for i in d:
    print(i+":")
    for x in d[i]:
        print(x,":",d[i][x])