function object_run -a index method
    set -l command (__object_get_command $argv) || return
    $command "$index" $argv[3..]
end
