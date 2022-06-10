def nested_sum(list):
	allsum = 0
	for sublist in list:
		allsum += sum(sublist)
	print(allsum)

a = [[1,2],[3],[4,5,6]]
nested_sum(a)