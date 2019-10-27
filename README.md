# Test files for Japanese TeX Development Community

Preparing a regression test using l3build framework.
Test files are derived from:

  * ptex-base: https://github.com/texjporg/ptex-base

## メモ

テストを実行するには，トップディレクトリで

```
    $ texlua build.lua check
```

とする。

### テスト用の .lvt ファイルの作り方

  * 早めに `\input regression-test` する（LaTeX では `\input{regression-test}`）
  * テスト開始は `\START`
  * 出力テストの場合は `\loggingoutput`
    * plain で `\bye` ではなく `\end` で終わっているソースでは，その直前に
      `\eject` の追加も必要
  * `\OMIT` から `\TIMO` まではテストから除外

### 標準の .tlg ファイルを作るには

pTeX のバージョンにより .tlg が変化する可能性もあるが，このリポジトリに置く
.tlg は **必ず TeX Live subversion にあるバージョン** で作成すること！
（開発版 pTeX が現在の公式版 pTeX とどう違うのかをはっきりさせるため）

個々のサブディレクトリで

```
    $ texlua build.lua save sample
```

とする。これで `sample.lvt` に対して
`sample.tlg` が作られる。ここで使われるエンジンは変数
`stdengine` で決まるが，本リポジトリでは `build-config.lua` において既定を
`eptex` に設定している。もし既定エンジンとログが異なる場合は，それ用の
.tlg が必要。例えば

```
    $ texlua build.lua save --engine=euptex sample
```

とすれば `sample.euptex.tlg` が作られる。

注意：l3build は .tlg を作る時にログを normalise するが，この時
pTeX による変更の一部を（pdfTeX との差分を減らすために）消してしまう。
2019-10-27 のコミットで
`, yoko direction` と `\displace 0.0`
は消さないようになった (https://github.com/latex3/l3build/issues/103)
が，他にもあるかもしれないので注意。安全のため，手動で

```
    $ eptex sample
```

として得た `sample.log` と，上述の
l3build の `save` で得た `sample.tlg` を比較するのが望ましい。

----
Japanese TeX Development Community
