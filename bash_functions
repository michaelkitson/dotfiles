# -*- mode: sh -*-

# Reload shell config files
reup(){
    if [ -e ~/.profile ]
    then
	. ~/.profile
    else
	. ~/.bashrc
    fi
}

# Fetch current temperature
# Usage: weather [zipcode]
# $ weather 20001
# 39
weather(){
    temp=''
    # This needs a retry because thefuckingweather.com gives me so many 503s
    while true ; do
        if [ -n $1 ] ; then
            temp=`\curl -s "http://www.thefuckingweather.com/?where=$1" | \grep -Eo '<span class="temperature" tempf="[0-9]+">' | \grep -Eo '[0-9]+'`
        else
            temp=`\curl -s "http://www.thefuckingweather.com/" | \grep -Eo '<span class="temperature" tempf="[0-9]+">' | \grep -Eo '[0-9]+'`
        fi
        if [ -n "$temp" ] ; then
            echo "$temp degrees"
            break;
        fi
        sleep 1
    done
}

define(){
    curl -s "www.thefreedictionary.com/$1" | \grep -Eo '<div class="pseg">.*?<hr>' | sed 's/<div class="pseg">//' | sed -E 's/<div class="etyseg">.*//' | sed 's/<script>.*<\/script>//g' | sed -E 's/<div[^>]*>/@/g' | tr '@' '\n' | sed 's/<[^>]*>//g' | sed 's/^[a-z]\.  /    /g'
}

# Wraps around base64 to provide url-safe base64 representations of data
# Usage: same as base64
# 
# 
url64(){
    from='+/'
    to='-_'

    if [ "$1" == "-D" ] ; then
        tr "$to" "$from"  < /dev/stdin | base64 $*
    else
        base64 $* < /dev/stdin | tr "$from" "$to"
    fi
}
