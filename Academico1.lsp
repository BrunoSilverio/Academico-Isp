;--------------------------------FUNÇÕES ESPECIFICAS MATRICULAR-----------------------------------

;Matricula cada aluno da lista aluno em cada disciplina da lista de disciplinas (alunos ja matriculados não são matriculados 2 vezes)
;(IN ==> disciplinas -> lista de disciplinas nas quais aconteceram a matricula // alunos -> lista de alunos os quais serão matriculados // BD -> banco de dados)
;(OUT ==> Retorna Banco de dados(BD) atualizado)
(defun Matricular (alunos disciplinas BD)
	(if(null (car disciplinas)) ;verifica se chegou no fim da lista de disciplinas 
		BD
		(MatriculaAlunosEmDisciplina (car disciplinas) alunos(Matricular alunos (cdr disciplinas) BD)) ;matriculo lista de alunos a disciplina/referente a posição atual da lista de disciplinas 
	)
)
;Valida se disciplina existe ,se existir retornar BD com os alunos ja matriculados na disciplina se não cria novo registro de disciplina e matricula os alunos nele
;(IN ==> disciplina -> disciplina aonde os alunos serão matriculados // alunos -> lista de alunos que serão matriculados // BD -> banco de dados completo)
;(OUT ==> BD atualizado com os alunos da lista de alunos matriculados na respectiva disciplina que foi passada como parametro)
(defun MatriculaAlunosEmDisciplina (disciplina alunos BD)
	(if(null (car BD)) ;Valida se esta no fim dos registros
		(cons (cons nil nil) (cons disciplina (cons nil alunos))) ;cria nova disciplina com alunos ja matriculados
		(if (equal (cadr BD) disciplina) ;valida se encontrou a disciplina nos registros
			(cons (car BD) (cons disciplina (cons  ;Disciplina ja existente -> retorna lista com alunos que não estavam na lista matriculados
			(caddr BD) (MatriculaLista  alunos (cdddr BD)))))
			(cons (MatriculaAlunosEmDisciplina disciplina alunos (car BD)) (cdr BD)) ;Vai para proxima posição do registro criando oque ja existia		
		)
	)
)
;Retorna registro de disciplina atualizado com os alunos matriculados 
;(IN ==>  lista ->lista alunos quere serao matriculados //listamatriculados ->todo o registro da disciplina na qual ocorrerao a matriculas
;(OUT ==> lista de alunos da disciplina atualizada com as novas matriculas)
(defun MatriculaLista (lista listaMatriculados)
	(append listaMatriculados (FiltraLista lista listaMatriculados)) ;Matricula lista aluno ainda não existentes na disciplina
)

;----------------------------FIM FUNÇÕES ESPECIFICAS MATRICULAR-----------------------------------

;----------------------------FUNÇÕES ESPECIFICAS CANCELAR-MATRICULA-------------------------------

;Cancela matricula de todos os alunos da lista de alunos de todas as disciplinas da lista de disciplinas
;(IN ==> alunos -> lista alunos que serão desmatriculados // disciplinas -> lista disciplinas nas quais ocorrerao a desmatricula // BD-> banco de dados)
;(OUT ==> banco de dados (BD) atualizado com os alunos desmatriculados e matérias vazias removidas do registro)
(defun Cancelar-Matricula (alunos disciplinas BD)

	(VerificaDisciplinaVazia (LoopDesmatriculaDisciplina disciplinas alunos BD))
	
)

;Valida se disciplina existe , se exitir desmatricula todos os alunos da lista de alunos da disciplina correspondente
;(IN ==> disciplina -> disciplina a qual os alunos serão desmatriculados // alunos -> lista de alunos que serão desmatriculados // BD -> banco de dados completo)
;(OUT ==> BD atualizado com os alunos da lista de alunos desmatriculados da respectiva disciplina que foi passada como parametro)
(defun DesmatriculaAlunosEmDisciplina (disciplina alunos BD)

	(if(null (car BD)) ;Valida se esta no fim dos registros
		(cons nil nil) ;define o fim do banco de dados e retorna ele
		(if (equal (cadr BD) disciplina) ;valida se encontrou a disciplina nos registros
			(cons (car BD) (cons disciplina (cons  ;Disciplina existente  -> retorna lista atualizada com alunos desmatriculados 
			(caddr BD) (FiltraLista  (cdddr BD) alunos))))
			(cons (DesmatriculaAlunosEmDisciplina disciplina alunos (car BD)) (cdr BD)) ;Vai para proxima posição do registro criando oque ja existia		
		)
	)

)

;Percorre toda a lista de disciplinas desmatriculando a lista de alunos de cada uma delas
;(IN ==> disciplinas -> lista de disciplinas nas quais ocorrerão as desmatriculas // alunos -> Lista de alunos que serão desmatriculados // BD ->Banco de dados completo)
;(OUT ==> BD atualizado com todos os alunos da lista de alunos desmatriculados de todas as disciplinas da lista de disciplinas , porém não valida se existem disciplinas vazias)
(defun LoopDesmatriculaDisciplina (disciplinas alunos BD)

	(if(null (car disciplinas)) ;verifica se chegou no fim da lista de disciplinas 
		BD
		(DesmatriculaAlunosEmDisciplina (car disciplinas) alunos 
		(Cancelar-Matricula alunos (cdr disciplinas) BD)) ;desmatriculo lista de alunos a disciplina 
														  ;referente a posição atual da lista de disciplinas 
	)

)

;-------------------------FIM FUNÇÕES ESPECIFICAS CANCELAR-MATRICULA-------------------------------

;--------------------------------FUNÇÕES ESPECIFICAS VINCULAR---------------------------------

;Vincula cada professor da lista professor em cada disciplina da lista de disciplinas (professores ja vinculados não são vinculados 2 vezes)
;(IN ==> disciplinas -> lista de disciplinas nas quais aconteceram o vinculo  // professores -> lista de professores os quais serão vinculados // BD -> banco de dados)
;(OUT ==> Retorna Banco de dados(BD) atualizado)
(defun Vincular (professores disciplinas BD)

	(if(null (car disciplinas)) ;verifica se chegou no fim da lista de disciplinas 
		BD
		(VinculaProfessoresEmDisciplina (car disciplinas) professores 
		(Vincular professores (cdr disciplinas) BD)) ;vincula lista de professores a disciplina 
												  ;referente a posição atual da lista de disciplinas 
	)
)

;Valida se disciplina existe ,se existir retornar BD com os professores ja vinculados na disciplina se não cria novo registro de disciplina e vincula os professores nele
;(IN ==> disciplina -> disciplina aonde os professores serão vinculados // professores -> lista de professores que serão vinculados // BD -> banco de dados completo)
;(OUT ==> BD atualizado com os professores da lista de professores vinculados na respectiva disciplina que foi passada como parametro)
(defun VinculaProfessoresEmDisciplina (disciplina professores BD)

	(if(null (car BD)) ;Valida se esta no fim dos registros
		(cons (cons nil nil) (cons disciplina (cons professores nil))) ;cria nova disciplina com professores ja vinculados
		(if (equal (cadr BD) disciplina) ;valida se encontrou a disciplina nos registros
			(cons (car BD) (cons disciplina (cons  ;Disciplina ja existente -> retorna lista com professores que não estavam na lista vinculados
			(VinculaLista  professores (caddr BD)) (cdddr BD))))
			(cons (VinculaprofessoresEmDisciplina disciplina professores 
			(car BD)) (cdr BD)) ;Vai para proxima posição do registro criando oque ja existia		
		)
	)
)

;Retorna registro de disciplina atualizado com os professor vinculados
;(IN ==>  lista ->lista professores quere serao vinculados //listaVinculados ->todo o registro da disciplina na qual ocorrerao os vinculos
;(OUT ==> lista de professores da disciplina atualizada com os novos vinculos)
(defun VinculaLista (lista listaVinculados)
	
	(append listaVinculados (FiltraLista lista listaVinculados)) ;Vincula lista professor ainda não existentes na disciplina
	
)



;----------------------------FIM FUNÇÕES ESPECIFICAS VINCULAR--------------------------------------

;-----------------------------FUNÇÕES ESPECIFICAS REMOVER-VINCULO----------------------------------

;Cancela vinculo de todos os professores da lista de professores de todas as disciplinas da lista de disciplinas
;(IN ==> professores -> lista professores que serão desvinculados // disciplinas -> lista disciplinas nas quais ocorrerao a remoção dos vinculos // BD-> banco de dados)
;(OUT ==> banco de dados (BD) atualizado com os professores desvinculados e matérias vazias removidas do registro)
(defun Remover-Vinculo (professores disciplinas BD)

	(VerificaDisciplinaVazia (LoopDesvinculaDisciplina 
	disciplinas professores BD))
	
)

;Valida se disciplina existe , se exitir desvincula todos os professores da lista de professores da disciplina correspondente
;(IN ==> disciplina -> disciplina a qual os professores serão desvinculados // professores -> lista de professores que serão desvinculados // BD -> banco de dados completo)
;(OUT ==> BD atualizado com os professores da lista de professores desvinculados da respectiva disciplina que foi passada como parametro)
(defun DesvinculaProfessoresEmDisciplina (disciplina professores BD)

	(if(null (car BD)) ;Valida se esta no fim dos registros
		(cons nil nil) ;define o fim do banco de dados e retorna ele
		(if (equal (cadr BD) disciplina) ;valida se encontrou a disciplina nos registros
			(cons (car BD) (cons disciplina (cons  ;Disciplina existente  -> retorna lista atualizada com professores desvinculados
			 (FiltraLista  (caddr BD) professores)  (cdddr BD))))
			(cons (DesvinculaProfessoresEmDisciplina disciplina professores 
			(car BD)) (cdr BD)) ;Vai para proxima posição do registro criando oque ja existia		
		)
	)

)

;Percorre toda a lista de disciplinas desvinculando a lista de professores de cada uma delas
;(IN ==> disciplinas -> lista de disciplinas nas quais ocorrerão a remoção de vinculo // professores -> Lista de professores que serão desvinculados// BD ->Banco de dados completo)
;(OUT ==> BD atualizado com todos os professores da lista de professores desvinculados de todas as disciplinas da lista de disciplinas , porém não valida se existem disciplinas vazias)
(defun LoopDesvinculaDisciplina (disciplinas professores BD)

	(if(null (car disciplinas)) ;verifica se chegou no fim da lista de disciplinas 
		BD
		(DesvinculaProfessoresEmDisciplina (car disciplinas) professores
		(Remover-Vinculo professores (cdr disciplinas) BD)) ;desmatriculo lista de professores a disciplina 
														  ;referente a posição atual da lista de disciplinas 
	)

)

;-------------------------FIM FUNÇÕES ESPECIFICAS REMOVER-VINCULO----------------------------------

;---------------------------------------INICIO PRINTS----------------------------------------------

;--------------------------FUNÇÕES ESPECIFICAS ALUNOS?---------------------------------------------
;printa o nome de todos os alunos matriculados sem repetição
;(IN ==> BD -> banco de dados)
;(OUT ==> lista contendo o nome de todos os alunos matriculados sem repetição de nomes)
(defun Alunos? (BD)

	(RemoveIguais (CriaListaComTodosAlunos BD))

)
;Concatena todas listas de alunos de todas as disciplinas , criando apenas uma lista com todos os nomes (pode haver nomes iguais referentes ao mesmo aluno)
;(IN ==> BD ->banco de dados)
;(OUT ==> Lista contendo todos os nomes dos alunos matriculados em todas as disciplinas)
(defun CriaListaComTodosAlunos (BD)

		(if (null (car BD)) ;verifica se chegou no final do banco de dados(BD)
			nil
			(append (cdddr BD) (CriaListaComTodosAlunos (car BD))) ;vai para proxima posição concatenando toda a lista de alunos 
		)
	
	
)

;----------------------FIM FUNÇÕES ESPECIFICAS ALUNOS?----------------------------------------------

;--------------------------FUNÇÕES ESPECIFICAS PROFESSORES?---------------------------------------------
;printa o nome de todos os professores vinculados sem repetição
;(IN ==> BD -> banco de dados)
;(OUT ==> lista contendo o nome de todos os professores vinculados sem repetição de nomes)
(defun Professores? (BD)

	(RemoveIguais (CriaListaComTodosProfessores BD))

)
;Concatena todas listas de professores de todas as disciplinas , criando apenas uma lista com todos os nomes (podera haver nomes iguais referentes ao mesmo aluno)
;(IN ==> BD ->banco de dados)
;(OUT ==> Lista contendo todos os nomes dos professores vinculados em todas as disciplinas)
(defun CriaListaComTodosProfessores (BD)

		(if (null (car BD)) ;verifica se chegou no final do banco de dados(BD)
			nil
			(append (caddr BD) (CriaListaComTodosProfessores (car BD))) ;vai para proxima posição concatenando toda a lista de professores
		)
	
	
)

;----------------------FIM FUNÇÕES ESPECIFICAS PROFESSORES?----------------------------------------------

;Imprime todas as disciplinas registradas no banco de dados 
;(IN ==> BD ->banco de dados)
;(OUT ==> Lista de todas as disciplinas cadastradas em todo o banco de dados (BD))
(defun Disciplinas? (BD)

	(if (null (car BD)) ;verifica se chegou no final dos registros
		nil
		(cons (cadr BD) (Disciplinas? (car BD)))
	)

)

;Imprime todos os alunos matriculados em uma disciplinas
;(IN ==> disciplina -> disciplina a qual se deseja printar os alunos matriculados // BD-> banco de dados)
;(OUT ==> Lista contendo todos os alunos matriculados na disciplina digitada pelo usuario,se não houver alunos matriculados , retorna nil e se a disciplina
;não existir nos registro retorna uma mensagem indicativa)
(defun Matriculados? (disciplina BD)

	(if (null (car BD)) ;verifica se chegou no final dos registros
		'(Disciplina Nao Cadastrada) ;mensagem indiciatvia que a disciplinao foi encontrada nos registros
		(if (equal disciplina (cadr BD)) ;verifica se disciplina dada pelo usuario  é igual a disciplina corresponde a posição atual
			(cdddr BD)	; se for ->retorna lista de alunos matriculados na disciplina 
			(Matriculados? disciplina (car BD)) ; se não for -> vai para proxima posição
		)
	)

)
;Imprime todos os professores matriculados em uma disciplina
;(IN ==> disciplina -> disciplina a qual se deseja printar os professores vinculados // BD-> banco de dados)
;(OUT ==> Lista contendo todos os professores vinculados  na disciplina digitada pelo usuario,se não houver professores vinculados , retorna nil e se a disciplina
;não existir nos registro retorna uma mensagem indicativa)
(defun Vinculados? (disciplina BD)

	(if (null (car BD)) ;verifica se chegou no final dos registros
		'(Disciplina Nao Cadastrada) ;mensagem indiciatvia que a disciplinao foi encontrada nos registros
		(if (equal disciplina (cadr BD)) ;verifica se disciplina dada pelo usuario  é igual a disciplina corresponde a posição atual
			(caddr BD)	; se for ->retorna lista de professores vinculados a disciplina
			(Vinculados? disciplina (car BD)) ; se não for -> vai para proxima posição
		)
	)

)


;Imprime todas as disciplinas as quais um aluno esta matriculado(cursa)
;(IN ==> aluno -> aluno o qual se deseja printar todas as disciplinas que ele esta matriculado(cursa))
;(OUT ==> Lista de materias as quais o aluno está matriculado ou nil se o aluno não existir nos registros)
(defun Cursa? (aluno BD)

	(if (null (car BD)) ;verifica se chegou no final dos registros
		nil 
		(if (equal 1 (BuscaPessoaEmDisciplina aluno (cdddr BD))) ; busca aluno digitado pelo usuario na lista de alunos da disciplina correspondente a posição atual do bando de dados(BD)
			(cons (cadr BD) (Cursa? aluno (car BD))) ; se aluno for encontrado ->vai gerando lista com os nomes das disciplinas que o aluno cursa e vai para proxima posição do bando de dados(BD)
			(Cursa? aluno (car BD)) ;se aluno não for encontrado -> vai para proxima posição sem colocar o nome da disciplina correspondente a posição atual do bando de dados na lista que sera retornada
		)
	)

)


;Imprime todas as disciplinas as quais o professor esta vinculado(ministra)
;(IN ==> professor -> professor o qual se deseja printar todas as disciplinas que ele esta vinculado(ministra))
;(OUT ==> Lista de materias as quais o professor está vinculado ou nil se o professor não existir nos registros)
(defun Ministra? (professor BD)

	(if (null (car BD)) ;verifica se chegou no final dos registros
		nil 
		(if (equal 1 (BuscaPessoaEmDisciplina professor (caddr BD))) ; busca professor digitado pelo usuario na lista de professors da disciplina correspondente a posição atual do banco de dados(BD)
			(cons (cadr BD) (Ministra? professor (car BD))) ; se professor for encontrado ->vai gerando lista com os nomes das disciplinas que o professor ministra e vai para proxima posição do bando de dados(BD)
			(Ministra? professor (car BD)) ;se professor não for encontrado -> vai para proxima posição sem colocar o nome da disciplina correspondente a posição atual do bando de dados na lista que sera retornada
		)
	)

)
;---------------------------------------FIM PRINTS-------------------------------------------------

;------------------------------------FUNÇÕES GENERICAS---------------------------------------------

;Filtra alunos/professor iguais e retorna a lista filtrada
;(IN ==> lista -> lista alunos/professores que serao matriculados/vinculados // listaMatriculados -> lista dos alunos/professores ja matriculados/vinculados )
;(OUT ==> lista de alunos/professores que serao matriculados/vinculados filtrada para que não ocorra matriculas/vinculos iguais)
(defun FiltraLista (lista listaMatriculados)
	
	(RetornaListaFiltrada (LoopPrimarioMarcaIgual lista listaMatriculados))

)

;Percorre toda lista1 passando cada componente para a função LoopSecundarioMarcaIgual e retorna listanaofiltrada [FUNÇÃO CRIADA PARA USO CONJUNTO DE 'LoopSecundarioMarcaIgual']
;(IN ==> lista1 -> lista que sera validada para a matricula // lista2 -> lista de pessoas ja matriculadas que servira de comparativo para a validação)
;(OUT ==> OUT da função LoopSecundarioMarcaIgual
(defun LoopPrimarioMarcaIgual (lista1 lista2)

	(if (null (car lista1)) ; verifica se chegou no fim da lista1
		nil ;cheguei no fim da lista1	
		(cons(LoopSecundarioMarcaIgual (car lista1) lista2)(LoopPrimarioMarcaIgual
		(cdr lista1) lista2)) ;cria um cons com car sendo o valor retornado pela função LoopSecundarioMarcaIgual
							  ;e o cdr sendo o valor retornada pela chamada recursiva de LoopPrimarioFiltra
							  ;indo para a proxima posição de lista 1
	)

)

;Percorre toda lista2 comparando cada componente com o componente da lista1  [FUNÇÃO CRIADA PARA USO CONJUNTO DE 'LoopPrimarioFiltra']
;(IN ==> componenteLista1 -> componente referente a uma posição da lista1 // lista2 -> lista de pessoas ja matriculadas que servira de comparativo para a validação)
;(OUT ==> lista contendo 2 possiblidades de valores para as posições 
		;1)valor = 0 ->pessoa da lista1 existem na lista2
		;2)valor = nome da pessoa  -> pessoa da lista1 não existe na lista2	
(defun LoopSecundarioMarcaIgual (componenteLista1 lista2)

	(if (null (car lista2)) ;verifica se chegou no fim da lista 2
		componenteLista1 ;retorna aluno ainda nao cadastrado
		(if (equal componenteLista1 (car lista2)) ;verifica se o car da posição atual da lista 2 é igual ao componente da lista 1
			0 ;valor de controle
			(LoopSecundarioMarcaIgual componenteLista1 (cdr lista2)) ; vai para proxima posição da lista 2 para continuar a validação
		)
	
	)


)

;Filtra os valores 0 de uma lista retornada por LoopPrimarioFiltra [FUNÇÃO CRIADA PARA USO CONJUNTO DE 'LoopPrimarioFiltra']
;(IN ==> listaNaoFiltrada -> lista composta por nome de pessoas e 0)
;(OUT ==> lista filtrada apenas com os nomes das pessoas)
(defun RetornaListaFiltrada (listaNaoFiltrada)
	
	(if (not(null (car listaNaoFiltrada))) ;verifica se nao chegou no fim da lista
		(if (not (equal (car listaNaoFiltrada) 0)) ;verifica se o valor na posição atual não é o valor de controle '0' 
			(cons (car listaNaoFiltrada) (RetornaListaFiltrada (cdr listaNaoFiltrada))) ;se não for '0' cria um cons com car sendo 
																					    ;a posição da lista e o cdr o retorno da função para a proxima posição da lista
			(if (null (cadr listaNaoFiltrada)) ;se for igual valida se existe proxima posição
				nil	 ;se não existir retorna nil
				(RetornaListaFiltrada (cdr listaNaoFiltrada)) ;se existir vai para a proxima posição
			)
		)
	)
	
)

;Refaz o banco de dados(BD) retirando todas as disciplinas vazias do bando de dados(BD)
;(IN ==> BD -> banco de dados completo)
(defun VerificaDisciplinaVazia (BD)

	(if (null (car BD)) ;valida se chegou no final do banco de dados
		(cons nil nil);define o fim do banco de dados (BD)
		(if (equal (cddr BD) '(nil)) ; valida se disciplina correspondente a posição atual de BD está vazia 
			(VerificaDisciplinaVazia (car BD)) ;disciplina vazia -> vai para a proxima posição sem recriar a posição vazia
			(cons (VerificaDisciplinaVazia (car BD)) (cdr BD)) ;disciplina não vazia -> vai para a proxima posição recriando posição atual
		)
	)

)

;Busca se um aluno/professor esta matriculado/vinculado a uma disciplina
;(IN ==> pessoa -> aluno/professor que sera buscado nos registros de uma disciplina // listaPessoasRegistradas -> lista de alunos/professor aonde o aluno/professor sera buscado)
;(OUT ==>  0 -> aluno/professor não matriculado/vinculado a disciplina
;		   1 -> aluno/professor matriculado/vinculado a disciplina)
(defun BuscaPessoaEmDisciplina (pessoa listaPessoasRegistradas)

	(if (null (car listaPessoasRegistradas)) ;verifica se não chegou no fim da lista de pessoas registradas na disciplina
		0 ; se chegou no fim , significa que não encontrou a pessoa na disciplina 
		(if (equal pessoa (car listaPessoasRegistradas)) ;verifica se a pessoa correspondente a posição atual da lista de pessoas registradas na disciplina não é a pessoa que esta sendo buscada
			1 ; se for , retorna 1 indicando que a pessoa está presente nos registros da disciplina
			(BuscaPessoaEmDisciplina pessoa (cdr listaPessoasRegistradas)) ;se não , vai para a proxima posição
		)
	)

)

;Remove todos elementos iguais de uma lista
;(IN ==> lista -> lista a qual sera feita o processo de remoção de elemento iguais)
;(OUT ==> lista sem nenhum elemento igual)
(defun RemoveIguais (lista)

	(if (null (car lista)) ;verifica se chegou no final da lista
		nil
		(if (equal 1 (BuscaPessoaEmDisciplina (car lista) (cdr lista))) ;valida se a pessoa da posição atual da lista se encontra novamente no resto da mesma lista
			(RemoveIguais (cdr lista)) ; se existir no resto da mesma lista ,vai para a proxima posição
			(cons (car lista) (RemoveIguais (cdr lista))) ;se não vai criando lista com as pessoas que foram encontradas apenas uma vez na lista e vai para a proxima posição
		)
	)

)
;-----------------------------------------FIM FUNÇÕES GENERICAS-----------------------------------
