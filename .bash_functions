# fetch stock price and the day's change from google finance
# Sample output:
# $ stock goog
# goog: 691.03 -4.22 (-0.61%)
stock(){
         echo -n "$1: "
         curl -s "http://www.google.com/finance?q=$1" | \grep -Po 'ref_\d+_[lc]p?">([()%+\-\d.]+)' | \grep -Po '\(?[\+\-]?\d+\.\d+%?\)?' | xargs echo -n
         echo ''
}
