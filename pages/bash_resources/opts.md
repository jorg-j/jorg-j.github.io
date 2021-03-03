## Get Options


    while getopts ":udg" opt; do
    case ${opt} in
        u ) # process option u
        echo "u foo"
        ;;
        d ) # process option d
        
        ;;
        g ) # process option g

        
        ;;
        \? ) echo "Usage: cmd [-u] [-d] up down [-g] getter"
        ;;
    esac
    done