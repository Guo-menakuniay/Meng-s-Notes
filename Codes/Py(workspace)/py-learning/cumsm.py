def middle(list): #去掉列表首尾元素
	newlist = []
	del list[-1]
	del list[0]
	newlist = list
	print(newlist)

a = [1,2,3,4]
# middle(a)


def is_sorted(list):
	newlist2 = list.sort()
	print(newlist2)
	if newlist2 == list:	
		print('is sorted')
	else: 
		print('is not sorted')

is_sorted(a)