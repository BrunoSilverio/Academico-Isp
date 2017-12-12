#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <windows.h>

struct TipoAluno //struct Aluno
{
	char nome[50];
	int  ra;
};

struct TgerenciaAlu //struct para Gerenciar o numero de ALunos
{
	TipoAluno aluno[10];
	int    numAlu;
};

struct TipoProfessor //struct Professor
{
	char nome[50];
	int codProfessor;
};

struct TgerenciaProf //struct para Gerenciar o numero de professores
{
	TipoProfessor professor[10];
	int numProf;
};

struct TipoDisciplina //struct Disciplina
{
	char nome[50];
	int codDisciplina;
};

struct TgerenciaDisc //struct para Gerenciar o numero de disciplinas
{
	TipoDisciplina disciplina[10];
	int numDisc;
};

struct Matricular1 //struct para guardar dados da matricula do aluno
{
	int ra;
	int codDisc1;
};

struct Matricular2 //struct para guardar dados da matricula do professor
{
	int codProf;
	int codDisc2;
};

struct TgerenciaMatricula //struct para gerenciar as matriculas
{
	TgerenciaDisc disciplinas[10];
	TgerenciaAlu alunos[10];
	Matricular1 vetorMatricula1[100];
	Matricular2 vetorMatricula2[100];
	int Controle;
	int guardaRA[10];
	int guardaCodDisc[10];
	int guardaCodProf[10];
};

TgerenciaAlu cadastroAlu(TgerenciaAlu gerenciaA); //funcao para cadastro de alunos
TgerenciaAlu exibirAlunos(TgerenciaAlu gerenciaAlunos); //funcao para exibir alunos cadastrados no sistema

TgerenciaDisc cadastroDisc(TgerenciaDisc gerenciaD); //funcao para cadastro de Disciplina
TgerenciaDisc exibirDisc(TgerenciaDisc gerenciaDisciplinas); //funcao para exibir disciplinas cadastrados no sistema

TgerenciaProf cadastroProf(TgerenciaProf gerenciaP); //funcao para cadastro de professor
TgerenciaProf exibirProf(TgerenciaProf gerenciaProfessor); //funcao para exibir professores cadastrados no sistema

TgerenciaMatricula matriculaAlu(TgerenciaMatricula gerenciaMatri, TgerenciaAlu alu, TgerenciaDisc disc); //funcao para matricula de aluno
TgerenciaMatricula exibirMatriculaAlu(TgerenciaMatricula gerenciaMatricula, TgerenciaAlu aluno, TgerenciaDisc disciplina); //funcao para exibir matriculas de alunos em disciplinas

TgerenciaMatricula exibirMatriculaDiscAlu(TgerenciaMatricula gerenciaMatricula, TgerenciaAlu aluno, TgerenciaDisc disciplina); //funcao para exibir matriculas de alunos nas disciplinas 
TgerenciaMatricula exibirMatriculaDiscProf(TgerenciaMatricula gerenciaMatricula, TgerenciaProf professor, TgerenciaDisc disciplina); //funcao para exibir matriculas de professores em disciplinas

TgerenciaMatricula matriculaProf(TgerenciaMatricula gerenciaMatri, TgerenciaProf prof, TgerenciaDisc disc); //funcao para matricula de professor
TgerenciaMatricula exibirMatriculaProf(TgerenciaMatricula gerenciaMatricula, TgerenciaProf professor, TgerenciaDisc disciplina); //funcao para exibir matriculas de professores em disciplinas

TgerenciaMatricula CancelaMatricula(TgerenciaMatricula gerenciaMatricula); //funcao para cancelar matricula de aluno em disciplina

