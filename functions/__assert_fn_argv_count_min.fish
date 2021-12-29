function __assert_fn_argv_count_min -a minimum given
    test "$minimum" -le "$given" && return

    echo "Incorrect number of arguments given. Expected a minimum of $minimum, Got $given." >&2
    status stack-trace | tail -n +2 >&2
    return 128
end
