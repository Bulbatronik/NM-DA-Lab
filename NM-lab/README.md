# Network Measurements Lab
This subdirectory contains the materials developed during the class with the small assignments. The files are separated by topics:
 - [Active Measurements](1-Active-measurements)
- [Passive Measurements](2-Passive-measurements)
- [Traffic Classification](3-Traffic-classification)
- [WiFi Sniffing](4-WiFi-sniffing)
- [Video Streaming Monitoring ](5-Video-streaming-monitoring)
- [Assignments](Assignments)


## 1) Active Measurements
The folder provides a set on notebooks the examples of several active measurements tools commonly used, some of which are implemented from scratch. The reason behind calling these methods *active* is because additional data is injected in the traffic and are primarily used for testing the correct behavior of a network. We provide the following tools:

- `Packet INternet Groper (ping)`: Based on the Internet *Control Message Protocol (ICMP)*, measures the round-trip time (RTT) between the source and a given destination.
- `traceroute`: used to analyse a route from a source to a given destination. By sending an ICMP Echo request/UDP packet to the destination with TTL = 1. The first router will decrement the TTL and reply to the source with an ICMP TTL exceeded message. Now we now the address of the first router on the route. Send another ICMP Echo request with TTL = 2. Now we now the address of second router. Repeat the procedure up to a pre-defined TTL (max number of hops).
- `Iperf`: another widely used tool for active network performance measurement. Follows Client/Server paradigm (must be active on both ends) and measures UDP/TCP/SCTP/ bandwidth, jitter, packet loss.
- `Simple Network Monitoring Protocol (SNMP)`: a protocol to get information from network devices. A manager retrieves data from agents running on the network devices. Data is described in a Management Information Bases (MIB) through OID (Object Identifiers). All messages are transported using UDP (port 161 for GET/SET and RESPONSE, 162 for TRAP and INFORM messages)

## 2) Passive Measurements
In contrast to injecting data into traffic, as it is done for active measurements, the measurements of existing traffic carried out by observing network packets. Most techniques capture and analyze only packet headers (due to privacy laws).


One of the main challenges is that now we have to deal with massive amount of data! Common tools include *libpcap*, *tcpdump*, *Wireshark*, (*tshark*).

First notebook, `tcpdump-example.ipynb`, provides an example of usage of *tcpdump* to get a `.pcap` capture. Using `pyshark` we further inspect the capture to analyze the sockets of the source and destination.

Second notebook, `data-visualization.ipynb` how to make a simple explanatory data analysis (EDA) over a network data, using scatter plot, box plot, CDF, Sankey diagram and etc. In particular, we analyze the evolution of RTT of the request in the case of VPN and no VPN, as well as some cellular network usage signatures of uplink and downlink.


## 3) Traffic Classification

Traffic classification aims at categorising network traffic into a number of traffic classes, for instance, based on application. It is commonly used for the problems of *network analysis* and *Network Operation and Optimization*.
One way is to classify traffic flows, defined as sequence of packets sharing the 5-tuple: *source/destination IP, protocol number (ICMP/TCP/UDP), source/destination port*. 


There are three main approaches for performing traffic classification:
- Port-based
- Payload-based
- Flow feature-based

However, many applications do not have ports registered with IANA! Moreover, most of the new applications are carried over HTTPS, which encrypts the application level payload. A solution could be to exploit statistical properties of the characteristics of each flow to infer the protocol/application type. Such methods are also known as statistical approaches or machine learning approaches.

Popular features:
- Flow duration in seconds (only if the full flow is captured)
- Data volume per flow
- Number of packets per flow
- TCP Port
- Packet inter-arrival time (mean, variance, …)
- Payload size (mean, variance)

Based on these features, we show how a simple `KNeighborsClassifier` and  `RandomForestClassifier` manage to achieve a reasonable performance on an encrypted traffic.


## 4) WiFi Sniffing
Sniffing or eavesdropping is the process of secretly listening to the communication of others. For wireless networks, sniffing can be performed just by tuning a receiver on the correct transmission frequency and by knowing what communication protocol is used.Clearly, most of the time the original communication is encrypted. In the IEEE 802.11 (Wi-Fi) protocol however, some messages are sent in-the-clear:
- Beacons: sent from access points, they carry information on the network (SSID, supported rates, etc…)
- Probe requests: sent from terminals (PCs, laptops, smartphones) for active scanning available networks

Both messages can be *sniffed* very easily and reveal interesting information on the transmitter.

Probe requests are used for performing active scanning. They are transmitted even if the device is not connected to the network. To avoid user tracking, modern WiFi devices do not transmit probe request with the *real* MAC address. A locally administered, fake, randomized MAC address is generally used in probe requests. 

