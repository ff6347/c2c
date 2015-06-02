#!/usr/bin/env python
"""
control an arduino from your raspberry pi over serial
"""

import sys # we need this to exit if the GPIO lib is not present
import time # for timing
try:
    import serial
    print "pySerial is present. Moving on"
except ImportError:
    print "pySerial lib is not installed. Stopping program"
    print "Please install it with the commands:"
    print "$ sudo apt-get update && sudo apt-get upgrade"
    print "$ sudo apt-get install python3-pip python-pip"
    print "$ sudo pip install pyserial"
    sys.exit()
try:
    import RPi.GPIO as GPIO
    print "GPIO Lib is present. Moving on"
except ImportError:
    print "GPIO Lib is not installed. Stopping program"
    print "Please install it with the commands:"
    print "$ sudo apt-get update && sudo apt-get upgrade"
    print "$ sudo apt-get install rpi.gpio"
    sys.exit()
  # end program if lib not there


# # now run all of that
if __name__ == '__main__':
    try:
        GPIO.setmode(GPIO.BOARD)
        GPIO.setup(12, GPIO.OUT)

        ser = serial.Serial("/dev/ttyACM0", 9600)
        while True:
            raw = ser.readline()
            msg = raw.rsplit()
            if msg[0] == "1":
                print msg[0]
                print "we are on"
                GPIO.output(12, GPIO.HIGH)
            else:
                print msg[0]
                print "we are off"
                GPIO.output(12, GPIO.LOW)
            time.sleep(0.5)

    except KeyboardInterrupt:
        print "\nbye bye"
        GPIO.cleanup()
    finally:
        print "\nbye bye"
