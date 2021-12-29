function __assert_obj_exists -a index
    __assert_fn_argv_count 1 (count $argv) || return
    __object_exists "$index" && return

    echo "Expected object $index to exist." >&2
    status stack-trace | tail -n +2 >&2
    return 125
end
