; ModuleID = 'test.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @function(i32 %b) #0 {
entry:
  %b.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32* %b.addr, align 4
  switch i32 %0, label %sw.epilog [
    i32 1, label %sw.bb
    i32 4, label %sw.bb1
  ]

sw.bb:                                            ; preds = %entry
  %1 = load i32* %b.addr, align 4
  %div = sdiv i32 %1, 1
  store i32 %div, i32* %a, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %2 = load i32* %b.addr, align 4
  %sub = sub nsw i32 %2, 4
  store i32 %sub, i32* %c, align 4
  %3 = load i32* %b.addr, align 4
  %4 = load i32* %c, align 4
  %div2 = sdiv i32 %3, %4
  store i32 %div2, i32* %a, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %sw.bb1, %sw.bb
  %5 = load i32* %a, align 4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %call = call i32 @function(i32 4)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.6.0 "}
