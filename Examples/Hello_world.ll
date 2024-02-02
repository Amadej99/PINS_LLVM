; ModuleID = 'hello'

@.str = private unnamed_addr constant [14 x i8] c"Hello, World!\0"

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  ; Get the pointer to the string
  %strPtr = getelementptr [14 x i8], [14 x i8]* @.str, i32 0, i32 0

  ; Call printf to print the string
  call i32 (i8*, ...) @printf(i8* %strPtr)

  ; Return 0 to indicate successful execution
  ret i32 0
}
