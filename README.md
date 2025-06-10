# Simulating TCP Congestion Control in MATLAB: Slow-Start, Avoidance, Detection Techniques

This project simulates the TCP congestion control mechanisms of **TCP Tahoe** and **TCP Reno** in MATLAB.
It provides a visual comparison of the CWND (Congestion Window) evolution under different loss events
and thresholds using user-defined parameters. The results are plotted to show congestion phases:
**Slow Start**, **Congestion Avoidance**, and **Loss Detection**.

---

## 1. Set Up the MATLAB Environment

1. Set Up the MATLAB Environment
- Ensure MATLAB is installed on your system.
- Save the provided MATLAB script (e.g., TCP Congestion Control.m) and open it in MATLAB.


- Alternatively, use **MATLAB Online** with no installation required:
  - Visit: https://matlab.mathworks.com
  - Sign in with a MathWorks account to run scripts directly in your browser.

- Save the provided MATLAB script (e.g., `TCP_Congestion_Control.m`) and open it in MATLAB.

---

## 2. Running the Simulation

- Open the MATLAB script in the editor.
- Run the file by typing the following in the MATLAB Command Window:
  >> TCP_Congestion_Control

- You will be prompted for simulation inputs:
  - **Number of packets**
  - **MSS size in KB**
  - **RTT in milliseconds**
  - **Initial ssthresh values for both Tahoe and Reno**
  - **List of packet numbers where loss events occur (e.g., [30 60 90])**

- After providing input, a figure window will display two subplots:
  - **Top** – TCP Tahoe CWND evolution
  - **Bottom** – TCP Reno CWND evolution

---

## 3. Features of the Simulation

- **User-configurable parameters:**
  - Number of packets \[50–1000\]
  - MSS size in KB \[0.1–4\]
  - RTT in ms \[10–300\]
  - Initial `ssthresh` values for both Tahoe and Reno \[4–64\]
  - Packet loss positions as an array (e.g., \[30 60 90\])

- **Separate simulation logic for:**
  - **TCP Tahoe**: CWND resets to 1 after loss detection.
  - **TCP Reno**: CWND reduces to `ssthresh` after loss.

- **CWND evolution graphs:**
  - Color-coded phases for clarity:
    - 🔵 Blue – Slow Start
    - 🟢 Green – Congestion Avoidance
    - 🔴 Red – Loss Detection

- **Visualization details:**
  - Clear plots with grid and legends
  - Packet-wise CWND evolution
  - Annotations to enhance understanding

