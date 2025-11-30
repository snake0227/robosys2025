#!/usr/bin/python3
# SPDX-FileCopylightText: 2025 Daichi Utsugi
# SPDX-License-Indentifier: BSD-3-Clause

import sys

def speed(ps, engine_rpm, m, fd, md, w, h, min_h, Crr, r):
    g = 9.81 #重力加速度
    CD = 0.27 #CD値

    t = (ps * 716) / engine_rpm #トルク
    Cr = Crr * m * g #転がり抵抗
    F_drive = (t * fd * md * 0.9 * g) / r #駆動力
    Ar = F_drive - Cr #空気抵抗
    Front_area = w * (h - min_h) * 0.95 #前面投影面積
    Air_density = 1.293 / (1 + 0.00367 * 20) #空気密度

    v = (((Ar * 2) / (CD * Front_area * Air_density)) ** 0.5) * 3.6 #最高速

    return v, t, Cr, F_drive, Ar, Front_area, Air_density


ps = float(sys.stdin.readline()) #馬力
engine_rpm = float(sys.stdin.readline()) #エンジン回転数
m = float(sys.stdin.readline()) #車重
fd = float(sys.stdin.readline()) #最終減速比
md = float(sys.stdin.readline()) #最高速ギア比
w = float(sys.stdin.readline()) / 1000 #横幅
h = float(sys.stdin.readline()) / 1000 #全高
min_h = float(sys.stdin.readline()) / 1000 #最低地上高

Crr = 0.015 #転がり抵抗係数(初期値)
r = 315.5 / 1000 #タイヤ半径(初期値)

result = speed(ps, engine_rpm, m, fd, md, w, h, min_h, Crr, r)
v, t, Cr, F_drive, Ar, Front_area, Air_density = result



if v >= 300:
    Crr = 0.037
    r = 308.7 / 1000
    result = speed(ps, engine_rpm, m, fd, md, w, h, min_h, Crr, r)

elif 200 <= v < 300:
    Crr = 0.01608
    r = 307.2 / 1000
    result = speed(ps, engine_rpm, m, fd, md, w, h, min_h, Crr, r)

else:
    Crr = 0.01235
    r = 304.4 / 1000
    result = speed(ps, engine_rpm, m, fd, md, w, h, min_h, Crr, r)

v, t, Cr, F_drive, Ar, Front_area, Air_density = result

print(f"{v:.2f} km/h")
