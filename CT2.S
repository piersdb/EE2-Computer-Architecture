rsb r2,r0,#11 ; r2 = 11 - r0

sub r1,r0,r1 ; r1 = r0-r1
sub r0,r0,r1 ; r0 = r0-r1 = r0 - (ri0-ri1)

; r1 = r0-r1 => r1=4r0-4r1
add r1,r1,r1
add r1,r1,r1 ; r1 = 4r0-4r1

