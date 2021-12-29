set -l index (object_alloc)
set -l ref (__object_var "$index")

@test 'should return the current index' "$index" = 0
@test 'should increment index' "$__obj_index" = 1
@test 'should setup a key list' (set -q $ref) $status = 0
@test 'the key list must be empty' "$$ref" = ""

set -l output (object_alloc test)
set -l ref2 (__object_var test)

@test 'should not output if given a name' "$output" = ""
@test 'should setup a named key list' (set -q $ref2) $status = 0
@test 'the named key list must be empty' "$$ref2" = ""

set -l ref3 (__object_var a)

@test 'should error if given an incorrect number of arguments' (object_alloc a b 2>/dev/null) $status != 0
@test 'should not setup a key list' (set -q $ref3) $status != 0

@test 'should error if given a name which already exists' (object_alloc test 2>/dev/null) $status != 0
