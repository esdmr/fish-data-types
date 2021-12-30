function __fdt_assert_fn_argv_count -a expected given
    test "$expected" -eq "$given" && return

    echo "Incorrect number of arguments given. Expected $expected, Got $given." >&2
    status stack-trace | tail -n +2 >&2
    return 128
end
