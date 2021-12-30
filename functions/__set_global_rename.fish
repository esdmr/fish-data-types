function __set_global_rename -a to from
    __assert_fn_argv_count 2 (count $argv) || return
    set -g $to $$from
    set -ge $from
end
