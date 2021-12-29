function object_copy -a to from
    __assert_fn_argv_count 2 (count $argv) || return
    __assert_obj_exists "$from" || return
    __assert_obj_free "$to" || return

    __object_maybe_run "$from" precopy "$to" copy || return

    set -l ref_from (__object_var "$from") || return
    set -l ref_to (__object_var "$to") || return

    for key in $$ref_from
        set -l key_from (__object_var "$from" "$key") || continue
        set -l key_to (__object_var "$to" "$key") || continue
        set -g $key_to $$key_from
    end

    set -g $ref_to $ref_from

    __object_maybe_run "$to" postcopy "$from" copy || return
end
