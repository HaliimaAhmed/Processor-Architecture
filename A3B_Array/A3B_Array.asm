;A3B_Array.asm

; Author:       Halima Ahmed,Nehemie Jibikila
; Course:       CST8216 Fall 2018
; S/N:          040825884, 040848955
; Date:         november 22nd, 2018

; Purpose: This program uses iteration and pointers to copy the values from Source_Array to Destination_Array and places the copied values backwards in memory.

STACK   EQU     $2000                                   ;Initializing the stack to a value of $2000

        org     $1000
        
Source_Array

        db        $01,$FF,$55,$22,$19,$AA,$12,$FE       ; values of the array

End_Source
Destination_Array

        ds        Destination_Array-Source_Array        ; auto calculate Array Size(Destination_Array subtracted from the Source_Array)
End_Destination

        org	$2000
        lds	#STACK                                  ;load the STACK to the value
        
        ldx     #End_Source-1                           ; load the previous value from Source_Array
        ldy     #Destination_Array                      ; load the Destination Array
Start   ldaa    1,x-                                    ; loads value
        staa    1,y+                                    ; stores the value loaded to the destination array
        cpx     #Source_Array-1                         ; Compare Memory of the previous value from Source Array
        bne     Start                                   ; branch is not equal to start

        end