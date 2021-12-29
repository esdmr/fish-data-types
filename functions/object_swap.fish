function object_swap -a a b
    __assert_fn_argv_count 2 (count $argv) || return
    __assert_obj_exists "$a" || return
    __assert_obj_exists "$b" || return
    __assert_obj_free swaptemp || return

    object_move swaptemp $a || return
    object_move $a $b || return
    object_move $b swaptemp
end
