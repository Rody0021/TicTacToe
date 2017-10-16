.data	
	Board: .ascii "    A  B  C     \n"
		      " A   |   |  \n"
		      "   --+---+--\n"
	 	      " B   |   | \n"
	     	      "   --+---+--\n"
	              " C   |   |\n"
	
	 
	 sp: .asciiz "\n"
         xplayer: .asciiz  "X"
	 oplayer: .asciiz "O"   
	 askMove: .asciiz "Player insert your play (column|line)\n"
	 invalidMove: .asciiz "Invalid Move"
	 occupiedSpace: .asciiz "Space already occupied\n"    
	 won: .asciiz "\nPlayer   Won! \n"
	 tie: .asciiz  "\nTie!!!"
	gameMenu: .asciiz "\n\nChoose an option:\n[1] New Game\t[99] Quit\nOption: "
	clean: .byte ' '
	AA: .asciiz "AA"
	BA: .asciiz "BA"
	CA: .asciiz "CA"
	AB: .asciiz "AB"
	BB: .asciiz "BB"
	CB: .asciiz "CB"
	AC: .asciiz "AC"
	BC: .asciiz "BC"
	CC: .asciiz "CC"
	   
.text


main:
			li $t1, 0
			li $t2, 0
			li $t3, 0
			li $t4, 0
			li $t5, 0
			li $t6, 0
			li $t7, 0
			li $t8, 0
			li $t9, 0

			li $s0, 0
			li $s5, 0

			la $s1, Board
			la $s2, askMove
			la $s3, won

			lb $a1, clean
			
PrintBoard:
	li $v0, 4
	la $a0, Board
	syscall
 XPlayer:
			lb $a1, xplayer
			
			
OPlatyer:
			lb $a1, oplayer
			
Play:
			li $v0, 4
			la $a0, askMove
			syscall
			
			beq $s6, AA, JAA
			beq $s6, BA, JBA
			beq $s6, CA, JCA
			beq $s6, AB, JAB
			beq $s6, BB, JBB
			beq $s6, CB, JCB
			beq $s6, AC, JAC
			beq $s6, BC, JBC
			beq $s6, CC, JCC
			
			li $v0, 4
			la $a0, invalidMove
			syscall
			
			
			
JAA:  
			
	
	
	
	li $v0, 10
	syscall
