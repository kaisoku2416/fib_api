# 技術課題 問題1
このリポジトリは「問題1」の Ruby on Rails による実装です。

## 仕様
* URLパラメータとして$n$の値を渡すと、$n$番目のフィボナッチ数のデータをjson形式で返します。
* 制約：$1\leq n\lt 1000000$

## 使用例
* $n$が制約を満たす場合（例 $n=99$ の場合）、$n$番目のフィボナッチ数が返されます。
* $n$が整数で、かつ制約外の場合、416コードが返されます。
* $n$が整数でない、または$n$が与えられていない場合、400コードが返されます。

## 主要フォルダの説明
* `app/`：アプリケーションのコード
  * `controller/`
    * 	`fibonacci_controller.rb`：要求されたフィボナッチ数を返すためのコントローラー
 * `config/`
    * `routes.rb`：ルーティング指定
 * `spec/`：ユニットテスト用
   * `system/`
     * `fibonacci_spec.rb`：システムテストのスクリプト（[ChromeDriver](https://chromedriver.chromium.org/downloads)が必要です）