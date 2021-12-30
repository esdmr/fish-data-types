function __object_exists -a index
    __fdt_assert_fn_argv_count 1 (count $argv) || return
    set -l var (__object_var "$index") || return
    set -q $var
end
