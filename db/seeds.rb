# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.new(nome: "Aluno Sofredor", email: "aluno@gmail.com", password: 'usuarios', password_confirmation: 'usuarios', role: 0)
u.save!
u2 = User.new(nome: "Leonardo Barroso", email: "professor@gmail.com", password: 'usuarios', password_confirmation: 'usuarios', role: 1)
u2.save!
u3 = User.new(nome: "Ana Silvia", email: "coordenador@gmail.com", password: 'usuarios', password_confirmation: 'usuarios', role: 2)
u3.save!
u4 = User.new(nome: "Administrator do IFF", email: "administrator@gmail.com", password: 'usuarios', password_confirmation: 'usuarios', role: 3)
u4.save!

c1 = Curso.new(nome: "Bacharelado em Sistemas de Informação", coordenador_id: u3.id)
c1.save!

u5 = User.new(nome: "Amorim", email: "professor2@gmail.com", password: 'usuarios', password_confirmation: 'usuarios', role: 1)
u5.save!

Discipline.create(name: "Calculo 1", workload: 90, ementa: "PARTE I
1.IDÉIAS FUNDAMENTAIS (6 horas)
Problemas e questões cujo tratamento requer passagem ao limite. Derivadas, integrais, séries. As idéias fundamentais do Cálculo devem ser apresentadas imediatamente, sem formalismo nem formalidades. Os limites envolvidos devem ser tratados sem mistério e os cálculos levados até o fim. Deve-se, pelo menos, discutir a convergência das séries geométricas, harmônica e 1/n^2, tratar um problema de máximo/mínimo e calcular uma área (mas se pode fazer bem mais: apresentar o método de Newton, o logaritmo como área, o teorema fundamental do Cálculo¿). Trata-se de sacudir as idéias dos estudantes e abrir-lhes um novo mundo, sem fazer da passagem ao limite um bicho de sete cabeças.
PARTE II
2.INTEGRAL DEFINIDA (4 horas)
Partições e somas de Riemann, somas superiores e inferiores. Definição de integral. Cálculo de algumas integrais. Comentários sobre métodos numéricos. A definição precisa pode e deve ser apresentada, mas a ênfase deve estar no cálculo de integrais de funções polinomiais (que exigirá a dedução das fórmulas das somas das k-ésimas potências dos n primeiros números naturais); os métodos numéricos devem ser comentados em apoio ao trabalho a ser desenvolvido em Computação Científica I.
3.DERIVADA (24 horas)
Definição de derivada. Gráficos de funções. Regras de derivação. Velocidade instantânea e aceleração. Teorema fundamental do Cálculo. Métodos de integração. Aplicações. Mais uma vez, a definição precisa deve ser apresentada, assim como devem ser destacados os diversos teoremas envolvidos (teoremas sobre limites, regra da cadeia, limites fundamentais. teoremas sobre continuidade, teorema do valor médio, derivação de funções inversas), sendo deixadas para mais tarde as demonstrações precisas (o que não impede que justificativas convincentes sejam dadas). Nesta unidade está concentrado uma pequeno curso de Cálculo Diferencial e Integral: ao fim destas 4 semanas os estudantes devem estar aptos a derivar (inclusive funções trigonométricas, exp e log) e a integrar, esboçar gráficos, resolver problemas de máximos e mínimos e tratar questões de Cinemática. Uma extensa lista de exercícios, cobrindo todo o conteúdo da disciplina, deve ser apresentada, para ser entregue por partes ao longo das semanas seguintes e corrigida pelos monitores.
PARTE III
4.NÚMEROS REAIS (6 horas)
Números naturais, axiomas de Peano. Construção dos inteiros e dos racionais. Irracionalidade de raiz de 2. Bases de numeração, números reais como seqüências de racionais. Conceito de limite de seqüência. Seqüências de Cauchy. Definição de número real como classe de equivalência de seqüências de Cauchy de números racionais. Axiomas de R. Discussão das propriedades que distinguem R de Q. As definições rigorosas devem ser apresentadas e discutidas, sem muita perda de tempo com trivialidades - a ênfase deve ser colocada nas demonstrações das propriedades que caracterizam R (propriedade do supremo, convergência de seqüências de Cauchy, propriedade de Bolzano-Weierstrass e propriedade dos intervalos encaixantes, pelo menos). Este pode ser o momento, também, para falar de coisas interessantes, como enumerabilidade, conjunto de Cantor, conjuntos de medida nula, medida de Lebesgue, fractais e dimensão de Hausdorff, etc., o que pode estender a unidade por mais 2 horas. Esta unidade pode ser tratada em conjunto com as duas seguintes, já que o tema central, nas três, é a topologia da reta real.
5.LIMITES E CONTINUIDADE (4 horas)
Conceito de limite e demonstração das propriedades básicas. Funções contínuas. Demonstração das regras de derivação.
6.TEOREMAS SOBRE CONTINUIDADE (4 horas)
Teorema do valor intermediário. Teorema do máximo. Continuidade uniforme e integrabilidade das funções contínuas.
7.TEOREMA DO VALOR MÉDIO (6 horas)
Teorema do valor médio e conseqüências. Regra de l´Hôpital. Polinômio de Taylor.
8.TEOREMA(S) FUNDAMENTAL(IS) DO CÁLCULO (2 horas)
9.FUNÇÕES INVERSAS (6 horas)
Continuidade e diferenciabilidade de funções inversas. Construção das funções logarítmica e exponencial.
10.SÉRIES (18 horas)
Sucessões e séries numéricas. Critérios de convergência, séries absolutamente convergentes e rearranjamento, séries alternadas. Séries de potências e raio de convergência. Convergência uniforme. Diferenciabilidade das séries de potências. Construção das funções trigonométricas. Para que esta unidade seja viável, é importante que a idéia de soma infinita, ilustrada pelas séries geométricas e harmônica, já tenha sido apresentada no início do curso e que o critério de Cauchy tenha sido discutido quando da construção dos números reais. ", description: " Objetivos

Esta deve ser a disciplina mais importante do curso, marcante por sua posição no primeiro período. Aqui o estudante é apresentado à idéia de passagem ao limite, ponto de partida para a os fabulosos avanços que marcaram a Matemática a partir do século XVII. As habilidades que, espera-se, o aluno virá a desenvolver ao longo do período, podem ser apresentadas em três níveis:

    Compreensão dos conceitos de limite, derivada e integral; capacidade de operar com os mesmos.
    Capacidade de criar seus próprios modelos para o tratamento matemático de situações concretas; compreensão de situações clássicas (na Física, na Biologia, na Economia, na Estatística, etc.) modeladas e tratadas por meio do Cálculo de uma variável;
    Refinamento matemático suficiente para compreender a importância e a necessidade das demonstrações, assim como a cadeia de definições e passos intermediários que as compõem.

Além disso, deve-se aproveitar todas as oportunidades que apareçam para apresentar idéias e resultados relevantes, principalmente os que envolvam pesquisas recentes ou em desenvolvimento.
Considerações Metodológica

O plano de curso está estruturado de forma que a discussão das idéias se faça em três níveis. Num primeiro momento ( unidade 1.IDÉIAS FUNDAMENTAIS) atacam-se cruamente problemas cujo tratamento requer passagem ao limite, para que o estudante possa ter idéia do alcance daquilo que vai aprender. Num segundo momento, os conceitos são apresentados de maneira mais clara e se desenvolvem de maneira sistemática os métodos do cálculo infinitesimal (unidades 2.INTEGRAL DEFINIDA e 3.DERIVADA). Finalmente, na terceira parte, são discutidos os aspectos teóricos mais delicados e demonstrados os teoremas (unidades 4. a 10.).

Embora tenha muitos adeptos a escola que considera que o correto é fazer tudo direito de uma vez, desde o começo, partindo dos números reais, passando por uma apresentação rigorosa do conceito de limite e demonstrando em detalhe os teoremas na medida em que vão sendo apresentados, esta não é nossa opção. Se é verdade que não se pode (e nem necessariamente se deveria) reproduzir o processo histórico, guardar-lhe o espírito, de forma que o estudante não se veja enredado precocemente em sutilezas teóricas que ainda não pode apreciar nem compreender, parece ser uma orientação bastante razoável. Grosso modo, poderíamos dizer que as três fases descritas acima correspondem ao desenvolvimento da teoria: explosão das novas idéias (segunda metade do século XVII); desbravamento (século XVIII); estruturação (século XIX).

O tempo reservado para a disciplina (90 horas, com três aulas semanais de 2 horas cada) é curto para a proposta, e o sucesso da empreitada vai depender fundamentalmente da qualidade, do entusiasmo e da dedicação aos estudos por parte dos alunos. A ementa detalhada está acompanhada de uma estimativa otimista (80 horas) do número de horas de aula necessárias para a discussão da teoria em sala de aula, sem contar provas, testes e exercícios. É fortemente recomendável que o trabalho do professor seja reforçado por testes semanais, fora do horário das aulas, e por listas de exercícios e problemas. ", bibliography: " Existem centenas de livros de cálculo, vários em português. Recomenda-se fortemente que o estudante freqüente bibliotecas e livrarias, em busca do(s) livro(s) que lhe pareça(m) mais a seu gosto. Os professores deverão fornecer, se possível, roteiros para estudo ou notas de aula (o que não invalida a recomendação anterior). De qualquer forma, indicamos abaixo alguns livros de bom nível:

    R. COURANT, Differential and Integral Calculus - provavelmente o melhor livro de Cálculo jamais escrito. Em dois volumes: o primeiro trata o Cálculo de uma variável; o segundo, o Cálculo de várias variáveis. A edição em português está esgotada há muitos anos, às vezes pode ser encontrada em sebos. Tem um estilo meio antigo (foi escrito há cerca de 80 anos), mas quanto mais o tempo passa mais se gosta dele. É um livro para toda a vida
    APOSTOL, T. M., Calculus- também em dois volumes, o primeiro contém Cálculo de uma variável e Álgebra Linear; o segundo, Cálculo de várias variáveis
    SPIVAK, M., Calculus.
    ANTON, H., Cálculo: Um novo horizonte, Vol. 1
    STEWART, J. Cáclulo Vo. 1

O Apostol e o Spivak são textos de leitura mais agradável do que o Courant, embora não sejam considerados fáceis; o Anton e o Bianchini/Santos são de safra mais recente e, comparativamente, menos abstratos do que os outros dois. Uma combinação de três textos bastante boa seria:

    o Courant (que pode ser adquirido com prazer a qualquer momento da vida, seja agora ou para uma revisitação futura às idéias do Cálculo),
    o Apostol ou o Spivak ou algum do mesmo nível (que apresente as definições e demonstrações de forma rigorosa e completa),
    um livro mais simples um pouco, menos preocupado com a construção dos aspectos mais abstratos da teoria, como o Anton e o Bianchini/Santos (ou algum outro na mesma linha, ao gosto do freguês). ", professor_id: u2.id, curso_id: c1.id)

Discipline.create(name: "Estatistica", workload: 120, ementa: "1. As origens da Estatística. Relação entre Probabilidade e Estatística.
2. Projetos: caracterização; projeto institucional e pedagógico; projetos em Estatística.
3. Tipos de estudos: observacional e experimental. Fontes de dados.
4. Análise de dados: apresentações de informações estatísticas; análise de variáveis quantitativas e qualitativas; tratamento gráfico envolvendo variáveis quantitativas e qualitativas; geração e tratamento de informações estatísticas.
5. Probabilidade: apresentação de conceitos de probabilidade, propriedades.
6. Variável aleatória discreta e variável aleatória contínua: cenários em áreas de aplicação; distribuições binomial e normal; valor esperado e variância, noção de risco.
7. Noções de amostragem: amostra aleatória simples; amostra estratificada; amostra sistemática.
8. Noções de inferência: estimação por ponto e por intervalo; teste de independência.
9. Noções de correlação linear e de regressão linear.", description: "Área(s) de Concentração: Ensino de Matemática Elementar", bibliography: "Batanero, C. Didáctica de la Estatística. Depto. De Didáctica de la Matemática. Univ. De Granada, 2001. Disponível em
http://www.ugr.es/~batanero/proyecto.html.
Bussab, W. O. e Morettin, P.A. Estatística Básica., 7ª edição, 1ª reimpressão, Ed. Saraiva, 2011.
Gal, I. e Garfield. J (eds). The Assessment Challenge in Statistics Education. IOS Press, 1997. Disponível em
http://www.stat.auckland.ac.nz/~iase/publications/assessbk/.
Magalhães, M.N. e Pedroso de Lima, A.C. Noções de Probabilidade e Estatística, 7ª edição, 1ª reimpressão, EDUSP, 2011.
Rea, L.M e Parker, R. A. Metodologia de Pesquisa, Pioneira Thomson Learning, 2002.
Rea, L.M. et al. Metodologia de Pesquisa, Pioneira Thomson Learning, 2002.
", professor_id: u5.id, curso_id: c1.id)
Discipline.create(name: "Portugues", workload: 40, ementa: "3.1 Novo acordo ortográfico.
3.2 Acentuação gráfica.
3.3 Coerência e coesão.
3.4 Elementos da comunicação: emissor, receptor, mensagem.
3.5 Funções da linguagem: conativa, referencial, emotiva e poética.
3.6 Estruturas frasais.
3.7 O parágrafo.
3.8 Formas de composição do texto: introdução, elementos estruturais, tipos de textos.
3.9 Dificuldades gramaticais.
3.10 Interpretação de textos, análise de textos atuais.
3.11 Ortografia.
3.12 Análises fílmicas.", description: "GERAL
Possibilitar ao aprendente conhecimentos sobre o uso da linguagem oral e escrita de acordo co
m a
norma culta da Língua Portuguesa e usá
-
la corretamente em diversas instâncias do processo de
comunicação, nas mais variadas situações sociais.
ESPECÍFICO
·
Elaborar textos orais e escritos fundamentados em teorias, critérios e princípios linguísticos e
g
ramaticais;
·
Identificar os elementos da comunicação;
·
Reconhecer as funções da linguagem;
·
Caracterizar a estrutura do parágrafo;
·
Diferenciar os elementos estruturais do texto;
·
Exercitar diferentes linguagens a partir da leitura de livros;
·
Utilizar o acervo
da Língua Portuguesa nos padrões ortográficos;
·
Compreender novas formas ortográficas.", bibliography: "BÁSICA
ALMEIDA, N. M. de.
Gramática Metódica da Língua Portuguesa.
 São Paulo: Saraiva, 2005.
AZEVEDO, José Carlos (org).
Língua Por
tuguesa em debate: conhecimento e ensino
.
Petrópolis: Vozes, 2003.
MARTINS, Dileta Silveira. ZILBERKNOP, Lúbia Sciliar.
Português Instrumental.
 23ª ed.
Porto Alegre: Sagra Luzzato, 2002.
COMPLEMENTAR
BECHARA, Evanildo, 1928.
Moderna gramática portuguesa
. R
io Grande do Sul: Lucerna,
2003.
FARACO, C. Alberto.
Oficina de texto.
 Petrópolis: Vozes, 2003.
GRISHAM, John.
O advogado.
 Rio de Janeiro: Rocco, 1998.", professor_id: u5.id, curso_id: c1.id)
Discipline.create(name: "Inglês", workload: 40, ementa: "calculo", description: "dadfjejfqw", bibliography: "rwrwerew", professor_id: u2.id, curso_id: c1.id)
Discipline.create(name: "Introdução a Algoritimos", workload: 40, ementa: "calculo", description: "dadfjejfqw", bibliography: "rwrwerew", professor_id: u2.id, curso_id: c1.id)
Discipline.create(name: "Informatica Basica", workload: 40, ementa: "calculo", description: "dadfjejfqw", bibliography: "rwrwerew", professor_id: u5.id, curso_id: c1.id)