void main()
{
	//declaração de variaveis para as structs
	TgerenciaAlu gerenciaA;
	TgerenciaDisc gerenciaD;
	TgerenciaProf gerenciaP;
	TgerenciaMatricula gerenciaMatri;

	int opcao = 0, i = 0, j = 0, k = 0;
	char mais;

	gerenciaA.numAlu = 0; //inicia o numero de aluno  = 0
	gerenciaD.numDisc = 0;
	gerenciaP.numProf = 0;
	gerenciaMatri.Controle = 0;

	system("cls");

	do
	{
		system("cls");
		printf("\t<PROJETO EM C [SISTEMA ESCOLAR]>");
		printf("\n\n1 - <Cadastrar Aluno>"); //ok
		printf("\n2 - <Cadastrar Disciplina>"); //ok
		printf("\n3 - <Cadastrar Professor>"); //ok
		printf("\n4 - <Realizar Matricula>"); //ok
		printf("\n5 - <Cancelar Matricula>"); //
		printf("\n6 - <Vincular professores a disciplinas>"); //ok
		printf("\n7 - <Imprimir Lista de Alunos>"); //ok
		printf("\n8 - <Imprimir Lista de Disciplinas>"); //ok
		printf("\n9 - <Imprimir Lista de Professores>"); //ok
		printf("\n10 - <Imprimir a lista de disciplinas de um aluno>");//ok
		printf("\n11 - <Imprimir a lista de alunos em uma disciplina>"); //ok
		printf("\n12 - <Imprimir a lista de todas as disciplinas ministradas por um professor>"); //ok
		printf("\n13 - <Imprimir a lista de todos os professores vinculados a uma disciplina>"); //ok
		printf("\n0 - <Sair>");

		printf("\n\n<Opcao>> ");
		scanf("%i", &opcao);

		system("cls");

		switch (opcao)
		{
			//CADASTRO ALUNO
		case 1:
			printf("\t1 - <CADASTRAR ALUNO>");
			do
			{
				printf("\n");
				printf("\n");
				printf("==> Aluno [%i]\n", i + 1);
				gerenciaA = cadastroAlu(gerenciaA);
				i++;
				printf("\nDeseja cadastrar outro aluno? (s \\ n)\n");
				fflush(stdin);
				scanf("%c", &mais);
			} while (mais == 's');
			break;

			//CADASTRO DISCIPLINA
		case 2:
			printf("\t2 - <CADASTRAR DISCIPLINA>");
			do
			{
				printf("\n");
				printf("\n");
				printf("==> Disciplina [%i]\n", j + 1);
				gerenciaD = cadastroDisc(gerenciaD);
				j++;
				printf("\nDeseja cadastrar outra Disciplina? (s \\ n)\n");
				fflush(stdin);
				scanf("%c", &mais);
			} while (j < 10 && mais != 'n');
			break;

			//CADASTRO PROFESSOR
		case 3:
			printf("\t3 - <CADASTRAR PROFESSOR>");
			do
			{
				printf("\n");
				printf("\n");
				printf("==> Professor [%i]\n", k + 1);
				gerenciaP = cadastroProf(gerenciaP);
				k++;
				printf("\nDeseja cadastrar outro Professor? (s \\ n)\n");
				fflush(stdin);
				scanf("%c", &mais);
			} while (k < 10 && mais != 'n');
			break;

			//MATRICULA ALUNO, DISCIPLINA
		case 4:
			printf("\t4 - <REALIZAR MATRICULA (ALuno/Disciplina)>");
			printf("\n");
			printf("\n");
			gerenciaMatri = matriculaAlu(gerenciaMatri, gerenciaA, gerenciaD);
			break;

			//CANCELAR MATRICULA ALUNO, DISCIPLINA
		case 5:
			printf("\t5 - <CANCELAR MATRICULA>");
			printf("\n");
			printf("\n");
			gerenciaMatri = CancelaMatricula(gerenciaMatri);
			break;

			//MATRICULA PROFESSOR, DISCIPLINA
		case 6:
			printf("\t6 - <VINCULAR PROFESSORES A DISCIPLINAS>");
			printf("\n");
			printf("\n");
			gerenciaMatri = matriculaProf(gerenciaMatri, gerenciaP, gerenciaD);
			break;

			//IMPRIMI LISTA DE ALUNOS
		case 7:
			printf("\t7 - <LISTA DE ALUNOS>\n");
			printf("\n");
			printf("\n");
			gerenciaA = exibirAlunos(gerenciaA);
			system("pause");
			break;

			//IMPRIMI LISTA DE DISCIPLINAS
		case 8:
			printf("\t8 - <LISTA DE DISCIPLINAS>");
			printf("\n");
			printf("\n");
			gerenciaD = exibirDisc(gerenciaD);
			system("pause");
			break;

			//IMPRIMI LISTA DE PROFESSORES
		case 9:
			printf("\t9 - <LISTA DE PROFESSORES>");
			printf("\n");
			printf("\n");
			gerenciaP = exibirProf(gerenciaP);
			system("pause");
			break;

			//IMPRIMI LISTA DE DISCIPLINAS DE UM ALUNO
		case 10:
			printf("\t10 - <LISTA DE DISCIPLINAS DE UM ALUNO>");
			do
			{
				printf("\n");
				printf("\n");
				gerenciaMatri = exibirMatriculaAlu(gerenciaMatri, gerenciaA, gerenciaD);
				i++;
				printf("\nDeseja ver outro aluno? (s \\ n)\n");
				fflush(stdin);
				scanf("%c", &mais);
			} while (i < 10 && mais != 'n');
			break;

			//IMPRIMI LISTA DE ALUNOS EM UMA DISCIPLINAS
		case 11:
			printf("\t11 - <LISTA DE ALUNOS EM UMA DISCIPLINA>");
			do
			{
				printf("\n");
				printf("\n");
				gerenciaMatri = exibirMatriculaDiscAlu(gerenciaMatri, gerenciaA, gerenciaD);
				i++;
				printf("\nDeseja ver outro Disciplina? (s \\ n)\n");
				fflush(stdin);
				scanf("%c", &mais);
			} while (i < 10 && mais != 'n');
			break;

			//IMPRIMI LISTA DE TODAS DISCIPLINAS DE UM PROFESSOR
		case 12:
			printf("\t12 - <LISTA DE TODAS AS DISCIPLINAS MINISTRADAS POR UM PROFESSOR>");
			do
			{
				printf("\n");
				printf("\n");
				gerenciaMatri = exibirMatriculaProf(gerenciaMatri, gerenciaP, gerenciaD);
				i++;
				printf("\nDeseja ver outro Professor? (s \\ n)\n");
				fflush(stdin);
				scanf("%c", &mais);
			} while (i < 10 && mais != 'n');
			break;

			//IMPRIMI LISTA DE TODOS PROFESSORES MATRICULADOS EM UMA DISCIPLINA
		case 13:
			printf("\t13 - <LISTA DE TODOS OS PROFESSORES VINCULADOS A UMA DISCIPLINA>");
			do
			{
				printf("\n");
				printf("\n");
				gerenciaMatri = exibirMatriculaDiscProf(gerenciaMatri, gerenciaP, gerenciaD);
				i++;
				printf("\nDeseja ver outro Disciplina? (s \\ n)\n");
				fflush(stdin);
				scanf("%c", &mais);
			} while (i < 10 && mais != 'n');
			break;

			//SAIR
		case 0:
			printf("\n");
			printf("\n");
			printf("\n");
			printf("\t\t<Volte Sempre>\n\n");
			break;
		}
	} while (opcao != 0);
	printf("\n");
	system("pause");
}