Software assigned MAC addresses can be recognized by looking at the second least significant bit of the first octet in the MAC address
- 1 -> locally administered (fake/randomized)
- 0 -> universally administered (real)

In the notebook `probe_analysis1.ipynb` and `probe_analysis2.ipynb` we provide an example how can the universal MAC addresses be extracted and how you can infer some device info from a simple capture.

Notebook `wifi_localization.ipynb` privides and example of RSS-based fingerprinting approach for device localization. We construct a radio map (fingerprint database) of the environment, saving for each position (x,y) the RSS from all visible monitoring points. When the target needs to be localized, transmit the RSS from monitoring points to the database and get the position (x,y) with the most similar fingerprint. With this approach not only are we able to track the position of a target device, but also identify the other devices present in the environment.

## 5) Video Streaming Monitoring

Video Streaming services generate the largest portion of Internet traffic (>50% of global IP traffic). Regardless of the application, video streaming services come with tight Quality of Experience (QoE) requirements, which if not met can increase users’ dissatisfaction. Generally, after a video client initiates the streaming session, video server stores video contents and delivers them to clients. The media content encoded in different representations, each one characterised by its video bit rate (directly related to video resolution). Video/audio data is transmitted in chunks of short duration (from 1s to 15s) of a fixed represesentation. A single segment composes of different frames (i.e., the sequence of images forming the video)

A client willing to stream a video issues HTTP requests to the server, selecting which segment to retrieve and at which bit-rate
- After a sufficient amount of data has been downloaded the client can start to play out the video from the buffer
- Generally, the client requests the maximum bit-rate that can be downloaded in time without causing stalls or re-buffering
events

In this section we, first, capture Youtube session’s traffic using `LiveCaptureTool.py`. We then detect video server(s) IP address by parsing DNS and retrieving IPs associated to *googlevideo* domain name, after which we then identify the dominant video traffic flow.

We repeat a similar procedure for another capture to later classify the last observed HTTP Requests. For that we create a dataset to perform classification by labeling HTTP Requests according to the type of content requested by the client (Audio/Video). We extract some features related to time of arrival, packet size and etc., which are fed into ML classifiers.

## 6) Assignments
The folder contains three assignments given during the course.
### 6.1) RTT Estimation in Network Communication. 

The main objective is to evaluate the relationship between the (average) Round Trip Time (RTT) and physical distance of two endpoints For that, using `BeautifulSoup` a CSV file was created containing the addresses of the servers from [www.debian.org]('https://www.debian.org/mirror/list.en.html'), where the first entry is the mechine (either local or Colab).

In order to extract the coordinates, HTTP GET requests to the [ipapi.co](https://ipapi.co/) website API. This information makes it possible to calculate the geographical distances between the source and each destination.

Next we send several `ICMP` packets to a given address to calculate the average time required to reach a specific distance. Given that the corresponding port might be unavailable, we attempt to reach the same address using `TCP` before skipping the server. All of the messages are sent using `Scapy` library.

After getting the statistic, we tried to fit the polinomial of order 1, as the RTT can be approximated as `RTT=2d/v`. We also acquired similar results using Least Squared approach and provided visualization of the results. Based on our results, we can conclude that, on average, a packet has to travel the distance 3 times larger than the direct one, given that the speed is equal to the speed of light. 

### 6.2) Website Fingerprinting 
This project focuses on network traffic classification using K-nearest neighbors (KNN) and cumulative traces. We acquired the data by running `bash get_data.sh`, which sends 10 consecutive requests to 10 news websites and saves every request into a `.pcap` file. In the script we apply proper filtering to capture only the HTTPS exchange.

For each capture we extracted statistical features for uplink and downlink. The features include the number of packets, total bytes, minimum/maximum/mean packet size, and minimum/maximum/mean inter-arrival time (IAT). After that we use `KNeighborsClassifier` with evaluation if the performance for various values of *K* on the test data.

The following day we ran the bash script again to get the new test data and evaluated the performance of the previuosly trained classifier, which decreased significantly. 

As an alternative, we applied *cumulative traces*: A cumulative function of data packets in a network flow is computed based on the direction of the flow (uplink or downlink). The performance of the cumulative traces approach is more robust to the dynamic of the data, achieving better performance the following day.

### 6.3) HTTP Request Arrival Estimation

The goal of this assignment is to predict the arrival time of the next uplink request sent by a video client and the size of the response from the video server. To solve the problem, we, first, filter the dataset to identify the IP addresses of the video servers and selecting video traffic and, for simplicity, we only keep the dominant flows. The following step was to extract features, such as client request size, inter request-response time, download time, download volume, number of packets and playback time. We complete dataset with the groundtruth which includes the time for the next uplink request request and the size of the response from the server to that request.

We apply two `RandomForestRegressor` models to predict the time and the volume and compute the performance via *RMSE*, which is close to the one provided in the reference.
