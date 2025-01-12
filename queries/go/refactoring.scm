;; Grabs all the local variable declarations.  This is useful for scope
;; variable passing.  Which variables do we need to pass to the extracted
;; function?
((short_var_declaration
 (expression_list
   (identifier) @definition.local_name)))
((var_declaration
 (var_spec
   (identifier) @definition.local_name)))

;; grabs all the arguments that are passed into the function.  Needed for
;; function extraction, 106
(function_declaration
   parameters: (parameter_list
   (parameter_declaration
   (identifier) @definition.function_argument)))
(method_declaration
   parameters: (parameter_list
   (parameter_declaration
   name: (identifier) @definition.function_argument)))

(function_declaration) @definition.scope
(method_declaration) @definition.scope

(block) @definition.block

(short_var_declaration) @definition.statement
(return_statement) @definition.statement
(if_statement) @definition.statement
(for_statement) @definition.statement
(call_expression) @definition.statement

(method_declaration
   receiver: (parameter_list) @definition.class_name)
(method_declaration
   receiver: (parameter_list
   (parameter_declaration
   name: (identifier) @definition.class_type)))
