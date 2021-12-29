function __object_get_command -a index method
    __assert_fn_argv_count_min 2 (count $argv) || return

    object_has "$index" "$method" || return 124
    object_get "$index" "$method" || return 123
end
