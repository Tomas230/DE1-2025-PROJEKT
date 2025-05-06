# DE1 PROJECT - DIGITAL CLOCK WITH ALARM AND STOPWATCH
# Team members

Member 1: Ondřej Hovorka 

Member 2: Kryštof Javůrek

Member 3: Tomáš Hutta


________________________________________________

# Program description
## 🕒 Digital Clock Project (VHDL)

This project implements a digital clock in VHDL, featuring the essential functions of a classic digital clock along with a stopwatch and alarm system.

---

### ⏰ Digital Clock

The digital clock operates on a **1 Hz clock signal**, counting pulses on the rising edge. Time can be set using the **yellow buttons** on the board. Each **7-segment display** can be individually selected to accurately adjust the current time.

---

### ⏱ Stopwatch

The stopwatch works similarly to the main clock, also using a 1 Hz signal for counting. It is controlled by a **single yellow button (middle)**:

- **First press**: Starts the stopwatch
- **Second press**: Stops the stopwatch
- **Reset**: Performed using **Switch 2**

---

### 🚨 Alarm

The alarm function enables users to set a specific activation time. Once the system reaches that time, a **signal is triggered** and indicated via an **LED diode**.

---

### 🔧 Features Overview

- VHDL-based implementation
- Time configuration via onboard buttons
- Real-time clock, stopwatch, and alarm functions
- Visual output using 7-segment displays and LED indicators

---
### NEXYS-A7-50T
![image](https://github.com/user-attachments/assets/32ac67c4-537f-47bf-80d2-dcccd13ca3ec)

________________________________________________

# Software description

## Block Scheme:
![image](https://github.com/user-attachments/assets/eb087970-55d7-4c71-9f35-b385362d16a3)

## Main component simulation:

### Clock:

![image](https://github.com/user-attachments/assets/cefaf0c0-360e-49ea-add1-5658e99d4cbf)

After one period of the clk_1hz signal, the seconds overflow from 59 to 00. The same thing happens with the minutes at 59, then they are also reset to 00.
Similarly, an overflow occurs for hours. From value 23 to 00. This triple transition is correctly captured in the simulation and verifies the correct functionality of the counter.


![image](https://github.com/user-attachments/assets/261d83d5-b7f8-4c2d-9b18-593602916f8b)

In this simulation was tested function of the stopwatch. If is switch 2 on - Stopwatch mode is displayed on the board. Then by pressing BTNC stopwatch starts couining using our CLK_1Hz. When you push BTNC once a again, then couting will stop. Switch 2 also works as a reset button.

________________________________________________

# References


https://www.edaplayground.com/

https://vhdl.lapinoo.net/

https://github.com/tomas-fryza/vhdl-labs


