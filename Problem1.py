##############JAN GOMEZ##############
##############ELEE 2045##############
###########Dr. Kyle Johnsen##########
import numpy as np 
import matplotlib.pyplot as plt
#All data given by the instructions
Motor_speed=0 ##Set to 0 because its the value that 
##change constantly
Voltage=5
##A instead of mA
stall_current = .2
free_rCurrent = .05
##We calculate internal resistance by voltage 5/.2 =25 current
Internal_R = 25

##we create a empty list for the 3 lines which
##they will be assign with the following data
electrical_powers = []
motor_speeds = []
##Mechanical_powers is the RMP this is key to our graph
##or in simple words is just x-axis 
mechanical_powers = []
total_powers = []
##while i could have make a for loop
##im going to be honest i dont like for loops 
##i prefer "while" i feel like they are 
##more simple 
while Motor_speed <= 5000:
    ##In this part i got very confused and i did not have 
    ##any idea, until i saw a person explain that
    ##the RPM was just solving by the slope 
    ##which is just the slope formula y1-y2/x2-x1
    ##which make sense because everytime the loop increments 
    ##the graph would keep changing the "slope"

    slope_formula = (free_rCurrent - stall_current)/5000
    ##now we apply the y=mx + b * the number of rmp by the while loop
    current = stall_current + slope_formula * Motor_speed
   
    ##After knowing the current everythin was more easy
    ##since the instructions were give in the 
    ##word documet, the only part that i did not like 
    ##was how to find the current
    Total_power = Voltage * current
    Electrical_power = current**2 * Internal_R
    Mechanical_power = Total_power - Electrical_power

    ##we use append to obtain all the values at the 
    ##end of each loop and place it in the previous lists
    motor_speeds.append(Motor_speed)
    mechanical_powers.append(Mechanical_power)
    electrical_powers.append(Electrical_power)
    total_powers.append(Total_power)

    ##Since the instructions say thet curve is a 500 rpm increments
    ##we set that after every 'while' loop is completed we add 500 until it hits
    ##5000
    Motor_speed+=500

      

##we use plot to mark motor_speed as x-axis
##and every other value as y-axis 
##we place the color and label witch helps
##to use the function legend()
plt.plot(motor_speeds, electrical_powers, c = "Orange", label = "Electrical Power Dissipation ")
plt.plot(motor_speeds,mechanical_powers, c = "Blue", label = "Mechanical Power Dissipation")
plt.plot(motor_speeds, total_powers, c = "Green", label = "Total Power Dissipation" )
plt.legend()

##x limits at 5000 rmp
plt.xlim(0,5000)

##Title of the graph
plt.title("Power Dissipation in the Motor at Varying Speeds")
##Title across y and x axis
plt.xlabel("Motor Speed(RPM)")
plt.ylabel("Power Dissipation (W)")
plt.show()