TgerenciaAlu cadastroAlu(TgerenciaAlu gerenciaA)
{
	int i, racadastrado = 0, ra;

	printf("\n<RA>> ");
	scanf("%i", &ra);
	for (i = 0; i < gerenciaA.numAlu; i++)// compara o ra atual com todos os ra ja cadastrados caso encontre ra cadastrado = 1
	{
		if (ra == gerenciaA.aluno[i].ra)
		{
			racadastrado = 1;
			break;
		}
		else
		{
			racadastrado = 0;// caso o ra nao tenha sido cadastrado previamente racadastrado = 0;
		}
	}

	if (racadastrado == 0)
	{
		gerenciaA.aluno[gerenciaA.numAlu].ra = ra;// como o ra foi validado ele guarda na struct
		printf("\n<Nome>> ");
		fflush(stdin);
		gets(gerenciaA.aluno[gerenciaA.numAlu].nome);
	}

	else// como ra ja foi cadastrado ele nao continua com o cadastro
	{
		printf("\n\tRA ja cadastrado !\n");
		gerenciaA.numAlu--;
		i--;
	}
	gerenciaA.numAlu++;// com o ra cadastrado ele atualiza o numero de alunos
	return gerenciaA;
}

TgerenciaAlu exibirAlunos(TgerenciaAlu gerenciaAlunos)
{
	int i;

	for (i = 0; i < gerenciaAlunos.numAlu; i++)
	{
		printf("\nNome: [%s]", gerenciaAlunos.aluno[i].nome);
		printf("\nRA: [%i]\n", gerenciaAlunos.aluno[i].ra);
		printf("\n---------------------------------------\n");
	}
	return gerenciaAlunos;
}

