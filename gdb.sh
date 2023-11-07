gdb ./bin/llvm/bin/clang \
-ex 'set follow-fork child' \
-ex 'b main' \
-ex 'r --analyze test.c' \
-ex 'layout src' 