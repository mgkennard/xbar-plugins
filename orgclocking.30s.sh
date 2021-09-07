#!/usr/bin/env zsh

# <xbar.title>Show current Org mode clocked-in entry</xbar.title>
# <xbar.version>v1.0</xbar.version>
# <xbar.author>Matthew Kennard</xbar.author>
# <xbar.author.github>appsonthemove</xbar.author.github>
# <xbar.desc>If you use Org mode clocking to track time against tasks then this plugin will show you the current clocked in task and the elapsed time</xbar.desc>

function client {
    /usr/local/bin/emacsclient --eval "$1"
}

if [[ `client "(org-clock-is-active)"` == "nil" ]] ; then
    echo "No Task"
else
    echo -n '⏱'
    client "(org-clock-get-clock-string)" | head -n 1 | cut -d'"' -f2
    echo '---'
    echo 'Clock out | shell=/usr/local/bin/emacsclient | param1=--eval | param2="(org-clock-out)" | refresh=true'
fi
