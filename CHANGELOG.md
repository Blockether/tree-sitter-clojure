## Changelog

Bits may be missing and/or inaccurate :)

### v0.0.13-blockether.2 - 2026-06-22

Addresses the open upstream issues/PR, one by one:

* Grammar
  * Drop the single-element `seq(DIGIT)` in `OCTAL_CHAR` that caused
    `tree-sitter generate` to warn about a redundant seq/choice
    ([#62](https://github.com/sogaiu/tree-sitter-clojure/issues/62))
  * Break `str_lit` into `"` open/close delimiters with an inner
    `str_content` node so grammars can be injected into string contents
    ([#52](https://github.com/sogaiu/tree-sitter-clojure/issues/52))
* Packaging
  * Add a `tree-sitter.json` manifest; removes the missing-manifest generate
    warning ([#64](https://github.com/sogaiu/tree-sitter-clojure/issues/64))
  * Credit Blockether as fork author/maintainer (upstream is CC0-1.0);
    keep sogaiu credited as original author
* Tests
  * Adopt the maintainer's canonical Clojure 1.12 corpus tests from PR
    [#68](https://github.com/sogaiu/tree-sitter-clojure/pull/68)
    ([#67](https://github.com/sogaiu/tree-sitter-clojure/issues/67))
  * Document return-type-metadata-on-arg-vector behavior as working-as-intended
    ([#65](https://github.com/sogaiu/tree-sitter-clojure/issues/65))

Parser kept at ABI 14. 126/126 corpus tests pass.

### v0.0.13-blockether.1 - 2026-06-22

* Tests (Blockether fork)
  * Add corpus tests for Clojure 1.12 syntax (Java interop / reflection),
    covering qualified static method symbols / method values
    (`Integer/parseInt`), instance method symbols (`String/.length`),
    constructor method values (`String/new`), array class syntax
    (`String/1`, `int/2` — CLJ-2807), and param-tags metadata
    (`^[int long]`), plus return-type metadata on the argument vector
    ([#67](https://github.com/sogaiu/tree-sitter-clojure/issues/67),
    [#65](https://github.com/sogaiu/tree-sitter-clojure/issues/65))
  * Grammar is unchanged: these forms already parse correctly as qualified
    symbols + metadata; the tests lock in that behavior.

### Future?

* Handle zero bytes?
* Decide about inline use (e.g. add some \_bare\_\* constructs? stop using?)
  ([#41](https://github.com/sogaiu/tree-sitter-clojure/issues/41))

### v0.0.13 - 2024-05-15

* Features and Fixes
  * Increase API number from 13 to 14
    ([#60](https://github.com/sogaiu/tree-sitter-clojure/issues/60))
  * Remove Node and Rust Bindings
    ([#61](https://github.com/sogaiu/tree-sitter-clojure/issues/61))
  * Update version info in package.json

* Docs
  * What and why doc - update bindings info

### v0.0.12 - 2023-05-07

* Features and Fixes
  * Loosen sym_val_lit definition
    ([#51](https://github.com/sogaiu/tree-sitter-clojure/issues/51))
  * Handle metadata that is an evaling_lit
    ([#35](https://github.com/sogaiu/tree-sitter-clojure/issues/35),
    [#46](https://github.com/sogaiu/tree-sitter-clojure/issues/46),
    [#50](https://github.com/sogaiu/tree-sitter-clojure/issues/50))
  * Handle construct used for ClojureDart's parameterized types
    ([#35](https://github.com/sogaiu/tree-sitter-clojure/issues/35),
    [#44](https://github.com/sogaiu/tree-sitter-clojure/pull/44),
    [#46](https://github.com/sogaiu/tree-sitter-clojure/issues/46))
  * Generate parser.c and friends with tree-sitter 0.20.7 (ABI 13)
    ([#26](https://github.com/sogaiu/tree-sitter-clojure/pull/26),
    [#34](https://github.com/sogaiu/tree-sitter-clojure/issues/34),
    [#45](https://github.com/sogaiu/tree-sitter-clojure/issues/45))
* Docs
  * README
    * Add section on "what and why"
      ([#38](https://github.com/sogaiu/tree-sitter-clojure/issues/38))
    * Add section pointing to other docs
      ([#47](https://github.com/sogaiu/tree-sitter-clojure/issues/47))
    * Move resources list to own document
      ([#47](https://github.com/sogaiu/tree-sitter-clojure/issues/47))
    * Remove npm-related descriptions
      ([#47](https://github.com/sogaiu/tree-sitter-clojure/issues/47))
  * Use doc - mostly new users added
    ([#47](https://github.com/sogaiu/tree-sitter-clojure/issues/47))
  * Scope doc - corrections and refinements
    ([#47](https://github.com/sogaiu/tree-sitter-clojure/issues/47))
  * Testing doc - link and format updates
    ([#47](https://github.com/sogaiu/tree-sitter-clojure/issues/47))
  * What and why doc - added
    ([#47](https://github.com/sogaiu/tree-sitter-clojure/issues/47))
  * Limits doc - added
  * notes.txt - removed
* Developer-related
  * Improve maintainability of grammar.js
    ([#39](https://github.com/sogaiu/tree-sitter-clojure/issues/39),
    [#40](https://github.com/sogaiu/tree-sitter-clojure/issues/40))
  * Remove dependence on npm
    ([#36](https://github.com/sogaiu/tree-sitter-clojure/issues/36),
    [#37](https://github.com/sogaiu/tree-sitter-clojure/issues/37),
    [#38](https://github.com/sogaiu/tree-sitter-clojure/issues/38),
    [#45](https://github.com/sogaiu/tree-sitter-clojure/issues/45))
  * Cleanup package.json
    ([#34](https://github.com/sogaiu/tree-sitter-clojure/issues/34),
    [#36](https://github.com/sogaiu/tree-sitter-clojure/issues/36),
    [#37](https://github.com/sogaiu/tree-sitter-clojure/issues/37),
    [#38](https://github.com/sogaiu/tree-sitter-clojure/issues/38),
    [#45](https://github.com/sogaiu/tree-sitter-clojure/issues/45))
  * Move corpus to test/corpus
  * Most developer-bits moved to separate repository
    ([#35](https://github.com/sogaiu/tree-sitter-clojure/issues/35),
    [#36](https://github.com/sogaiu/tree-sitter-clojure/issues/36),
    [#39](https://github.com/sogaiu/tree-sitter-clojure/issues/39),
    [#42](https://github.com/sogaiu/tree-sitter-clojure/issues/42),
    [#43](https://github.com/sogaiu/tree-sitter-clojure/issues/43),
    [#45](https://github.com/sogaiu/tree-sitter-clojure/issues/45),
    [#46](https://github.com/sogaiu/tree-sitter-clojure/issues/46),
    [#47](https://github.com/sogaiu/tree-sitter-clojure/issues/47))
* Credits
  * borkdude
    ([#51](https://github.com/sogaiu/tree-sitter-clojure/issues/51))
  * cgrand
    ([#44](https://github.com/sogaiu/tree-sitter-clojure/pull/44))
  * dannyfreeman
    ([#26](https://github.com/sogaiu/tree-sitter-clojure/pull/26),
    [#35](https://github.com/sogaiu/tree-sitter-clojure/issues/35),
    [#37](https://github.com/sogaiu/tree-sitter-clojure/issues/37),
    [#38](https://github.com/sogaiu/tree-sitter-clojure/issues/38),
    [#39](https://github.com/sogaiu/tree-sitter-clojure/issues/39),
    [#40](https://github.com/sogaiu/tree-sitter-clojure/issues/40),
    [#41](https://github.com/sogaiu/tree-sitter-clojure/issues/41),
    [#42](https://github.com/sogaiu/tree-sitter-clojure/issues/42),
    [#43](https://github.com/sogaiu/tree-sitter-clojure/issues/43),
    [#46](https://github.com/sogaiu/tree-sitter-clojure/issues/46),
    [#48](https://github.com/sogaiu/tree-sitter-clojure/pull/48),
    [#49](https://github.com/sogaiu/tree-sitter-clojure/issues/49),
    [#51](https://github.com/sogaiu/tree-sitter-clojure/issues/51))
  * dmiller
    ([#42](https://github.com/sogaiu/tree-sitter-clojure/issues/42))
  * IGJoshua
    ([#35](https://github.com/sogaiu/tree-sitter-clojure/issues/35))
  * NoahTheDuke
    ([#26](https://github.com/sogaiu/tree-sitter-clojure/pull/26),
    [#35](https://github.com/sogaiu/tree-sitter-clojure/issues/35),
    [#37](https://github.com/sogaiu/tree-sitter-clojure/issues/37),
    [#38](https://github.com/sogaiu/tree-sitter-clojure/issues/38),
    [#39](https://github.com/sogaiu/tree-sitter-clojure/issues/39),
    [#40](https://github.com/sogaiu/tree-sitter-clojure/issues/40),
    [#42](https://github.com/sogaiu/tree-sitter-clojure/issues/42))
  * phronmophobic
    ([#35](https://github.com/sogaiu/tree-sitter-clojure/issues/35))

### v0.0.11 - 2023-01-22

* Update version info in package.json

### v0.0.10 - 2023-01-06

* Tokenize symbols and keywords further
  ([#31](https://github.com/sogaiu/tree-sitter-clojure/issues/31)) -
  dannyfreeman
* Address symbols after metadata issue
  ([#21](https://github.com/sogaiu/tree-sitter-clojure/issues/21)) -
  dannyfreeman
* Change formatting of grammar.js

### v0.0.9 - 2022-06-03

* Add corpus for light testing
* Add highlighting queries for difftastic
  ([#20](https://github.com/sogaiu/tree-sitter-clojure/issues/20))
* Remove web-tree-sitter dependency
  ([#19](https://github.com/sogaiu/tree-sitter-clojure/issues/19))
* Re-add binding.gyp

### v0.0.8 - 2021-03-17

* Upgrade tree-sitter to 0.19.3
* Add Cargo.toml
* Upgrade tree-sitter to 0.19.2
* Add generated bindings directory and content

### v0.0.7 - 2021-01-05

* CC0-1.0 ([#11](https://github.com/sogaiu/tree-sitter-clojure/issues/11))
* Tweak grammar.js

### v0.0.3 - 2020-10-30

* Add generated src directory and content
* Major renaming
* More fields
* Refine metadata bits
* Refine \_bare\_\* constructs usage
* Address discard / number parsing issue
  ([#7](https://github.com/sogaiu/tree-sitter-clojure/issues/7))
* Octal number tweak
* Restore visibility of comment nodes
* ?

### v0.0.2 - 2020-09-02

* Handle whitespace explicitly, no extras
* Start using some \_bare\_\* constructs
* ?

### v0.0.1 - 2020-07-05

* First tagging
