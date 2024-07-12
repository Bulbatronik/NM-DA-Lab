<h1 align="center">Anomaly Detection in Optical Transponders Images (NM&DA Lab)</h1>

*Developed with Kiarash Rezaei and Sajad Hamzenejadi*.

Repo containing the projects and homeworks done during "Network Measurements &amp; Data Analysis Lab" course

The repository has the following structure:
```bash
📦Network-Measurements-and-Data-Analysis-Lab
 ┣ 📂DA-lab
 ┃ ┣ 📂1-Failure-management-optical
 ┃ ┃ ┣ 📜datasets.zip
 ┃ ┃ ┣ 📜failure-management.ipynb
 ┃ ┃ ┗ 📜theor+HW1.pdf
 ┃ ┣ 📂2-Traffic-prediction
 ┃ ┃ ┣ 📜dataset.zip
 ┃ ┃ ┣ 📜theor+HW2.pdf
 ┃ ┃ ┗ 📜traffic-prediction.ipynb
 ┃ ┣ 📂3-QoT-estimation
 ┃ ┃ ┣ 📜datasets.zip
 ┃ ┃ ┣ 📜qos-estimation.ipynb
 ┃ ┃ ┗ 📜theor+HW3.pdf
 ┃ ┣ 📂4-Failure-management-microwave
 ┃ ┃ ┣ 📜failure-management-microwave.ipynb
 ┃ ┃ ┣ 📜Labelled_Multiclass.csv
 ┃ ┃ ┗ 📜theor.pdf
 ┃ ┗ 📂5-Explainable-AI-in-telecom
 ┃ ┃ ┣ 📜Labelled_Multiclass.csv
 ┃ ┃ ┣ 📜theor.pdf
 ┃ ┃ ┗ 📜XAI-failure-management-microwave.ipynb
 ┃ ┗ 📜README.md
 ┣ 📂NM-lab
 ┃ ┣ 📂1-Active-measurements
 ┃ ┃ ┣ 📜iperf3.ipynb
 ┃ ┃ ┣ 📜ping-traceroute.ipynb
 ┃ ┃ ┗ 📜snmp.ipynb
 ┃ ┣ 📂2-Passive-measurements
 ┃ ┃ ┣ 📜data-visualization.ipynb
 ┃ ┃ ┣ 📜LTE_measurements.csv
 ┃ ┃ ┣ 📜RTT_measurements.csv
 ┃ ┃ ┗ 📜tcpdump-example.ipynb
 ┃ ┣ 📂3-Traffic-classification
 ┃ ┃ ┣ 📜traffic-classification.ipynb
 ┃ ┃ ┗ 📜traffic_captures.zip
 ┃ ┣ 📂4-WiFi-sniffing
 ┃ ┃ ┣ 📜capture_10_36_mon_5.pcapng
 ┃ ┃ ┣ 📜fingerprint_files.zip
 ┃ ┃ ┣ 📜probe-analysis1.ipynb
 ┃ ┃ ┣ 📜probe-analysis2.ipynb
 ┃ ┃ ┣ 📜test_files.zip
 ┃ ┃ ┗ 📜wifi-localization.ipynb
 ┃ ┣ 📂5-Video-streaming-monitoring
 ┃ ┃ ┣ 📜dns_pcap_yt_s_1_1005.pcap.log
 ┃ ┃ ┣ 📜LiveCapturingTool.py
 ┃ ┃ ┣ 📜Live_Capture_NetLabMeas.csv
 ┃ ┃ ┣ 📜min_out_pcap_yt_s_1_1005.pcap.log
 ┃ ┃ ┣ 📜requests_yt_s_1_1005.log
 ┃ ┃ ┣ 📜video-traffic-monitoring.ipynb
 ┃ ┃ ┗ 📜yt_s_1_1005.log
 ┃ ┗ 📂Assignments
 ┃ ┃ ┣ 📂HW1-Active-Measurements
 ┃ ┃ ┃ ┣ 📜assignment1.ipynb
 ┃ ┃ ┃ ┗ 📜HW1.pdf
 ┃ ┃ ┣ 📂HW2-Fingerprinting
 ┃ ┃ ┃ ┣ 📜assignment2.ipynb
 ┃ ┃ ┃ ┣ 📜data_hw2.zip
 ┃ ┃ ┃ ┣ 📜data_hw2_new.zip
 ┃ ┃ ┃ ┣ 📜get_data.sh
 ┃ ┃ ┃ ┗ 📜HW2.pdf
 ┃ ┃ ┗ 📂HW3-HTTP-Request-Arrival-Estimation
 ┃ ┃ ┃ ┣ 📜assignment3.ipynb
 ┃ ┃ ┃ ┣ 📜Captures_HW3.zip
 ┃ ┃ ┃ ┗ 📜HW3.pdf
 ┃ ┗ 📜README.md
 ┣ 📂Project
 ┃ ┣ 📂data
 ┃ ┃ ┣ 📜dataset-tl.zip
 ┃ ┃ ┗ 📜dataset.zip
 ┃ ┣ 📜anomaly_detection-cov_features.ipynb
 ┃ ┣ 📜anomaly_detection-main.ipynb
 ┃ ┣ 📜Project.pdf
 ┃ ┣ 📜Report.pdf
 ┃ ┗ 📜README.md
 ┣ 📜LICENSE
 ┗ 📜README.md
 ```
## **[Project](Project)** 
 The folder contains the files for the project **Anomaly Detection in Optical Transponders** done during the Network Data Analysis part of the course. For the project, we used the following methods and methodologies:

- One-Class SVM
- Isolation Forest
- Principal Component Analysis (PCA)
- Transfer Learning & Domain Adaptation
- Explainable AI (GradCAM XAI)
- 
 ## **[DA-Lab](DA-lab)** 
 The folder contains the main files covered during the Network Data Analysis part of the course. The main topics include

- Traffic prediction for network design and reconfiguration. Traffic pattern identification. 
- Network failure management. Overview of network failure management. Quality of Transmission (QoT) estimation. 
- Failure detection, cause-identification and localization. Applications in optical and microwave networks.

## **[NM-Lab](NM-lab)** 
 The folder contains the main files covered during the Network Measurements part of the course. The main topics include

- Overview of network measurements. Instruments for data collection. Visualization techniques for network measurements.
- Traffic classification and intrusion detection Encrypted traffic classification. Network intrusion and detection systems.
- Wi-Fi sniffing: single-point sniffing (occupancy detection, device classification), multi-point sniffing (localization, user profiling, flow estimation)
- Video streaming analysis: Network operators generally use resource optimization techniques to guarantee streaming requirements efficiently.



