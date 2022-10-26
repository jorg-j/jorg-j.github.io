---
nav_exclude: true
---
## Case and IF statements

### Case

    foo="beans"

    case ${foo} in
        beans)
            echo "beans"
            ;;
        eggs)
            echo "eggs"
            ;;
        \?)
            echo "Not Found"
            ;;
    esac

### IF

    foo=1

    if [ $foo == 1 ] then
        echo "1111"
    else
        echo "nononono"
    fi

