function object_free -d 'Deallocates an object' -a index
    __assert_fn_argv_count 1 (count $argv) || return
    __assert_obj_exists "$index" || return
    __object_maybe_run "$index" free || return

    set -l ref (__object_var "$index") || return

    for key in $$ref
        set -ge (__object_var "$index" "$key")
    end

    set -ge $ref
end
