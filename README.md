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

