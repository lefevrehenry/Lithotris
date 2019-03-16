
func pathfind(tilemap, from, to) -> bool:
	return find_next_nodes(tilemap, from, to, {})

func find_next_nodes(tilemap: TileMap, pos : Vector2, dest : Vector2, visited : Dictionary) -> bool:
	# Already visited
	var vHash = hash(pos)
	if visited.has(vHash):
		return false
	
	# End case
	if pos == dest:
		return true
	
	visited[vHash] = true
	
	# Empty 
	if tilemap.get_cellv(pos) <= 0:
		return false
		
	var directions = [
		Vector2(pos.x - 1, pos.y),
		Vector2(pos.x + 1, pos.y),
		Vector2(pos.x, pos.y - 1),
		Vector2(pos.x, pos.y + 1)
	]
	
	for dir in directions:
		var cValue = tilemap.get_cellv(dir)
		# Conductor = tile 1
		# Arrival = tile 4
		if (cValue == 1 or cValue == 4) and find_next_nodes(tilemap, dir, dest, visited):
			return true
	return false