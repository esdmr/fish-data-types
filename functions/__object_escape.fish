function __object_escape
    __assert_fn_argv_count_min 1 (count $argv) || return

    string escape --style var -- $argv
    return 0
end
