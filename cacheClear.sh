#!/bin/bash

set -eu

cacheclear=`sync; echo 1 > /proc/sys/vm/drop_caches`
memfree=`cat /proc/meminfo | grep -i memfree | awk {'print $2'}`

if [ $memfree -lt 2000000 ] ; then
        cacheclear
        if [ $? -ne 0 ]; then
                logger "Cache successfully reset"
        fi #        if [ $? -ne 0 ]; then
elif [ $memfree -gt 2000000 ] ; then
        printf "You have $memfree kb free memory \n"
        logger "Memory is sustainable for now, with over 2gb free."
fi #if [ $memfree -gt 2000000 ] ; then
