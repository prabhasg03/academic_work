#8a.)Write a program to demonstrate working with multiple threads in python.
import threading # import the thread module  
import time # import time module  
def cal_sqre(num): # define the cal_sqre function  
    print(" Calculate the square root of the given number")  
    for n in num:   
        time.sleep(0.3) # at each iteration it waits for 0.3 time  
        print(' Square is : ', n * n)  
        
def cal_cube(num): # define the cal_cube() function  
    print(" Calculate the cube of  the given number")  
    for n in num:   
        time.sleep(0.3) # at each iteration it waits for 0.3 time  
        print(" Cube is : ", n * n *n)  

arr = [4, 5, 6, 7, 2] # given array  
t1 = time.time() # get total time to execute the functions  
cal_sqre(arr) # call cal_sqre() function  
cal_cube(arr) # call cal_cube() function  
print(" Total time taken by threads is :", time.time() - t1) # print the total time