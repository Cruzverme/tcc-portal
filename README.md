# tcc-portal
Projeto final de conclusão de curso, portal para professores e alunos.

******* Usando devise ******
http://guides.railsgirls.com/devise/
rails g devise:views

******* User *******
 - Adicionando role
     rails g migration add_role_to_users role:integer
     adicionar role default zero, que serão usados como alunos