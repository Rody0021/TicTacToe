.data	
	Board: .ascii "    A  B  C     \n"
		      " 1   |   |  \n"
		      "   --+---+--\n"
	 	      " 2   |   | \n"
	     	      "   --+---+--\n"
	              " 3   |   |\n"
	
	 
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
	A1: .asciiz "A1"
	B1: .asciiz "B1"
	C1: .asciiz "C1"
	A2: .asciiz "A2"
	B2: .asciiz "B2"
	C2: .asciiz "C2"
	A3: .asciiz "A3"
	B3: .asciiz "B3"
	C3: .asciiz "C3"
	player_move: .space 9
	   
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
			
			#sb $a1, 14($s1)
			#sb $a1, 18($s1)
			#sb $a1, 22($s1)
			#sb $a1, 40($s1)
			#sb $a1, 44($s1)
			#sb $a1, 48($s1)
			#sb $a1, 66($s1)
			#sb $a1, 70($s1)
			#sb $a1, 74($s1)
			
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
			li $v0, 8
			la $a0, player_move
			la $a1, 4
			syscall
			
			la $s6, player_move
			
			beq $s6, A1, JA1
			#beq $s6, B1, JB1
			#beq $s6, C1, JC1
			#beq $s6, A2, JA2
			#beq $s6, B2, JB2
			#beq $s6, C2, JC2
			#beq $s6, A3, JA3
			#beq $s6, B3, JB3
			#beq $s6, C3, JC3
			
			li $v0, 4
			la $a0, invalidMove
			syscall
			b Play
			
JA1:
	li $v0, 4
	la $a0, A1
	syscall
			


	li $v0, 10
	syscall
