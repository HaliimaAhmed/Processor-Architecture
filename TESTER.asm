;Walk_A_Bit.asm

#include C:\68HCS12\registers.inc

; Author:       Halima Ahmed
; Purpose:

	; Program Constants
	
STACK   equ     $2000
PB0ON   equ     %00000001                 ; 1 turns on LED, 0 turns off LED
PB0OFF  equ     %00000000                 ; 1 turns on LED, 0 turns off LED

        org     $2000                     ; program code
Start   lds     #STACK                    ; stack location
        clrb
        jsr     Config_SWs_and_LEDs       ; Configure the Ports
Back    ldaa    #PB0ON          	  ; Continually Flash LED
        staa    portb           	  ; PB0 ON
        ldaa    #180            	  ; 180 ms delay
        jsr     Delay_ms        	  ; call 180ms delay routine
        ldaa    #PB0OFF        		  ; Continually Flash LED OFF
        staa    portb           	  ; PB7 OFF
        ldaa    #180            	  ; 250 ms delay
        jsr     Delay_ms        	  ; call 180ms delay routine
        bra     Back            	  ; endless loop


; Library Files

#include C:\68HCS12\Lib\Config_SWs_and_LEDs.asm
#include C:\68HCS12\Lib\Delay_ms.asm

        end