.include "/sdcard/FWC/assembly/assemblyassignment2/m328Pdef.inc"

ldi r17,0b11001111 ; identifying the 4,5 as input pins

out DDRD,r17

ldi r17,0b11111111 ; activting the pull ups
out PORTD,r17

ldi r16,0b00000001 ; identifying pin 8 in port B as the output pin
out DDRB,r16       ; declaring the output pin

start:

	in r17,PIND

	ldi r18,0b00010000
	mov r21,r17
	and r21,r18
	ldi r20,0b00000100
	shiftx:
	lsr r21
	dec r20
	brne shiftx
	.DEF X = r21

	ldi r18,0b00100000
	mov r22,r17
	and r22,r18
	ldi r20,0b00000101
	shifty:
	lsr r22
	dec r20
	brne shifty
	.DEF Y = r22

	ldi r23,0x00
	ldi r24,0x00
	.DEF X1 = r23
	.DEF Y1 = r24

	mov X1,X
	mov Y1,Y
	com X1
	com Y1

	and X1,Y
	and Y1,X

	or X1,Y1

	out PORTB, X1

	rjmp start
