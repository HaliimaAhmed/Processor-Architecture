;A4_Bubble_Sort.asm

; Author:       Halima Ahmed
; Course:       CST8216 Fall 2018
; S/N:          040825884
; Date:         December 6th, 2018

; Purpose: The purpose of this lab is to implement a Bubble sort

STACK                  equ     $2000

;Compared elements

Sort                 equ     2
length_Array         equ     16              ; length of Array
variable             equ     4               ; all the variables use 4 bytes

        org     $1000

#include Array_db.txt                   ; Read in the Array Contents from a text file

        org     $2000
start   lds     #STACK                  ;Load the STACK to the value

        ldx     #Array                  ;Load value from rray
        pshx                            ;Push onto Stack
        ldaa    #length_Array           ;Loads value of length_Array
        psha                            ;Push onto Stack
        jsr     swap                    ;Jump to swap
        leas    3,sp                    ;Load Effective Address into SP by 3

swap    pshd                            ;Pushed swap onto Stack
        pshy                            ;Push y onto Stack ((SP)-2)
        pshx                            ;Push X onto Stack ((SP)-2)
        leas    -variable,sp            ;Load variable into sp
        ldaa    12,sp
        deca                            ;Decrement
        staa    0,sp
        
Array1  ldaa    #1                   	;loads value of 1
        staa    Sort,sp                 ;Store sort to sp
        ldx     13,sp  			;Loads 13 into register
        ldaa    0,sp
        staa    1,sp
        
Array2  ldaa    0,x     		;Loads value of Array
        cmpa    1,x                     ;Compares the two values
        bls     Array3                  ;Branch if Lower or Same for unsigned(C+Z = 1)
        staa    3,sp  			;Swapped values
        ldaa    1,x
        staa    0,x
        ldaa    3,sp
        staa    1,x
        ldaa    #0  			;loads value of 0
        staa    Sort,sp
        
Array3  inx
        dec     1,sp                    ;Decrement
        bne     Array2                  ;Branch if Arrays Not Equal (A = 0)
        tst     Sort,sp                 ;Test Memory
        dec     0,sp                    ;Decrement
        bne     Array1                  ;Branch is not equal to Array1
        end