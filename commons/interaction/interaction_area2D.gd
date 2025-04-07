class_name InteractionArea2D

extends Area2D
signal interacted(who:Node2D)

func interact(who:Node2D):
	print(who.name + ' is interacting with ' + self.get_parent().name)
	interacted.emit(who)
