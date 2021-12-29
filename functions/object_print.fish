function object_print -d 'Debug prints an object' -a index
    __assert_fn_argv_count 1 (count $argv) || return
    __assert_obj_exists "$index" || return

    set -l ref (__object_var "$index") || return
    set -l escaped (string escape --style regex -- $ref)
    set | grep -e "^$escaped"
end
