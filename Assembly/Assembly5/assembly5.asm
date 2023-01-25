.include "/sdcard/fwc/assembly/assembly5/m328Pdef.inc"
ldi r16 0b00111100 ; identifyig output pins 2,3,4,5
out DDRD,r16 ; declaring pins as output
ldi r17,0b00000000 ;intializing w
ldi r18,0b00000000 ;intializing x
ldi r19,0b00000000 ;intializing y
ldi r20,0b00000000 ;intializing z

ldi r21,0b00000001 ; this is used to computations
ldi r22,0b00000001 ; this is used for computations
ldi r23,0b00000001 ; this is used for computations
ldi r24,0b00000001 ; this is used for computations


eor r21,r17 ; 1 xor W = W' now r21=w'
eor r22,r18 ; 1 xor X = X' now r22=x'
eor r23,r19 ; 1 xor Y = Y' now r23=y'
eor r24,r20 ; 1 xor Z = Z' now r24=z'

.DEF W = r17
.DEF X = r18
.DEF Y = r19
.DEF Z = r20
.DEF W' = r21
.DEF X' = r22
.DEF Y' = r23
.DEF Z' = R24

mov r25,W  ;r25 now has w value
and r25,X' ; WX'
and r25,Z' ; WX'Z'

mov r26,W' ;r26 now has the value of W'
and r26,X  ;W'X

or r25,r26 ; here we got the value of r25=WX'Z'+W'X=B
mov r27,W  ; r27 now has the value of W
and r27,X  ; WX
and r27,Y' ; WXY'

mov r28,X' ; r28 now has the value of X'
and r28,Y  ; X'Y

mov r29,W' ; r29 now has the value of W'
and r29,Y  ; W'Y

or r27,r28 ; WXY'+X'Y
or r27,r29 ; Now r27= WXY'+X'Y+W'Y=B

mov r30,W  ; r30  has the valude of W
and r30,X  ; WX
and r30,Y  ; WXY

mov r31,W' ; r31 has the value of W' 
and r31,Z  ; W'Z

or r30,r31 ; NOW r30= WXY+W'Z


; Note: Register r26,r29 and r31 are availale now for use
			
;shifting LSB in r21 to 5th position
ldi r31,0b00000101
lsl r21 ; logical shift left of r21
dec r32 ; counter-- till counter reaches 0, here it repeats for 5 times

;shifting LSB in r25 to 4th position
ldi r31,0b00000100
lsl r25 ; logical shift left of r25
dec r31 ; counter -- till counter reaches 0, here it repeats for 4 times

; shifting LSB in r27 to 3rd position
ldi r31, 0b000000011
lsl r27 ; logical shift left of r27
dec r31 ; counter -- till counter reaches 0, here it repeas for 3 times.

;shifiting LSB in r30 to 2nd position
ldi r31, 0b00000010
lsl r30 ; logical shift left of r30
dec r31 ; counter -- till counter reaches 0, here it repeats for 2 times.

; we know that r21=A, r25=B, r27=C and r30=D
; we need to combine all this to one register and the output can be derived from there.

eor r21,r25
eor r21,r27
eor r21,r30

out PORTD,r16 ;writing output to pins 2,3,4,5

start:
rjmp start:
