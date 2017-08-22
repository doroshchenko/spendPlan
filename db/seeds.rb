# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = [
    { name: 'Финансовая независимость', description: 'Деньги, на которых можно построить бизнес, которые будут работать на вас'},
    { name: 'Образовательный', description: 'Деньги на образование'},
    { name: 'Сбережения и долгосрочные расходы', description: 'Накопительный счет'},
    { name: 'Повседневные расходы', description: 'Траты на жизнь'},
    { name: 'Развлекательный счет', description: 'Деньги на развлечения'},
    { name: 'Благотворительный', description: 'Пожертвования и помощь'},
]
categories.each do |category|
  SpendCategory.create( name:category[:name], description: category[:description], is_default: true)
end