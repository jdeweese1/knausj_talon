mode: command
and mode: user.terraform
mode: command
and mode: user.auto_lang
and code.language: terraform
-
tag(): user.code_operators
tag(): user.code_comment
tag(): user.code_generic
settings():
    user.code_private_function_formatter = "SNAKE_CASE"
    user.code_protected_function_formatter = "SNAKE_CASE"
    user.code_public_function_formatter = "SNAKE_CASE"
    user.code_private_variable_formatter = "SNAKE_CASE"
    user.code_protected_variable_formatter = "SNAKE_CASE"
    user.code_public_variable_formatter = "SNAKE_CASE"
    user.code_resource_variable_formatter = "SNAKE_CASE"

#terraform-specific grammars
dunder in it: "__init__"
state (def | deaf | deft): "def "
state except: "except "
state raise: "raise "
self taught: "self."
pie test: "pytest"
state past: "pass"

^state resource <user.text>$: user.code_default_function(text)
^state provider <user.text>$: user.code_private_function(text)
^pub funky <user.text>$: user.code_public_function(text)
#^static funky <user.text>$: user.code_private_static_function(text)
#^pro static funky <user.text>$: user.code_protected_static_function(text)
#^pub static funky <user.text>$: user.code_public_static_function(text)
raise {user.terraform_exception}: user.insert_cursor("raise {terraform_exception}([|])")
except {user.terraform_exception}: "except {terraform_exception}:"



dock {user.terraform_docstring_fields}:
    insert("{terraform_docstring_fields}")
    edit.left()
dock type {user.code_type}:
    user.insert_cursor(":type [|]: {code_type}")
dock returns type {user.code_type}:
    user.insert_cursor(":rtype [|]: {code_type}")
toggle imports: user.code_toggle_libraries()
import <user.code_libraries>:
    user.code_insert_library(code_libraries, "")
    key(end enter)
