// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

@R0
D=M
@i
M=D			//i=R0
@MULTIPLY
D;JGT		//if i > 0 goto MULTIPLY
@negative
M=1
@i
M=-M		//i=-i

(MULTIPLY)
@R2
M=0
@i
D=M
@END
D; JEQ		//if i == 0 goto end
@R1
D=M
@unit
M=D			//unit=R1
(LOOP)
@unit
D=M			//D=unit
@i
M=M-1		//i--
@R2
M=D+M		//R2=R2+unit
@i
D=M
@LOOP
D;JGT		//if i > 0 goto LOOP

@negative
D=M
@END
D;JEQ		//if !negative goto return

@R1
D=M
D=-D

(END)
@END
0;JMP
