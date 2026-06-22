;; Clojure tags — definitions are recognised by the head symbol of a list form
;; (the sogaiu grammar parses everything as generic s-expressions).

((list_lit
   .
   (sym_lit name: (sym_name) @_head)
   (sym_lit name: (sym_name) @name)) @definition.function
 (#any-of? @_head "defn" "defn-" "defmacro" "definline"))

((list_lit
   .
   (sym_lit name: (sym_name) @_head)
   (sym_lit name: (sym_name) @name)) @definition.method
 (#any-of? @_head "defmethod" "defmulti"))

((list_lit
   .
   (sym_lit name: (sym_name) @_head)
   (sym_lit name: (sym_name) @name)) @definition.type
 (#any-of? @_head "defrecord" "deftype" "defprotocol" "definterface"))

((list_lit
   .
   (sym_lit name: (sym_name) @_head)
   (sym_lit name: (sym_name) @name)) @definition.namespace
 (#eq? @_head "ns"))
