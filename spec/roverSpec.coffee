describe 'Rover Mars Problem', ->
	
	describe 'Rover facing at all directions', ->
		it 'move at correct position with F/B command facing at initial direction', ->
			where ->
				"""
				initial_dir | initial_x | initial_y | expected_x | expected_y | command
							E			|		0 			| 		0 		| 		 1		 | 			0			|			F
							E			|		0 			| 		0 		| 		-1		 | 			0			|			B							
							W			|		0 			| 		0 		| 		-1		 | 			0			|			F
							W			|		0 			| 		0 		| 		 1		 | 			0			|			B
							S			|		0 			| 		0 		| 		 0		 | 		 -1 		|			F
							S			|		0 			| 		0 		| 		 0		 | 		  1 		|			B
							N			|		0 			| 		0 		| 		 0		 | 		  1 		|			F
							N			|		0 			| 		0 		| 		 0		 | 		 -1 		|			B
				"""
				initialPosition = 
					point:
						x: initial_x
						y: initial_y
					direction: initial_dir

				nextPosition = rover initialPosition, command

				expect expected_x
					.toBe nextPosition.point.x
				expect expected_y
					.toBe nextPosition.point.y
				expect nextPosition.direction
					.toBe initial_dir

			, jasmine: jasmine

		it 'change direction when receive R/L command', ->
			where ->
				"""
					initial_dir | command | expected_dir
							E 			|			R 	|				S
							E 			|			L		|				N
							W 			|			R		|				N
							W 			|			L		|				S
							N 			|			R		|				E
							N 			|			L		|				W
							S 			|			R		|				W
							S 			|			L		|				E
				"""
				initialPosition = 
					point:
						x: 0
						y: 0
					direction: initial_dir

				nextPosition = rover initialPosition, command

				expect expected_dir
					.toBe nextPosition.direction

			, jasmine : jasmine
		  