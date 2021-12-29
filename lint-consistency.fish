set -l failures 0

for filename in functions/*.fish
    set -l decl 'function '(basename $filename .fish)

    switch (head -n 1 $filename)
        case $decl $decl' *'
            # Valid name. Do nothing.

        case 'function *'
            #Invalid name.
            echo "::error file=$filename,line=1,col=10::Function in file '$filename' is not consistent with the file name."
            set failures (math $failures + 1)

        case '*'
            #Invalid file.
            echo "::error file=$filename,line=1,col=10::File '$filename' must have one function declaration, since it is under 'functions' directory."
            set failures (math $failures + 1)
    end
end

echo "There were $failures failures."
test "$failures" -eq 0
