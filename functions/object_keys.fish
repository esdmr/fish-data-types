function object_keys -d 'List the properties of an object' -a index
    __fdt_assert_fn_argv_count 1 (count $argv) || return
    __fdt_assert_obj_exists "$index" || return

    set -l ref (__object_var "$index") || return
    string join \n -- $$ref
    return 0
end
