function object_has -d 'Checks if an object has a property' -a index property
    __assert_fn_argv_count 2 (count $argv) || return
    __assert_obj_exists "$index" || return

    set -l ref (__object_var "$index") || return
    contains -- "$property" $$ref
end
