function object_alloc -d 'Allocates a new object and returns a reference to it'
    __assert_fn_argv_count_max 1 (count $argv) || return

    set -l index

    if set -q argv[1]
        set index $argv[1]
    else
        set index "$__obj_index"
        set -g __obj_index (math $index + 1) || return
    end

    __assert_obj_free $index || return
    set -g (__object_var "$index") || return

    set -q argv[1] || echo $index
end
