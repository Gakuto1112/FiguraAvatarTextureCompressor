BEGINFILE {
    array = "["
}

{
    array = array "\"" $0 "\","
}

ENDFILE {
    if(length(array) > 1) array = substr(array, 0, length(array) - 1)
    array = array "]"
    print array
}
