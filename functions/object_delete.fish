function object_delete -d 'Deletes a property' -a index property
    __assert_fn_argv_count 2 (count $argv) || return
    __assert_obj_exists "$index" || return

    set -l ref (__object_var "$index") || return
    set -ge (__object_var "$index" "$property") || return
    set -l new_key_list

    for key in $$ref
        test "$key" != "$property"
        and set -a new_key_list "$key"
    end

    set -g $ref $new_key_list
end
