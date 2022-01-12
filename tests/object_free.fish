@echo (status basename)

if not source (status dirname)/__utils.fish
    @test 'load utilities' -n ''
    exit 1
end

#
# ─── EMPTY OBJECT ─────────────────────────────────────────────────────────────
#

begin
    object_alloc test || @exit
    set -l output (object_free test)
    set -l ref (__object_var test)

    @test 'should succeed freeing an empty object' $status -eq 0
    @test 'should not output anything' "$output" = ""
    @test 'should free the empty object' (set -q $ref) $status -ne 0
end

#
# ─── NONEMPTY OBJECT ──────────────────────────────────────────────────────────
#

begin
    object_alloc test || @exit
    set -l ref (__object_var test)
    set -l method test_func 'some arguments' here

    function test_func -a this
        @test 'should enter the method with a zero status' $status -eq 0
        @test 'should pass the correct arguments' (string join \n -- $argv | string collect) = 'some arguments
here
test'
        @test 'the object should still exist' (set -q $ref) $status -eq 0
        @test 'the properties should still exist' (@silent object_has test free) $status -eq 0

        set -g test_called
    end

    object_set test free $method
    object_free test

    @test 'should succeed freeing a nonempty object' $status -eq 0
    @test 'should have called the free method' (set -q test_called) $status -eq 0
    @test 'should free the nonempty object' (set -q $ref) $status -ne 0

    set -e test_called
    functions -e test_func
end

#
# ─── SPECIAL CASES ────────────────────────────────────────────────────────────
#

object_alloc a

@test 'should err if given too many arguments' \
    (@silent object_free a b) $status -ne 0

@test 'should not free object if given too many arguments' \
    (set -q (__object_var a)) $status -eq 0

@test 'should err if given too few arguments' \
    (@silent object_free) $status -ne 0

@test 'should err if given a name which does not exist' \
    (@silent object_free b) $status -ne 0

function test_func
    return 1
end

object_set a free test_func

@test 'should err if the free method fails' \
    (@silent object_free a) $status -ne 0

@test 'should not free object if the free method fails' \
    (set -q (__object_var a)) $status -eq 0

# ──────────────────────────────────────────────────────────────────────────────
