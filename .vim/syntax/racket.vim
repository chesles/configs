" Vim syntax file
" Language:	Racket (based on Scheme)
" Last Change:	3 February 2011
" Maintainer:	Alex Esplin

" bail if something has already defined our syntax
if exists("b:current_syntax")
    echo "bailing from racket.vim..."
    finish
endif

setlocal iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_

" comments
syn match racketComment ";.*$" contains=racketToDo
syn match racketHeaderComment ";;.*$" contains=racketToDo

" numbers
syn match racketNum "\<\d\+\>"
syn match racketNum "\<\d\+\.\d\+\>"

" symbols
syn match racketSymbol "\<'[a-zA-Z0-9+-/*%]\+\>"
"syn region racketSymbol start="'" end=" "

" strings
syn region racketString start='"' end='"'

" Enable todo highlighting
syn keyword racketToDo contained TODO FIXME NOTE

" Racket keywords (syntax)
syn keyword racketSyntax lambda and or if cond case type-case define define-type let let* letrec

" we'll color our parens, brackets, and braces, just for fun (and easy
" spotting)
syn match racketDelim "[\[\({}\)\]]"

" Racket keywords (functions)
syn keyword racketFunc not boolean? eq? eqv? equal? pair? cons car cdr set-car!
syn keyword racketFunc set-cdr! caar cadr cdar cddr caaar caadr cadar caddr
syn keyword racketFunc cdaar cdadr cddar cdddr caaaar caaadr caadar caaddr
syn keyword racketFunc cadaar cadadr caddar cadddr cdaaar cdaadr cdadar cdaddr
syn keyword racketFunc cddaar cddadr cdddar cddddr null? list? list length listof
syn keyword racketFunc append reverse list-ref memq memv member assq assv assoc
syn keyword racketFunc symbol? symbol->string string->symbol number? complex?
syn keyword racketFunc real? rational? integer? exact? inexact? = < > <= >=
syn keyword racketFunc zero? positive? negative? odd? even? max min + * - / abs
syn keyword racketFunc quotient remainder modulo gcd lcm numerator denominator
syn keyword racketFunc floor ceiling truncate round rationalize exp log sin cos
syn keyword racketFunc tan asin acos atan sqrt expt make-rectangular make-polar
syn keyword racketFunc real-part imag-part magnitude angle exact->inexact
syn keyword racketFunc inexact->exact number->string string->number char=?
syn keyword racketFunc symbol=? boolean=? string=?
syn keyword racketFunc char-ci=? char<? char-ci<? char>? char-ci>? char<=?
syn keyword racketFunc char-ci<=? char>=? char-ci>=? char-alphabetic? char?
syn keyword racketFunc char-numeric? char-whitespace? char-upper-case?
syn keyword racketFunc char-lower-case?
syn keyword racketFunc char->integer integer->char char-upcase char-downcase
syn keyword racketFunc string? make-string string string-length string-ref
syn keyword racketFunc string-set! string=? string-ci=? string<? string-ci<?
syn keyword racketFunc string>? string-ci>? string<=? string-ci<=? string>=?
syn keyword racketFunc string-ci>=? substring string-append vector? make-vector
syn keyword racketFunc vector vector-length vector-ref vector-set! procedure?
syn keyword racketFunc apply map for-each call-with-current-continuation
syn keyword racketFunc call-with-input-file call-with-output-file input-port?
syn keyword racketFunc output-port? current-input-port current-output-port
syn keyword racketFunc open-input-file open-output-file close-input-port
syn keyword racketFunc close-output-port eof-object? read read-char peek-char
syn keyword racketFunc write display newline write-char call/cc
syn keyword racketFunc list-tail string->list list->string string-copy
syn keyword racketFunc string-fill! vector->list list->vector vector-fill!
syn keyword racketFunc force with-input-from-file with-output-to-file
syn keyword racketFunc char-ready? load transcript-on transcript-off eval
syn keyword racketFunc dynamic-wind port? values call-with-values
syn keyword racketFunc scheme-report-environment null-environment
syn keyword racketFunc interaction-environment
syn keyword racketFunc make-eq-hashtable make-eqv-hashtable make-hashtable
syn keyword racketFunc hashtable? hashtable-size hashtable-ref hashtable-set!
syn keyword racketFunc hashtable-delete! hashtable-contains? hashtable-update!
syn keyword racketFunc hashtable-copy hashtable-clear! hashtable-keys
syn keyword racketFunc hashtable-entries hashtable-equivalence-function hashtable-hash-function
syn keyword racketFunc hashtable-mutable? equal-hash string-hash string-ci-hash symbol-hash 
syn keyword racketFunc find for-all exists filter partition fold-left fold-right
syn keyword racketFunc remp remove remv remq memp assp cons*
syn keyword racketFunc test 

" test/exn, define-type, type-case and other odd cases
syn match racketFunc "\<test/exn\>"
syn match racketSyntax "\<define-type\>"
syn match racketSyntax "\<type-case\>"

" Make it happen
hi def link racketNum               Constant
hi def link racketComment           Comment
hi def link racketHeaderComment     SpecialComment
hi def link racketSymbol            Constant
hi def link racketString            Constant
hi def link racketToDo              Todo
hi def link racketSyntax            Statement
hi def link racketFunc              Function
hi def link racketDelim             PreProc

let b:current_syntax = "racket"

