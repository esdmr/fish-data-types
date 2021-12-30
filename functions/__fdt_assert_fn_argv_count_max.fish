function __fdt_assert_fn_argv_count_max -a maximum given
    test "$maximum" -ge "$given" && return

    echo "Incorrect number of arguments given. Expected a maximum of $maximum, Got $given." >&2
    status stack-trace | tail -n +2 >&2
    return 128
end
