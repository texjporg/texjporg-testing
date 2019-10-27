# Test files for Japanese TeX Development Community

Preparing a regression test using l3build framework.

## メモ

テストを実行するには，トップディレクトリで

```
    $ texlua build.lua check
```

とする。

標準の .tlg ファイルを作るには，個別のサブディレクトリで

```
    $ texlua build.lua save sample
```

とする。これで `sample.lvt` に対して
`sample.tlg` が作られる。ここで使われるエンジンは変数
`stdengine` で決まるが，本リポジトリでは build-config.lua において既定を
`eptex` に設定している。もし既定エンジンとログが異なる場合は，

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

として得た sample.log と，上述の
l3build の save で得た sample.tlg を比較するのが望ましい。

Japanese TeX Development Community
