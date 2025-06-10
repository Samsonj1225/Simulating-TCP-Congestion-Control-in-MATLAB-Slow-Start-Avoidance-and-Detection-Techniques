# Simulating-TCP-Congestion-Control-in-MATLAB-Slow-Start-Avoidance-and-Detection-Techniques

SIMULATING TCP CONGESTION CONTROL IN MATLAB: TAHOE VS RENO

This project simulates the TCP congestion control mechanisms of TCP Tahoe and TCP Reno in MATLAB.
It provides a visual comparison of the CWND (Congestion Window) evolution under different loss events
and thresholds using user-defined parameters. The results are plotted to show congestion phases:
Slow Start, Congestion Avoidance, and Loss Detection.

1. Set Up the MATLAB Environment
- Ensure MATLAB is installed on your system.
- No extra toolboxes are required for this simulation.
- Save the provided MATLAB script (e.g., tcp_simulation.m) and open it in MATLAB.

2. Features of the Simulation
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

3. Running the Simulation
- Open the MATLAB script.
- Run the file:
    >> tcp_simulation
- You will be prompted for inputs in the Command Window.
- After input, two subplots will appear:
  • Top – TCP Tahoe CWND evolution
  • Bottom – TCP Reno CWND evolution

4. Customization Options
- Add x-axis based on time by using RTT:
    time = (1:num_packets) * RTT;
- Save plots automatically using:
    saveas(gcf, 'tcp_simulation_plot.png');
- Log data for external analysis:
    csvwrite('tahoe_cwnd.csv', [(1:num_packets)' tahoe_cwnd']);
- Highlight loss events visually:
    xline(loss_events(i), '--r', 'Loss');

5. Educational Value
This simulation is ideal for understanding:
- The behavior of TCP during network congestion
- How TCP Tahoe and Reno differ in their recovery strategies
- Visualization of exponential growth, linear increase, and window resets

'

# NOTE:
# This file is meant to be used as a README content.
# To use it as an actual bash script, convert it to markdown or strip the colon block comment.
