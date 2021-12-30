function __object_sort -a index
    __fdt_assert_fn_argv_count 1 (count $argv) || return
    __fdt_assert_obj_exists "$index" || return
    set -l ref (__object_var "$index") || return

    set -g ref (string join \n -- $$ref | sort -u)
end
