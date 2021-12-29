set -l failed_files (fish_indent -c **.fish 2>&1)
set -l fish_indent_status $status
set -l failures (count $failed_files)

for filename in $failed_files
    echo "::error file=$filename,line=1,col=1::fish_indent failed in $filename"
end

echo "There were $failures failures"
exit $fish_indent_status