TgerenciaDisc cadastroDisc(TgerenciaDisc gerenciaD)
{
	int j, discadastrada = 0, codDisc = 0;

	printf("<Codigo Disciplina>> ");
	scanf("%i", &codDisc);

	for (j = 0; j < gerenciaD.numDisc; j++)
	{
		if (codDisc == gerenciaD.disciplina[j].codDisciplina)
		{
			discadastrada = 1;
			break;
		}
		else
		{
			discadastrada = 0;// caso o ra nao tenha sido cadastrado previamente racadastrado = 0;
		}
	}
	if (discadastrada == 0)
	{
		gerenciaD.disciplina[gerenciaD.numDisc].codDisciplina = codDisc;// como o ra foi validado ele guarda na struct
		printf("\n<Nome>> ");
		fflush(stdin);
		gets(gerenciaD.disciplina[gerenciaD.numDisc].nome);
	}
	else// como ra ja foi cadastrado ele nao continua com o cadastro
	{
		printf("\n\tCodigo ja cadastrado !\n");
		j--;
		gerenciaD.numDisc--;
	}
	gerenciaD.numDisc++;// com o ra cadastrado ele atualiza o numero de alunos
	return gerenciaD;
}

TgerenciaDisc exibirDisc(TgerenciaDisc gerenciaDisciplinas)
{
	int j;

	for (j = 0; j < gerenciaDisciplinas.numDisc; j++)
	{
		printf("\nNome: [%s]", gerenciaDisciplinas.disciplina[j].nome);
		printf("\nCodigo: [%i]", gerenciaDisciplinas.disciplina[j].codDisciplina);
		printf("\n---------------------------------------\n");
	}
	return gerenciaDisciplinas;
}

TgerenciaProf cadastroProf(TgerenciaProf gerenciaP)
{
	int k, profcadastrado = 0, codProf = 0;

	printf("\n<Codigo do Professor>> ");
	scanf("%i", &codProf);// ira cadastrar o atual(esse aluno atual e dito pela variavel gerencia.numAlu
	for (k = 0; k < gerenciaP.numProf; k++)// compara o ra atual(mostrado pela variavel gerencia.numAlu) com todos os ra ja cadastrados caso encontre ra cadastrado = 1
	{
		if (codProf == gerenciaP.professor[k].codProfessor)
		{
			profcadastrado = 1;
			break;
		}
		else
		{
			profcadastrado = 0;// caso o ra nao tenha sido cadastrado previamente racadastrado = 0;
		}
	}
	if (profcadastrado == 0)
	{
		gerenciaP.professor[gerenciaP.numProf].codProfessor = codProf;// como o ra foi validado ele guarda na struct
		printf("\n<Nome>> ");
		fflush(stdin);
		gets(gerenciaP.professor[gerenciaP.numProf].nome);
	}
	else// como ra ja foi cadastrado ele nao continua com o cadastro
	{
		printf("\n\tCodigo ja cadastrado !\n");
		gerenciaP.numProf--;
		k--;
	}
	gerenciaP.numProf++;// com o ra cadastrado ele atualiza o numero de alunos
	return gerenciaP;
}

TgerenciaProf exibirProf(TgerenciaProf gerenciaProfessor)
{
	int k;

	for (k = 0; k < gerenciaProfessor.numProf; k++)
	{
		printf("\nNome: [%s]", gerenciaProfessor.professor[k].nome);
		printf("\nCodigo: [%i]", gerenciaProfessor.professor[k].codProfessor);
		printf("\n---------------------------------------\n");
	}
	return gerenciaProfessor;
}

