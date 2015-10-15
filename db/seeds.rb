# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.new(nome: "Aluno", email: "aluno@gmail.com", password: 'usuarios', password_confirmation: 'usuarios', role: 0)
u.save!
u2 = User.new(nome: "Professor", email: "professor@gmail.com", password: 'usuarios', password_confirmation: 'usuarios', role: 1)
u2.save!
u3 = User.new(nome: "Coordenador", email: "coordenador@gmail.com", password: 'usuarios', password_confirmation: 'usuarios', role: 2)
u3.save!
u4 = User.new(nome: "Administrator", email: "administrator@gmail.com", password: 'usuarios', password_confirmation: 'usuarios', role: 3)
u4.save!