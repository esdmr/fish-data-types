function object_set -d 'Sets a value to a property' -a index property
    __assert_fn_argv_count_min 2 (count $argv) || return
    __assert_obj_exists "$index" || return

    set -l ref (__object_var "$index") || return

    object_has "$index" "$property"
    or set -ga $ref "$property"

    set -g (__object_var "$index" "$property") $argv[3..]
end
