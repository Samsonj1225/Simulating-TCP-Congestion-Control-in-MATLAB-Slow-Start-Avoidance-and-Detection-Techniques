# Simulating-TCP-Congestion-Control-in-MATLAB-Slow-Start-Avoidance-and-Detection-Techniques

This project simulates the TCP congestion control mechanisms of TCP Tahoe and TCP Reno in MATLAB.
It provides a visual comparison of the CWND (Congestion Window) evolution under different loss events
and thresholds using user-defined parameters. The results are plotted to show congestion phases:
Slow Start, Congestion Avoidance, and Loss Detection.

1. Set Up the MATLAB Environment
- Ensure MATLAB is installed on your system.
- Save the provided MATLAB script (e.g., TCP Congestion Control.m) and open it in MATLAB.
- Alternatively, you can use the online version of MATLAB without installation by signing into: https://matlab.mathworks.com


2. Running the Simulation
- Open the MATLAB script.
- Run the file:
    >> TCP Congestion Control.m
- You will be prompted for inputs in the Command Window.
- After input, two subplots will appear:
  • Top – TCP Tahoe CWND evolution
  • Bottom – TCP Reno CWND evolution
  
3. Features of the Simulation
- User input interface to configure:
  • Number of packets [50–1000]
  • MSS in KB [0.1–4]
  • RTT in ms [10–300]
  • Initial ssthresh values for Tahoe and Reno [4–64]
  • Packet numbers where packet loss occurs (e.g., [30 60 90])
- Independent simulation of TCP Tahoe and TCP Reno behavior
- CWND graph for both protocols with color-coded phases:
  • Blue – Slow Start
  • Green – Congestion Avoidance
  • Red – Loss Detection
- RTT and MSS can be scaled to compute throughput (optional extension)
- Clear plots with legends and annotations for better understanding



