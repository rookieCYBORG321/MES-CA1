ORG 0000H

0000  MOV 50H, #4H
0003  MOV 51H, #13H

0006  MOV A, 50H      ; Load value
0008  MOV R0, A       ; Copy to R0

0009  MOV A, 51H      ; Load value
000B  MOV R1, A       ; Copy to R1

000C  CLR A
000D  MOV 52H, A      ; Clear result

COMPARE:
000F  MOV A, R0
0010  JZ A_ZERO       ; If R0 == 0

0012  MOV A, R1
0013  JZ B_ZERO       ; If R1 == 0

0015  DEC R0          ; Decrement both
0016  DEC R1
0017  SJMP COMPARE

A_ZERO:
0019  MOV A, R1
001A  JZ EQUAL        ; Both zero → equal
001C  MOV 52H, #0FFH  ; R0 < R1
001F  SJMP END_PROG

B_ZERO:
0021  MOV 52H, #01H   ; R0 > R1
0024  SJMP END_PROG

EQUAL:
0026  MOV 52H, #00H   ; Equal

END_PROG:
0029  SJMP END_PROG

END
