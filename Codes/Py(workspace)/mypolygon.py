import turtle
import math
def squre(t,length,n):
    angle=360/n
    for i in range(n):
        t.fd(length)
        t.lt(angle)
    print(t)
def cir(t,r):
    circum=2*math.pi*r
    n=int(circum/3)+1
    length=circum/n
    squre(t,length,n)
bob=turtle.Turtle()
cir(bob,100)
