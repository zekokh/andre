# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(firstName: 'Руслан', lastName: 'Зекох', login: 'ruslan', phone: '89884744500', password: '1234', birthday: '16.08.1992', role: 'admin')
Ingredient.create(name: 'Молоко', unit: 'кг', provider_id: 1)