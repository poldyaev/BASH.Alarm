#!/bin/bash

###################################################################
# Script Author: Djordje Jocic                                    #
# Script Year: 2018                                               #
# Script License: MIT License (MIT)                               #
# =============================================================== #
# Personal Website: http://www.djordjejocic.com/                  #
# =============================================================== #
# Permission is hereby granted, free of charge, to any person     #
# obtaining a copy of this software and associated documentation  #
# files (the "Software"), to deal in the Software without         #
# restriction, including without limitation the rights to use,    #
# copy, modify, merge, publish, distribute, sublicense, and/or    #
# sell copies of the Software, and to permit persons to whom the  #
# Software is furnished to do so, subject to the following        #
# conditions.                                                     #
# --------------------------------------------------------------- #
# The above copyright notice and this permission notice shall be  #
# included in all copies or substantial portions of the Software. #
# --------------------------------------------------------------- #
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, #
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES #
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND        #
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT     #
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,    #
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, RISING     #
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR   #
# OTHER DEALINGS IN THE SOFTWARE.                                 #
###################################################################

#########
# LOGIC #
#########

if [[ $test_sound == "yes" ]]; then
    
    echo -e "Testing countdown sound..." && aplay $sound_effect > /dev/null 2>&1;
    
else
    
    # Print Notice
    
    if [[ ! -z $alarm_delay ]]; then
        echo "Starting a $alarm_time countdown, after a $alarm_delay second delay...";
    else
        echo -e "Starting a $alarm_time countdown...";
    fi
    
    # Initialize Countdown
    
    if [[ ! -z $alarm_delay ]]; then
        sleep $alarm_delay;
    fi
    
    sleep $alarm_time;
    
    aplay $sound_effect > /dev/null 2>&1 &
    
    if [[ ! -z $alarm_command ]]; then
        bash -c "$alarm_command" &
    fi
    
fi
