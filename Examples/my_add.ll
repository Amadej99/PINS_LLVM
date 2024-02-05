; ModuleID = 'myhello'

declare i32 @printf(i8*, ...)

@.str = private unnamed_addr constant [3 x i8] c"%d\0A", align 1

define i32 @add(i32 noundef %a, i32 noundef %b){
    %result = add nsw i32 %a, %b
    ret i32 %result
}

define i32 @main(){
    %result = call i32 (i32, i32) @add(i32 5, i32 2)
    %str = getelementptr [3 x i8], [3 x i8]* @.str, i32 0, i32 0
    call i32 (i8*,...) @printf(i8* %str, i32 %result)

    ret i32 %result
}