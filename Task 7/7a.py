import pandas as  pd 
g_url="C:\Users\HP\Desktop\21241A6672\example.xlsx"
g_stud=pd.read_excel(g_url)
print(g_stud.shape)
print(g_stud.head(5))