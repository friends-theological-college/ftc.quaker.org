#!/bin/bash
# Requires ruby gem wayback_machine_downloader to be in the PATH
# Run from the root of the ftc.quaker.org git repository
# Inputs are hardcoded here at the top

times=("20061014083059"
       "20061026060237"
       "20061111044526"
       "20061128105857"
       "20061206101242"
       "20070608173330"
       "20071214010922"
       "20080509135206"
       "20081022173217"
       "20090210200253"
       "20101020112515"
       "20110112055655"
       "20110816202728"
       "20111006060916"
       "20121010210628"
       "20130908085239"
       "20140702020941"
       "20150706054225"
       "20160311232644"
       "20161206115529")

dates=("Oct 14, 2006"
       "Oct 26, 2006"
       "Nov 11, 2006"
       "Nov 28, 2006"
       "Dec 6, 2006"
       "Jun 8, 2007"
       "Dec 14, 2007"
       "May 9, 2008"
       "Oct 22, 2008"
       "Feb 10, 2009"
       "Oct 10, 2010"
       "Jan 12, 2011"
       "Aug 16, 2011"
       "Oct 6, 2011"
       "Oct 10, 2012"
       "Sep 8, 2013"
       "Jun 2, 2014"
       "Jun 6, 2015"
       "Mar 11, 2016"
       "Dec 6, 2016")

mkdir -p www

for i in ${!times[*]}
do
    t=${times[$i]}
    d=${dates[$i]}
    wayback_machine_downloader --to $t ftc.quaker.org
    cp -r websites/ftc.quaker.org/* www/.
    rm -r websites
    git add .
    git commit -m "Backup from $d" -m "Downloaded with \`wayback_machine_downloader --to $t
ftc.quaker.org\`, using
\`https://github.com/hartator/wayback-machine-downloader\`." -m "http://web.archive.org/web/$t/http://ftc.quaker.org/"
done
