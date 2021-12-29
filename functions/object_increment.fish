function object_increment -d 'Increment a property' -a index property
    __assert_fn_argv_count 2 (count $argv) || return

    set -l value (object_get "$index" "$property") || return
    set value (math "$value" + 1) || return

    object_set "$index" "$property" "$value"
end
