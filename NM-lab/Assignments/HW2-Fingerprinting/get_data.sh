#!/usr/bin/bash

FILE_NAME="data_hw2.zip"

# list of websites to visit
websites=(
    "https://www.indiatimes.com" "https://www.washingtonpost.com" "https://www.ndtv.com" "https://www.cnbc.com" "https://www.timesofindia.com" "https://www.express.co.uk" "https://www.rt.com" "https://www.news18.com" "https://www.nypost.com" "https://www.abc.net.au"
)

# remove https:// from the names
for (( i=0; i<${
    websites[$i]=${websites[$i]
done
# echo "${websites[@]}"

# loop over each website
for website in "${websites[@]}"
do
    # create a directory for the website
    #mkdir -p data/"$website"
    
    # A WEEK LATER!!!
    mkdir -p "$website"

    # loop over each capture attempt
    for i in {1..10}
    do
        # capture traffic using tcpdump
        tcpdump -i eth0 -w "$website/$i.pcap" "host $website and port 443" &
        tcpdump_pid=$!
        
        # wait for 5 seconds before visiting the website
        sleep 5
        
        # visit the website using curl
        curl "https://$website" -s -o /dev/null
        
        # wait for 5 seconds before stopping tcpdump
        sleep 5
        
        # stop tcpdump
        kill $tcpdump_pid
    done
done

# zip the data
zip -r "$FILE_NAME" "${websites[@]}"