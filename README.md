: '
# Simulating-TCP-Congestion-Control-in-MATLAB-Slow-Start-Avoidance-and-Detection-Techniques

This project simulates the TCP congestion control mechanisms of TCP Tahoe and TCP Reno in MATLAB.
It provides a visual comparison of the CWND (Congestion Window) evolution under different loss events
and thresholds using user-defined parameters. The results are plotted to show congestion phases:
Slow Start, Congestion Avoidance, and Loss Detection.

## 1. Set Up the MATLAB Environment
- Ensure MATLAB is installed on your system.
  • Download: https://www.mathworks.com/products/matlab.html
  • Student licenses may be available via your academic institution.

- Alternatively, you can use the **online version of MATLAB** without installation by signing into:
  https://matlab.mathworks.com
  • Ideal for testing if you don’t have MATLAB locally installed.
  • No installation or extra toolboxes required for this simulation.

- Save the provided MATLAB script (e.g., TCP_Congestion_Control.m) and open it in MATLAB.

## 2. Running the Simulation
- Open the MATLAB script.
- Run the file by typing the following in the Command Window:
  >> TCP_Congestion_Control

- You will be prompted for simulation inputs:
  • Number of packets
  • MSS size in KB
  • RTT in milliseconds
  • Initial ssthresh values for both Tahoe and Reno
  • List of packet numbers where loss events occur

- After providing input, a figure window will open with two subplots:
  • Top – TCP Tahoe CWND evolution
  • Bottom – TCP Reno CWND evolution

## 3. Features of the Simulation
- User-configurable parameters:
  • Number of packets [50–1000]
  • MSS in KB [0.1–4]
  • RTT in ms [10–300]
  • Initial ssthresh values for Tahoe and Reno [4–64]
  • Packet loss positions as an array (e.g., [30 60 90])

- TCP Algorithm Simulations:
  • TCP Tahoe: CWND reset to 1 on loss
  • TCP Reno: CWND reduced to ssthresh on loss

- CWND evolution visualization:
  • Blue – Slow Start phase
  • Green – Congestion Avoidance phase
  • Red – Loss Detection phase

- Clear plots with legends and packet-wise CWND progression
- Optional extension: RTT and MSS can be used to calculate throughput
- Easy to extend for other TCP variants (e.g., NewReno, BBR)

'
