# fetch stock price and the day's change from google finance
# Sample output:
# $ stock goog
# goog: 691.03 -4.22 (-0.61%)
stock(){
         echo -n "$1: "
         curl -s "http://www.google.com/finance?q=$1" | \grep -Po 'ref_\d+_[lc]p?">([()%+\-\d.]+)' | \grep -Po '\(?[\+\-]?\d+\.\d+%?\)?' | xargs echo -n
         echo ''
}

# Encrypt and decrypt functions to encrypt a given file on the disk
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
