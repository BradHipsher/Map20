extends Node

static func getMinDistVec(pos, arrVec2):
	var mindist = -1
	var minvec = Vector2(-1,-1)
	for vec in arrVec2:
		var dist = sqrt(pow(pos.x - vec.x,2) + pow(pos.y - vec.y,2))
		if(mindist==-1):
			mindist=dist
			minvec = vec
		else:
			if(dist < mindist):
				mindist=dist
				minvec = vec
	return minvec

static func posAddress(pos):
	return str(Vector2(round(pos.x), round(pos.y)))

static func delete_children(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()
