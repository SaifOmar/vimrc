(directive) @function
(directive_start) @function
(directive_end) @function
(comment) @comment
(bracket_start) @function
(bracket_end) @function
(parameter) @include
; ((parameter) @include (#set! "priority" 110)) 
; ((parameter) @include (#set! "priority" 110)) 
; ((php_only) @include (#set! "priority" 110)) 
; ((bracket_start) @function (#set! "priority" 120)) 
; ((bracket_end) @function (#set! "priority" 120)) 
(keyword) @function
