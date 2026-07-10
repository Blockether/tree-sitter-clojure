;; Clojure tags — definitions are recognised by the head symbol of a list form
;; (the sogaiu grammar parses everything as generic s-expressions).
;;
;; Rather than whitelist individual macros, any list whose head symbol begins
;; with `def` is treated as a definition. This catches clojure.core forms
;; (def, defn, defn-, defonce, defmacro, definline, ...), clojure.test and
;; testing macros (deftest, deftest-, defdescribe, defexpect, defspec, ...),
;; and project-specific def* macros (defdelegate, ...) alike.
;;
;; The `.` anchor between the head and the name pins the name to the symbol
;; *immediately* following the head, so body symbols are never mistaken for
;; definition names. Metadata (^:private, ^{:doc ...}) nests inside the name's
;; sym_lit, so it does not break the anchor.

;; Types: (defrecord Foo ...), (deftype ...), (defprotocol ...), (definterface ...)
((list_lit
   .
   (sym_lit name: (sym_name) @_head)
   .
   (sym_lit name: (sym_name) @name)) @definition.type
 (#any-of? @_head "defrecord" "deftype" "defprotocol" "definterface"))

;; Multimethods: (defmethod ...), (defmulti ...)
((list_lit
   .
   (sym_lit name: (sym_name) @_head)
   .
   (sym_lit name: (sym_name) @name)) @definition.method
 (#any-of? @_head "defmethod" "defmulti"))

;; Namespaces: (ns foo.bar ...)
((list_lit
   .
   (sym_lit name: (sym_name) @_head)
   .
   (sym_lit name: (sym_name) @name)) @definition.namespace
 (#eq? @_head "ns"))

;; Everything else whose head starts with `def` -> a named value/function
;; definition. Excludes the heads already captured as types or methods above.
((list_lit
   .
   (sym_lit name: (sym_name) @_head)
   .
   (sym_lit name: (sym_name) @name)) @definition.function
 (#match? @_head "^def")
 (#not-any-of? @_head
   "defrecord" "deftype" "defprotocol" "definterface"
   "defmethod" "defmulti"))
