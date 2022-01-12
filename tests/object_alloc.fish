@echo (status basename)

if not source (status dirname)/__utils.fish
    @test 'load utilities' -n ''
    exit 1
end

#
# ─── UNNAMED OBJECTS ──────────────────────────────────────────────────────────
#

begin
    set -l index (object_alloc)

    @test 'should succeed allocating an unnamed object' $status -eq 0
    @test 'should return the current index' "$index" -eq 0
    @test 'should increment index' "$__obj_index" -eq 1

    set -l ref (__object_var "$index")

    @test 'should setup a key list' (set -q $ref) $status -eq 0
    @test 'the key list must be empty' "$$ref" = ""
end

#
# ─── NAMED OBJECTS ────────────────────────────────────────────────────────────
#

begin
    set -l output (object_alloc test)

    @test 'should succeed allocating a named object' $status -eq 0
    @test 'should not output if given a name' "$output" = ""

    set -l ref (__object_var test)

    @test 'should setup a named key list' (set -q $ref) $status -eq 0
    @test 'the named key list must be empty' "$$ref" = ""
end

#
# ─── SPECIAL CASES ────────────────────────────────────────────────────────────
#

@test 'should err if given incorrect number of arguments' \
    (@silent object_alloc a b) $status -ne 0

@test 'should not allocate an object if given incorrect number of arguments' \
    (set -q (__object_var a)) $status -ne 0

@test 'should err if given a name which already exists' \
    (@silent object_alloc test) $status -ne 0

# ──────────────────────────────────────────────────────────────────────────────
