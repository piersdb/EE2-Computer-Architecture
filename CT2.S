mov r2,r0
mov r0,r1

; r1 = r0-r1
sub r1,r0,r1
add r1,r1,r1
add r1,r1,r1 ; r1 = 4r0-4r1
sub r1,r1,r2 ;r1 = 3r0 - 4r1

rsb r2,r2,#11