TgerenciaMatricula matriculaAlu(TgerenciaMatricula gerenciaMatri, TgerenciaAlu alu, TgerenciaDisc disc)
{
	int i = 0, j = 0, racadastrado = 0, codcadastrado = 0, ra = 0, cod = 0, controleAluno = 0, controleDisci = 0, controleMatricula = gerenciaMatri.Controle;
	char mais;

	do
	{
		printf("\n<RA>> ");
		scanf("%i", &ra);
		for (i = 0; i < alu.numAlu; i++)
		{
			if (ra == alu.aluno[i].ra)
			{
				racadastrado = 1;
				break;
			}
			else
			{
				racadastrado = 0;
			}
		}
		if (racadastrado == 1)
		{
			gerenciaMatri.guardaRA[controleAluno] = ra;// como o ra foi validado ele guarda na struct
			controleAluno++;
		}
		else
		{
			printf("Aluno nao Cadastrado !\n\n");
			i--;
		}
		fflush(stdin);
		printf("Mais um Aluno?(s/n) >> ");
		scanf("%c", &mais);
	} while (mais != 'n');

	do
	{
		printf("\n<Codigo Disciplina>> ");
		scanf("%i", &cod);
		for (i = 0; i < disc.numDisc; i++)
		{
			if (cod == disc.disciplina[i].codDisciplina)
			{
				codcadastrado = 1;
				break;
			}
			else
			{
				codcadastrado = 0;
			}
		}
		if (codcadastrado == 1)
		{
			gerenciaMatri.guardaCodDisc[controleDisci] = cod;// como o cod foi validado ele guarda na struct
			controleDisci++;
		}
		else
		{
			printf("Disciplina nao Cadastrado !\n\n");
			i--;
		}
		fflush(stdin);
		printf("Mais uma Disciplina ?(s/n) >> ");
		scanf("%c", &mais);
	} while (mais != 'n');

	for (i = 0; i < controleAluno; i++)
	{
		for (j = 0; j < controleDisci; j++)
		{
			gerenciaMatri.vetorMatricula1[controleMatricula].ra = gerenciaMatri.guardaRA[i];
			gerenciaMatri.vetorMatricula1[controleMatricula].codDisc1 = gerenciaMatri.guardaCodDisc[j];
			controleMatricula++;
		}
	}
	gerenciaMatri.Controle = controleMatricula;

	return gerenciaMatri;
}

TgerenciaMatricula exibirMatriculaAlu(TgerenciaMatricula gerenciaMatricula, TgerenciaAlu aluno, TgerenciaDisc disciplina)
{
	int i, ra = 0;

	printf("\n<RA>> ");
	scanf("%i", &ra);
	for (i = 0; i < 100; i++)
	{
		if (ra == gerenciaMatricula.vetorMatricula1[i].ra)
		{
			printf("\nCodigo da Disciplina: [%i]\n", gerenciaMatricula.vetorMatricula1[i].codDisc1);
		}
	}
	printf("\n---------------------------------------\n");
	return gerenciaMatricula;
}

TgerenciaMatricula matriculaProf(TgerenciaMatricula gerenciaMatri, TgerenciaProf prof, TgerenciaDisc disc)
{
	int i = 0, j = 0, racadastrado = 0, codcadastrado = 0, ra = 0, cod = 0, controleProfessor = 0, controleDisci = 0, controleMatricula = gerenciaMatri.Controle;
	char mais;

	do
	{
		printf("\n<Codigo do Professor>> ");
		scanf("%i", &ra);
		for (i = 0; i < prof.numProf; i++)
		{
			if (ra == prof.professor[i].codProfessor)
			{
				racadastrado = 1;
				break;
			}
			else
			{
				racadastrado = 0;
			}
		}
		if (racadastrado == 1)
		{
			gerenciaMatri.guardaCodProf[controleProfessor] = ra;// como o ra foi validado ele guarda na struct
			controleProfessor++;
		}
		else
		{
			printf("Professor nao Cadastrado !\n\n");
			i--;
		}
		fflush(stdin);
		printf("Mais um Professor?(s/n) >> ");
		scanf("%c", &mais);
	} while (mais != 'n');

	do
	{
		printf("\n<Codigo Disciplina>> ");
		scanf("%i", &cod);
		for (i = 0; i < disc.numDisc; i++)
		{
			if (cod == disc.disciplina[i].codDisciplina)
			{
				codcadastrado = 1;
				break;
			}
			else
			{
				codcadastrado = 0;
			}
		}
		if (codcadastrado == 1)
		{
			gerenciaMatri.guardaCodDisc[controleDisci] = cod;// como o cod foi validado ele guarda na struct
			controleDisci++;
		}
		else
		{
			printf("Disciplina nao Cadastrado !\n\n");
			i--;
		}
		fflush(stdin);
		printf("Mais uma Disciplina ?(s/n) >> ");
		scanf("%c", &mais);
	} while (mais != 'n');

	for (i = 0; i < controleProfessor; i++)
	{
		for (j = 0; j < controleDisci; j++)
		{
			gerenciaMatri.vetorMatricula2[controleMatricula].codProf = gerenciaMatri.guardaCodProf[i];
			gerenciaMatri.vetorMatricula2[controleMatricula].codDisc2 = gerenciaMatri.guardaCodDisc[j];
			controleMatricula++;
		}
	}
	gerenciaMatri.Controle = controleMatricula;

	return gerenciaMatri;
}

