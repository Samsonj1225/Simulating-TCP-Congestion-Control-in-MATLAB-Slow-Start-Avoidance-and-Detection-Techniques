clc; clear;

% --- USER INPUTS WITH RANGES ---
fprintf('--- TCP Simulation Inputs ---\n');
fprintf('Recommended ranges:\n');
fprintf('  Number of Packets: 50 - 1000\n');
fprintf('  MSS (KB): 0.1 - 4\n');
fprintf('  RTT (ms): 10 - 300\n');
fprintf('  ssthresh (both): 4 - 64\n');
fprintf('  Loss Events (e.g. [30 60 90]): must be within packet range');
drawnow;  % 🔁 Ensure output is shown before input prompts

% Input block with validation
num_packets = input('Enter number of packets [50-1000]: ');
if num_packets < 50 || num_packets > 1000
    error('num_packets should be between 50 and 1000.');
end

MSS = input('Enter MSS in KB [0.1-4]: ');
if MSS < 0.1 || MSS > 4
    error('MSS should be between 0.1 and 4 KB.');
end

RTT_ms = input('Enter Round Trip Time in ms [10-300]: ');
if RTT_ms < 10 || RTT_ms > 300
    error('RTT should be between 10 and 300 ms.');
end
RTT = RTT_ms / 1000;

ssthresh_tahoe = input('Enter initial Tahoe ssthresh [4-64]: ');
ssthresh_reno  = input('Enter initial Reno ssthresh [4-64]: ');
if any([ssthresh_tahoe ssthresh_reno] < 4) || any([ssthresh_tahoe ssthresh_reno] > 64)
    error('ssthresh must be between 4 and 64.');
end

loss_events = input('Enter loss events as array [e.g. [30 60 90]]: ');
if any(loss_events < 1) || any(loss_events > num_packets)
    error('Loss event packet numbers must be within simulation range.');
end

% --- INITIALIZE VARIABLES ---
cwnd_tahoe = 1;
cwnd_reno = 1;
tahoe_cwnd = zeros(1, num_packets);
reno_cwnd = zeros(1, num_packets);
tahoe_phase = strings(1, num_packets);
reno_phase = strings(1, num_packets);

% --- SIMULATION LOOP ---
for pkt = 1:num_packets
    % Tahoe
    if ismember(pkt, loss_events)
        ssthresh_tahoe = max(floor(cwnd_tahoe / 2), 1);
        cwnd_tahoe = 1;
        tahoe_phase(pkt) = "Detection";
    elseif cwnd_tahoe < ssthresh_tahoe
        cwnd_tahoe = cwnd_tahoe * 2;
        tahoe_phase(pkt) = "Slow Start";
    else
        cwnd_tahoe = cwnd_tahoe + 1;
        tahoe_phase(pkt) = "Avoidance";
    end
    tahoe_cwnd(pkt) = cwnd_tahoe;

    % Reno
    if ismember(pkt, loss_events)
        ssthresh_reno = max(floor(cwnd_reno / 2), 1);
        cwnd_reno = ssthresh_reno;
        reno_phase(pkt) = "Detection";
    elseif cwnd_reno < ssthresh_reno
        cwnd_reno = cwnd_reno * 2;
        reno_phase(pkt) = "Slow Start";
    else
        cwnd_reno = cwnd_reno + 1;
        reno_phase(pkt) = "Avoidance";
    end
    reno_cwnd(pkt) = cwnd_reno;
end

% --- PLOT BOTH GRAPHS ON ONE PAGE ---
figure;

% TCP Tahoe Plot
subplot(2,1,1);
hold on; grid on;
title('TCP Tahoe Congestion Control');
xlabel('Packet Number'); ylabel('CWND');

plot(1:num_packets, tahoe_cwnd, 'k-', 'LineWidth', 1.2);
scatter(find(tahoe_phase=="Slow Start"), tahoe_cwnd(tahoe_phase=="Slow Start"), 50, 'b', 'filled');
scatter(find(tahoe_phase=="Avoidance"), tahoe_cwnd(tahoe_phase=="Avoidance"), 50, 'g', 'filled');
scatter(find(tahoe_phase=="Detection"), tahoe_cwnd(tahoe_phase=="Detection"), 50, 'r', 'filled');
legend('CWND Path', 'Slow Start', 'Avoidance', 'Detection');

% TCP Reno Plot
subplot(2,1,2);
hold on; grid on;
title('TCP Reno Congestion Control');
xlabel('Packet Number'); ylabel('CWND');

plot(1:num_packets, reno_cwnd, 'k-', 'LineWidth', 1.2);
scatter(find(reno_phase=="Slow Start"), reno_cwnd(reno_phase=="Slow Start"), 50, 'b', 'filled');
scatter(find(reno_phase=="Avoidance"), reno_cwnd(reno_phase=="Avoidance"), 50, 'g', 'filled');
scatter(find(reno_phase=="Detection"), reno_cwnd(reno_phase=="Detection"), 50, 'r', 'filled');
legend('CWND Path', 'Slow Start', 'Avoidance', 'Detection');