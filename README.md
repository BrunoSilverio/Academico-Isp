# Academico.Isp

Programa em LISP para associar alunos e professores a disciplinas e a partir dessas associações responder a algumas questões.

### Exemplo
Supondo que o nosso programa chame-se Academico.lsp e que tenhamos criado o arquivo BD1.lsp, mostrado abaixo:

BD1.lsp

Cria uma versão inicial da BD acadêmica.

- (SETQ BD1 'NIL)
- (SETQ BD1 (MATRICULAR'(“João Paulo” “Ana Maria”)'(APC “Cálculo I”)BD1))
- (SETQ BD1 (VINCULAR '(“Daniele”)'(APC “Linguagens Formais”)BD1))
- (SETQ BD1 (VINCULAR '(Otávio)'(“Cálculo I”)  BD1 ))

#### Um exemplo de sessão no xlisp seria:
- (LOAD “Academico.lsp”) ;; carrega o programa de manutenção da BD
- (LOAD “BD1.lsp”) ;; carrega uma BD exemplo
...
- (DISCIPLINAS? BD1)(APC “Cálculo I” “linguagens Formais”)
...
- (MATRICULADOS? &#39;APC  DBAcad1) (“João Paulo” “Ana Maria”)
...
