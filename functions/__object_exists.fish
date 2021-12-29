function __object_exists -a index
    __assert_fn_argv_count 1 (count $argv) || return
    set -l var (__object_var "$index") || return
    set -q $var
end
