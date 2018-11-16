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

##################
# CORE VARIABLES #
##################

source_dir="$(cd "$( dirname "${BASH_SOURCE[0]}")" && pwd)"
version="1.0.0";

###################
# REGEX VARIABLES #
###################

time_regex="^([0-9]+)(s|m|h|d)$";
number_regex="^([0-9]+)$";

#########
# LOGIC #
#########

source "$source_dir/includes/check-dependencies.sh";
source "$source_dir/includes/process-parameters.sh";

if [[ $display_help == "yes" ]]; then
    
    source "$source_dir/includes/show-help.sh";
    
elif [[ $display_version == "yes" ]]; then
    
    source "$source_dir/includes/show-version.sh";
    
else
    
    #############################
    # STEP 1 - CHECK PARAMETERS #
    #############################
    
    # Check Alarm Time
    
    if [[ ! $alarm_time =~ $time_regex ]]; then
        echo -e "Error: Invalid time provided, please use an integer with the correct suffix." && exit;
    fi
    
    # Check Alarm Delay
    
    if [[ ( ! -z $alarm_delay ) && ( ! $alarm_delay =~ $number_regex ) ]]; then
        echo -e "Error: Invalid alarm delay provided, please use an integer." && exit;
    fi
    
    # Check Type
    
    if [[ -z $type ]]; then
        echo -e "Error: You haven't selected a type." && exit;
    fi
    
    ############################
    # STEP 2 - PROCESS REQUEST #
    ############################
    
    if [[ $type == "alarm" ]]; then
        source "$source_dir/includes/create-alarm.sh";
    elif [[ $type == "countdown" ]]; then
        source "$source_dir/includes/create-countdown.sh";
    elif [[ $type == "interval" ]]; then
        source "$source_dir/includes/create-interval.sh";
    else
        echo -e "Invalid type selected.";
    fi
    
    exit;
    
fi
