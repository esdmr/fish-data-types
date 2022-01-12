function @silent
    $argv >/dev/null 2>/dev/null
end

function @exit
    set -l exit_status $argv $status

    @test 'abrupt exit' "$exit_status[1]" -eq 0
    exit "$exit_status[1]"
end
