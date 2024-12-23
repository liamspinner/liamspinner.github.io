MOV TMOD, #02H      ; Set up timer 0 as 8-bit autoreload interval timer
MOV TH0, #003      ; Put reload value into timer 0 high byte (960 / 256 = 3)
SETB TR0            ; Start timer zero

overflowWait:
    JNB TF0, $      ; Repeat this line while timer 0 overflow flag is not set
    CPL P1.5        ; Complement pin 5 on port 1
                    ; This instruction toggles the specified bit
    CLR TF0         ; Timer 0 overflow flag is set by hardware on transition
                    ; from FFH - the flag must be reset by software
    JMP overflowWait    ; Go back and wait for overflow again
    
    
