function __object_var
    set -l escaped (__object_escape $argv) || return
    echo __obj_(string join _ -- $escaped)
    return 0
end
