function object_merge -a to from
    __assert_fn_argv_count 2 (count $argv) || return
    __assert_obj_exists "$from" || return
    __assert_obj_exists "$to" || return

    __object_maybe_run "$from" premove "$to" merge || return

    set -l ref_from (__object_var "$from") || return
    set -l ref_to (__object_var "$to") || return

    for key in $$ref_from
        set -l key_from (__object_var "$from" "$key") || continue
        set -l key_to (__object_var "$to" "$key") || continue
        __set_global_rename $key_to $key_from
    end

    set -ga $ref_to $$ref_from
    set -ge $ref_from
    __object_sort "$from"

    __object_maybe_run "$to" postmove "$from" merge || return
end
