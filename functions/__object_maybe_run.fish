function __object_maybe_run -a index method
    set -l command (__object_get_command $argv) || return 0
    $command "$index" $argv[3..]
end
