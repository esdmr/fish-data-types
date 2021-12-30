function object_get -d 'Get the value of a property' -a index property
    __fdt_assert_fn_argv_count 2 (count $argv) || return
    __fdt_assert_obj_exists "$index" || return

    set -l ref (__object_var "$index" "$property") || return
    string join \n -- $$ref
    return 0
end
