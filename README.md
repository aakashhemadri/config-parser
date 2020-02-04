# yet another config parser

| Type     | Lexeme                           |
| -------- | -------------------------------- |
| COMMENT  | `# This is a commment`           |
| RESOURCE | `screen` resolution 1920*1024    |
| ARG      | screen `resolution` 1920*1024    |
| MODIFIER | screen resolution `1920*1024`    |
| --       | --                               |
| SET      | set                              |
| VAR      | [_a-zA-Z] [_a-zA-Z0-9]*          |
| VAL      | All characters except whitespace |

## Constraints
- Define `SET` before `RESOURCE`
  
## Future features
- Recursive variable substitution
- includes
- syntax highligthing