.data	
	 Board: .ascii "     1   2   3\n"
	 	       " 1    |   |   \n"
		       "   ---+---+---\n"
	      	       " 2    |   |   \n"
	     	       "   ---+---+---\n"
	               " 3    |   |   \n" 
	               askMove: .asciiz "Player   insert move:"
	               occupiedSpace: .asciiz "Space already occupied\n"   
	               invalidMove: .asciiz "Invalid Move" 
	               x: .asciiz  "X"
	 	       o: .asciiz "O"   
	 	      won: .asciiz "\nPlayer   Won! \n"
	 	      gameMenu: .asciiz "\n\nChoose an option:\n[1] New Game\t[99] Quit\nOption: "
	 		clean: .byte ' '
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
			sb $a1, 20($s1)
			sb $a1, 24($s1)
			sb $a1, 28($s1)
			sb $a1, 50($s1)
			sb $a1, 54($s1)
			sb $a1, 58($s1)
			sb $a1, 75($s1)
			sb $a1, 79($s1)
			sb $a1, 83($s1)
			
PrintBoard:
			li $v0, 4
			la $a0, Board
			syscall

			add $s5, $s5, 1

			rem $t0, $s0, 2
			add $s0, $s0, 1
			bnez $t0, OPlayer
			
XPlayer:
			lb $a1, x
			sb $a1, 7($s2)
			sb $a1, 8($s3)
			j Play					
OPlayer:
			lb $a1, o
			sb $a1, 7($s2)
			sb $a1, 8($s3)
			
Play:
			li $v0, 4
			la $a0, askMove
			
			
			syscall

			
			

			beq $s6, 11, J11
			beq $s6, 21, J21
			beq $s6, 31, J31
			beq $s6, 12, J12
			beq $s6, 22, J22
			beq $s6, 32, J32
			beq $s6, 13, J13
			beq $s6, 23, J23
			beq $s6, 33, J33

			li $v0, 4
			la $a0, invalidMove
			syscall
			

J11:
			bnez $t1, Occupied
			bnez $t0, O11

			X11:
			li $t1, 1
			sb $a1, 20($s1)
			j CheckVictory

			O11:
			li $t1, 2
			sb $a1, 20($s1)
			j CheckVictory

J21:
			bnez $t2, Occupied
			bnez $t0, O21

			X21:
			li $t2, 1
			sb $a1, 24($s1)
			j CheckVictory

			O21:
			li $t2, 2
			sb $a1, 24($s1)
			j CheckVictory

J31:
			bnez $t3, Occupied
			bnez $t0, O31

			X31:
			li $t3, 1
			sb $a1, 28($s1)
			j CheckVictory

			O31:
			li $t3, 2
			sb $a1, 28($s1)
			j CheckVictory

J12:
			bnez $t4, Occupied
			bnez $t0, O12

			X12:
			li $t4, 1
			sb $a1, 50($s1)
			j CheckVictory

			O12:
			li $t4, 2
			sb $a1, 50($s1)
			j CheckVictory

J22:
			bnez $t5, Occupied
			bnez $t0, O22

			X22:
			li $t5, 1
			sb $a1, 54($s1)
			j CheckVictory

			O22:
			li $t5, 2
			sb $a1, 54($s1)
			j CheckVictory

J32:
			bnez $t6, Occupied
			bnez $t0, O32

			X32:
			li $t6, 1
			sb $a1, 58($s1)
			j CheckVictory

			O32:
			li $t6, 2
			sb $a1, 58($s1)
			j CheckVictory

J13:
			bnez $t7, Occupied
			bnez $t0, O13

			X13:
			li $t7, 1
			sb $a1, 80($s1)
			j CheckVictory

			O13:
			li $t7, 2
			sb $a1, 80($s1)
			j CheckVictory

J23:
			bnez $t8, Occupied
			bnez $t0, O23

			X23:
			li $t8, 1
			sb $a1, 84($s1)
			j CheckVictory

			O23:
			li $t8, 2
			sb $a1, 84($s1)
			j CheckVictory

J33:
			bnez $t9, Occupied
			bnez $t0, O33

			X33:
			li $t9, 1
			sb $a1, 88($s1)
			j CheckVictory

			O33:
			li $t9, 2
			sb $a1, 88($s1)
			j CheckVictory


Occupied:
			li $v0, 4
			la $a0, occupiedSpace
			syscall
			j Play

CheckVictory:
			and $s7, $t1, $t2
			and $s7, $s7, $t3
			bnez $s7, Victory

			and $s7, $t4, $t5
			and $s7, $s7, $t6
			bnez $s7, Victory

			and $s7, $t7, $t8
			and $s7, $s7, $t9
			bnez $s7, Victory

			and $s7, $t1, $t4
			and $s7, $s7, $t7
			bnez $s7, Victory

			and $s7, $t2, $t5
			and $s7, $s7, $t8
			bnez $s7, Victory

			and $s7, $t3, $t6
			and $s7, $s7, $t9
			bnez $s7, Victory

			and $s7, $t1, $t5
			and $s7, $s7, $t9
			bnez $s7, Victory

			and $s7, $t7, $t5
			and $s7, $s7, $t3
			bnez $s7, Victory
			j PrintBoard

Victory:
			li $v0, 4
			la $a0, PrintBoard
			

			li $v0, 4
			la $a0, won
			syscall
#Credit to Daylin Ettles and Johny Do
music:
 			li $a0, 1
  			li $a1, 100 #1000 is 1sec
  			li $a2, 1
  			li $a3, 127
  			la $v0, 31
  			syscall
  			start:
  			li $a0, 91
  			li $a1, 600 #1000 is 1sec
  			li $a2, 1
  			li $a3, 127
  			la $v0, 33
  			syscall
  			li $a0, 91
  			li $a1, 600 #1000 is 1sec
  			li $a2, 1
  			li $a3, 127
  			la $v0, 33
  			syscall
  			li $a0, 74
  			li $a1, 400 #1000 is 1sec
  			li $a2, 1
  			li $a3, 127
  			la $v0, 33
  			syscall
  			li $a0, 80
  			li $a1, 300 #1000 is 1sec
  			li $a2, 1
  			li $a3, 127
  			la $v0, 33
  			syscall
  			li $a0, 80
  			li $a1, 300 #1000 is 1sec
  			li $a2, 1
  			li $a3, 127
  			la $v0, 33
  			syscall
  			li $a0, 74
  			li $a1, 600 #1000 is 1sec
  			li $a2, 1
  			li $a3, 127
  			la $v0, 33
  			syscall
  		
			
			li $v0, 10
			syscall
