import turtle
import math
def piece(t,r):
    degree = 60
    circum=2*math.pi*r
    n=int(circum/3)+1
    d=degree/n # 单次旋转角度
    length=circum/n
    for i in range(2):
        for j in range(n):
            t.pd()
            t.fd(length)
            t.lt(d)
        t.lt(120)
    print(t)
    turtle.mainloop()
def flowers(t,n,r):
    for i in range(n):
        a=360/n-i
        t.lt(a)
        piece(t,r)
longxiu=turtle.Turtle()
flowers(longxiu,12,10)
