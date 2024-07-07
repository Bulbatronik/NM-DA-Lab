import pyshark
import webbrowser
import time
import os

def main():

    # Select URL
    urls = {0: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'}

    # Specify path of Browsing App: working for iOS. Change it according to your OS.
    chrome_path = 'open -a /Applications/Google\ Chrome.app %s'

    # Specify capture file destination path
    dest_path = '__ your destination path __'
    for index,url in enumerate(urls):
        url =urls[index]#
        print(url)
        f_in = 'Live_Capture_NetLabMeas'

        # Wake capture inteface up
        capture = pyshark.LiveCapture(interface='en0', output_file=dest_path+f_in+'.pcap')
        i = 0
        t0 = time.time()
        print('Start for loop at time: ', t0)

        # Start the capture
        for _ in capture.sniff_continuously():
            if i == 8:

                # Start browsing
                print('Start browsing after: ', time.time()-t0)
                webbrowser.get(chrome_path).open(url, new=2)

            if time.time()-t0 > 190:

                # Stop capturing
                print('Stop Capture after: ', time.time()-t0)
                break
            i+=1

    # Kill browsing app instance
    os.system("kill $(pgrep Chrome)")

if __name__ == '__main__':
    main()
