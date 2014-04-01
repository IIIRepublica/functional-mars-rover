rover = (position, commands) ->
	if commands[0] == 'F'
		newposition = 
			point: 
				x: if position.direction == 'E' then position.point.x + 1 else if position.direction == 'W' then position.point.x - 1 else position.point.x
				y: if position.direction == 'S' then position.point.y - 1 else if position.direction == 'N' then position.point.y + 1 else position.point.y
			direction: position.direction

	else if commands[0] == 'B'
		newposition = 
			point: 
				x: if position.direction == 'E' then position.point.x - 1 else if position.direction == 'W' then position.point.x + 1 else position.point.x
				y: if position.direction == 'S' then position.point.y + 1 else if position.direction == 'N' then position.point.y - 1  else position.point.y
			direction: position.direction

	else if commands[0] == 'R'
		position =
			point: 
				x: position.point.x
				y: position.point.y
			direction: 
				switch position.direction
					when 'E' then 'S'
					when 'W' then 'N'
					when 'N' then 'E'
					when 'S' then 'W'
					else position.direction

	else if commands[0] == 'L'
		position =
			point: 
				x: position.point.x
				y: position.point.y
			direction: 
				switch position.direction
					when 'E' then 'N'
					when 'W' then 'S'
					when 'N' then 'W'
					when 'S' then 'E'
					else position.direction