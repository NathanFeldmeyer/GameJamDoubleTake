extends Node

signal acornsChanged

var max_acorns: int = 5
var acorns: int = max_acorns

func add_acorn(): 
	acorns -= 1
	acornsChanged.emit(acorns)

func no_acorns():
	acorns = max_acorns
	acornsChanged.emit(acorns)
