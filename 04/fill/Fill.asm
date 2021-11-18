// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(LOOP)
	@8192
	D=A
	
	@i
	M=D			//i=8192
	
	@KBD
	D=M
	@FILL
	D;JNE

(CLEAR)
	@SCREEN
	D=A
	@i
	A=D+M
	M=0			//M[SCREEN+i]=0000000000000000
	@i
	M=M-1		//i--
	D=M
	@CLEAR
	D;JGE		//if i >= 0 goto CLEAR
	@LOOP
	0;JMP

(FILL)
	@SCREEN
	D=A
	@i
	A=D+M
	M=-1		//M[SCREEN+i]=1111111111111111
	@i
	M=M-1		//i--
	D=M
	@FILL
	D;JGE		//if i >= 0 goto FILL
	@LOOP
	0;JMP
