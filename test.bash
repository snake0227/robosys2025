#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Daichi Utsugi
# SPDX-License-Identifier: BSD-3-Clause
ng(){
        echo ${1}行目が違う
	res=1 
}

res=0

out=$(echo -e '235\n 7000\n 1270\n 4.100\n 0.767\n 1775\n 1280\n 130\n' | ./stdin_kadai.py)
[ "${out}" = '284.69 km/h' ] || ng "$LINENO"

out=$(echo -e '150\n 6000\n 1000\n 3.909\n 0.582\n 2300\n 1580\n 200\n' | ./stdin_kadai.py)
[ "${out}" = '167.38 km/h' ] || ng "$LINENO"

out=$(echo -e '-150\n 6000\n 1000\n 3.909\n 0.582\n 2300\n 1580\n 200\n' | ./stdin_kadai.py)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo -e '150\n 0\n 1000\n 3.909\n 0.582\n 2300\n 1580\n 200\n' | ./stdin_kadai.py)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo -e '150\n 6000\n 1000\n \n 0.582\n 2300\n 1580\n 200\n' | ./stdin_kadai.py)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo -e '150\n 6000\n -1567669\n 3.909\n 0.582\n 2300\n 1580\n 200\n' | ./stdin_kadai.py)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo -e '150\n 6000\n 1000\n -0.590\n 0.582\n 2300\n 1580\n 200\n' | ./stdin_kadai.py)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo -e '-150\n 6000\n 1000\n 3.909\n 0.582\n 2300\n 1580\n 200\n' | ./stdin_kadai.py)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo あ | ./stdin_kadai.py)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo -e '235\n あ\n  \n' | ./stdin_kadai.py)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./stdin_kadai.py)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK

exit $res
