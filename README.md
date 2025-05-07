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
![Snímka obrazovky 2025-05-07 003909](https://github.com/user-attachments/assets/b25197b6-9e6b-4418-8241-25f9369f7418)


## Main component simulation:

### Clock:



📊 Simulation Overview
In the simulation, the behavior of the clock during overflow conditions was verified. After one cycle of the clk_1hz signal, the seconds counter rolls over from 59 to 00. A similar overflow occurs for minutes, which reset from 59 to 00. The hours counter follows the same pattern, resetting from 23 to 00. These transitions confirm the correct operation of the time-counting logic as observed in the simulation results.


⏱ Stopwatch Mode Simulation
The simulation also tested the stopwatch functionality. When Switch 2 is turned on, the system enters stopwatch mode, which is shown on the display. Pressing the BTNC button once starts the stopwatch using the CLK_1Hz signal. Pressing BTNC again pauses the count. Additionally, Switch 2 also serves as a reset function, returning the stopwatch to its initial state.
________________________________________________

### Simulations
Test of stopwatch
![image](https://github.com/user-attachments/assets/28414063-0e36-4e76-82f4-e56e454af834)

Test of alarm
![image](https://github.com/user-attachments/assets/7f8f2e8f-defb-47ba-b7c1-c7122552e95c)

________________________________________________

# References


https://www.edaplayground.com/

[https://vhdl.lapinoo.net/](https://vhdlwhiz.com/free_vhdl_simulator_and_editor/)

https://github.com/tomas-fryza/vhdl-labs


