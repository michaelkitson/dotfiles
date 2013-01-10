# fetch stock price and the day's change from google finance
# Sample output:
# $ stock goog
# goog: 691.03 -4.22 (-0.61%)
stock(){
    echo -n "$1: "
    curl -s "http://www.google.com/finance?q=$1" | \grep -Po 'ref_\d+_[lc]p?">([()%+\-\d.]+)' | \grep -Po '\(?[\+\-]?\d+\.\d+%?\)?' | xargs echo -n
    echo ''
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
            temp=`\curl -s "http://www.thefuckingweather.com/?where=$1" | \grep -Po '<span class="temperature" tempf="\d+">' | \grep -Po '\d+'`
        else
            temp=`\curl -s "http://www.thefuckingweather.com/" | \grep -Po '<span class="temperature" tempf="\d+">' | \grep -Po '\d+'`
        fi
        if [ -n "$temp" ] ; then
            echo "$temp degrees"
            break;
        fi
        sleep 1
    done
}

# Encryption and decryption convenience functions to encrypt a given file on the disk
# $ encrypt FILE
#   enter aes-256-cbc encryption password:
#   Verifying - enter aes-256-cbc encryption password:
#
# $ decrypt FILE.enc
#   enter aes-256-cbc decryption password:
encrypt(){
        infile=$1
        outfile="$infile.enc"
        openssl enc -e -in $infile -out $outfile -aes-256-cbc
        if [ -f $outfile ]; then
            rm $infile
        fi
}

decrypt(){
        infile=$1
        outfile=`echo -n $1 | sed 's/.enc$//'`
        openssl enc -d -in $infile -out $outfile -aes-256-cbc
        if [ -f $outfile ]; then
            rm $infile
        fi
}
