;hello
;using assembly language for turning LED on


.include "/home/riyaz/riyaz/Assembly/lightupledd13/src/m328Pdef.inc"


  ldi r16,0b00000000
  out DDRB,r16
  ldi r17,0b00000001
  out PortB,r17
Start:
  rjmp Start