TgerenciaMatricula exibirMatriculaProf(TgerenciaMatricula gerenciaMatricula, TgerenciaProf professor, TgerenciaDisc disciplina)
{
	int i, cod = 0;

	printf("\n<Codigo do Professor>> ");
	scanf("%i", &cod);
	for (i = 0; i < 100; i++)
	{
		if (cod == gerenciaMatricula.vetorMatricula2[i].codProf)
		{
			printf("\nCodigo da Disciplina: [%i]\n", gerenciaMatricula.vetorMatricula2[i].codDisc2);
		}
	}
	printf("\n---------------------------------------\n");
	return gerenciaMatricula;
}

TgerenciaMatricula exibirMatriculaDiscAlu(TgerenciaMatricula gerenciaMatricula, TgerenciaAlu aluno, TgerenciaDisc disciplina)
{
	int i, cod = 0;

	printf("\n<Codigo da Disciplina>> ");
	scanf("%i", &cod);
	for (i = 0; i < 100; i++)
	{
		if (cod == gerenciaMatricula.vetorMatricula1[i].codDisc1)
		{
			printf("\nRA: [%i]\n", gerenciaMatricula.vetorMatricula1[i].ra);
		}
	}
	return gerenciaMatricula;
}

TgerenciaMatricula exibirMatriculaDiscProf(TgerenciaMatricula gerenciaMatricula, TgerenciaProf professor, TgerenciaDisc disciplina)
{
	int i, cod = 0;

	printf("\n<Codigo da Disciplina>> ");
	scanf("%i", &cod);
	for (i = 0; i < 100; i++)
	{
		if (cod == gerenciaMatricula.vetorMatricula2[i].codDisc2)
		{
			printf("\nCodigo do Professor: [%i]\n", gerenciaMatricula.vetorMatricula2[i].codProf);
		}
	}
	printf("\n---------------------------------------\n");
	return gerenciaMatricula;
}

TgerenciaMatricula CancelaMatricula(TgerenciaMatricula gerenciaMatricula)
{
	int i = 0, j = 0, racadastrado = 0, codcadastrado = 0, ra = 0, cod = 0, controleAluno = 0, controleDisci = 0, controleRegistro = 0;
	char mais;

	do
	{
		printf("\n<Cod >> ");
		scanf("%i", &cod);
		for (i = 0; i < 100; i++)
		{
			if (cod == gerenciaMatricula.vetorMatricula1[i].codDisc1)
			{
				codcadastrado = 1;
				break;
			}
			else
			{
				codcadastrado = 0;
			}
		}
		if (codcadastrado == 1)
		{
			gerenciaMatricula.guardaCodDisc[controleAluno] = cod;// como o ra foi validado ele guarda na struct
			controleDisci++;
		}
		else
		{
			printf("Aluno nao Matriculado em nenhuma disciplina !\n\n");
			i--;
		}
		fflush(stdin);
		printf("Mais uma disciplina?(s/n) >> ");
		scanf("%c", &mais);
	} while (mais != 'n');

	do
	{
		printf("\n<RA>> ");
		scanf("%i", &ra);
		for (i = 0; i < 100; i++)
		{
			if (ra == gerenciaMatricula.vetorMatricula1[i].ra)
			{
				for (j = 0; j < controleDisci; j++)
				{
					if (gerenciaMatricula.vetorMatricula1[i].codDisc1 = gerenciaMatricula.guardaCodDisc[j])
					{
						gerenciaMatricula.guardaRA[controleAluno];
						controleAluno++;
						controleRegistro = 1;
					}
				}
			}
		}
		fflush(stdin);
		printf("Mais um Aluno?(s/n) >> ");
		scanf("%c", &mais);
	} while (mais != 'n');

	for (i = 0; i < controleAluno; i++)
	{
		for (j = 0; j < 100; j++)
		{
			if (gerenciaMatricula.vetorMatricula1[j].ra == gerenciaMatricula.guardaRA[i])
			{
				if (gerenciaMatricula.vetorMatricula1[j].codDisc1 == gerenciaMatricula.guardaCodDisc[i])
				{
					gerenciaMatricula.vetorMatricula1[j].codDisc1 = 0;
				}
			}
		}
	}
	return gerenciaMatricula;
}