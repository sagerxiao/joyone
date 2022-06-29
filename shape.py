#!/usr/bin/python
# -*- coding: UTF-8 -*-

print("请输入形状类型：","1=正方形；2=长方形；3=三角形；4=圆形；")
option=float(input("您的选项："))

if option == 1:
    from shape import square
    case1=square(size=int(input("输入正方形边长（单位cm）:")))
    case1.sqp()
    case1.sqa()

elif option==2:
    from shape import rectangle
    case2=rectangle(length=int(input("输入长方形的长（单位cm）:")),width=int(input("输入长方形的宽（单位cm）:")))
    case2.rtp()
    case2.rta()

elif option==3:
    from shape import rectangle
    case3=rectangle(a=int(input("输入三角形的边长(单位cm）a=:")),b=int(input("输入三角形的边长(单位cm）b=:")),c=int(input("输入三角形的边长(单位cm）c=:")))
    case3.trp()
    case3.tra()

elif option==4:
    from shape import circular
    case4=circular(r=int(input("输入圆的半径（单位cm）:")))
    case4.crp()
    case4.cra()

else:
    print("你没有输入1-4中正确的选项")
