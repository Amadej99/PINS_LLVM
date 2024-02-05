; ModuleID = 'my_power'

@.str = private unnamed_addr constant [3 x i8] c"%d\0A"

declare i32 @printf(i8* noundef,...)

define i32 @my_power(i32 noundef %a, i32 noundef %b){
    %is0 = icmp eq i32 %b, 0
    br i1 %is0, label %return1, label %initForLoop

    return1:
        ret i32 1

    initForLoop:
        ; Declare and initialize the result
        %c = alloca i32, align 4
        store i32 %a, i32* %c, align 4
        ; Declare and initialize the counter
        %i = alloca i32, align 4
        store i32 0, i32* %i, align 4
        ; Declare and initialize the condition
        %b1 = alloca i32, align 4
        %1 = sub nsw i32 %b, 1 
        store i32 %1, i32* %b1, align 4
        br label %checkCondition

    checkCondition:
        ; Load the values of the counter and the high
        %tempI = load i32, i32* %i, align 4
        %tempB = load i32, i32* %b1, align 4
        ; If counter is lower than high, multiply again, else return
        %executeBody = icmp slt i32 %tempI, %tempB
        br i1 %executeBody, label %multiply, label %returnResult


    multiply:
        ; Load the value of C and multiply it with a then store it
        %tempC = load i32, i32* %c, align 4
        %2 = mul i32 %tempC, %a
        store i32 %2, i32* %c, align 4
        br label %incrementCounter
    
    incrementCounter:
        ; Load the counter, increment it and store it
        %tempI2 = load i32, i32* %i, align 4
        %3 = add i32 %tempI2, 1
        store i32 %3, i32* %i, align 4
        br label %checkCondition

    returnResult:
        ; Load c and return it as the result
        %result = load i32, i32* %c, align 4
        ret i32 %result
}

define i32 @main(){
    %result = call i32 @my_power(i32 5, i32 5)
    %formatStr = getelementptr [3 x i8], [3 x i8]* @.str, i32 0, i32 0
    call i32 (i8*, ...) @printf(i8* %formatStr, i32 %result)
    ret i32 0
}