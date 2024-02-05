; ModuleID = 'myhello'

@.str = private unnamed_addr constant [13 x i8] c"Hello World!\0A"

declare i32 @printf(i8*, ...)

define i32 @main(){
entry:
    %strPtr = getelementptr [13 x i8], [13 x i8]* @.str, i32 0, i32 0
    call i32 (i8*, ...) @printf(i8* %strPtr)
    ret i32 0
}