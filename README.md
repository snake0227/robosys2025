## robosys2025
  ロボットシステム学課題1
# stdin_kadaiコマンド
![test](https://github.com/snake0227/robosys2025/actions/workflows/test.yml/badge.svg)

  自動車の最高速を計算するコマンド

# 使い方
  馬力、エンジン回転数、車重、最終減速比、最高速ギア比、横幅、全高、最低地上高の順で入力してください。
  このとき、数値一つごとに改行してください。

# 実行環境
  Ubuntu 22.04
  Python3.7~3.10

# ライセンス
  -このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。
  -このパッケージは、Ryuichi Ueda由来のコード(© 2025 ryuichiueda)を利用しています。
  -このパッケージのコードは、下記のスライド(CC-BY-SA 4.0 by Ryuichi Ueda)のものを、本人の許可を得て自身の著作としたものです。
    -[ryuichiueda/my_slides robosys_2025] (https://github.com/ryuichiueda/slides_marp/tree/master/prob_robotics_2025)
  
  参考資料と計算ロジック
  本プログラムの最高速計算ロジックは、以下の資料・ウェブサイトを参考にしています。
    URL: https://www.team-ash.jp/maxspeed.html
    参考箇所　最高速の計算式、空気抵抗の計算式、駆動力の計算式、転がり抵抗の計算式、速度別の転がり抵抗係数、速度別の動荷重半径
  -©　2025 Daichi Utsugi
