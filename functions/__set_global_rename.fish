function __set_global_rename -a to from
    set -g $to $$from
    set -ge $from
end
