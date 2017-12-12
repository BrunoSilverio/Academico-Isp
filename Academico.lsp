;[Projeto Lisp]
;Arquivo contendo as funcoes implementadas

;---------------------------------------------------------------------------------------------------------------
;INICIO[MATRICULAR ALUNOS]
(defun MATRICULAR (ALUNOS DISCIPLINAS BD)
	(if(null (car DISCIPLINAS)) 
		BD
		(MATRICULARALUNOSDISCIPLINAS (car DISCIPLINAS) ALUNOS 
		(MATRICULAR ALUNOS (cdr DISCIPLINAS) BD)) 
	)
)

(defun MATRICULARALUNOSDISCIPLINAS (DISCIPLINAS ALUNOS BD)
	(if (null (car BD)) 
		(cons (cons nil nil) (cons DISCIPLINAS (cons nil ALUNOS)))
		(if (equal (cadr BD) DISCIPLINAS) 
			(cons (car BD) (cons DISCIPLINAS (cons (caddr BD) 
			(MATRICULARLISTA  ALUNOS (cdddr BD)))))
			(cons (MATRICULARALUNOSDISCIPLINAS DISCIPLINAS 
			ALUNOS (car BD)) (cdr BD))	
		)
	)
)

(defun MATRICULARLISTA (LISTA LISTAMATRICULADOS)
	(append LISTAMATRICULADOS (FILTALISTA LISTA LISTAMATRICULADOS)) 
)
;FIM[MATRICULAR ALUNOS]
;---------------------------------------------------------------------------------------------------------------
;INICIO[VINCULAR PROFESSORES]
(defun VINCULAR (PROFESSORES DISCIPLINAS BD)
	(if(null (car DISCIPLINAS))
	BD
	(VINCULARPROFESSORESDISCIPLINAS (car DISCIPLINAS) PROFESSORES
	(VINCULAR PROFESSORES (cdr DISCIPLINAS) BD))
	)
)

(defun VINCULARPROFESSORESDISCIPLINAS (DISCIPLINAS PROFESSORES BD)
	(if (null (car BD))
		(cons (cons nil nil) (cons DISCIPLINAS (cons PROFESSORES nil)))
		(if (equal (cadr BD) DISCIPLINAS)
			(cons (car BD) (cons DISCIPLINAS (cons 
			(VINCULARLISTA PROFESSORES (caddr BD)) (cdddr BD))))
			(cons VINCULARPROFESSORESDISCIPLINAS DISCIPLINAS 
			PROFESSORES (car BD)) (cdr BD))
		)
	)
)

(defun VINCULARLISTA (LISTA LISTAVINCULAR)
	(append LISTAVINCULAR (FILTRALISTA LISTA LISTAVINCULAR))
)
;FIM[VINCULAR PROFESSORES]
;---------------------------------------------------------------------------------------------------------------
 ;INICIO[LISTA ALUNOS]
(defun ALUNOS? (BD)
	(if (null (car BD)) 
	nil
	(append (cdddr BD) (ALUNOS? (car BD))) 
	)
)
;FIM[LISTA ALUNOS]
;---------------------------------------------------------------------------------------------------------------
;INICIO[LISTA PROFESSORES]
(defun PROFESSORES? (BD) 
	(if(null(car BD))
	nil
	(append (caddar BD) (PROFESSORES?(car BD)))
	)
)
;FIM[LISTA PROFESSORES]
;---------------------------------------------------------------------------------------------------------------
;INICIO[LISTA DISCIPLINAS]
(defun DISCIPLINAS? (BD)
	(if(null(car BD))
	nil
	(append (caar BD) (DISCIPLINAS?(car BD)))
	)
)
;FIM[LISTA DISCIPLINAS]
;---------------------------------------------------------------------------------------------------------------
;INICIO[FILTAR LISTA]
(defun FILTRA

)
;FIM[FILTAR LISTA]
;---------------------------------------------------------------------------------------------------------------