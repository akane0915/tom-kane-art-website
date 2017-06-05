# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Painting.create!([
  { title: 'Man in Sky',
    description: 'It is a man in the sky.',
    year: '2008',
    dimensions: '24x60',
    medium: 'Acrylic',
    support: 'Canvas',
    framed: false,
    price: '3000', },
  { title: 'Man in Earth',
    description: 'It is a man in the dirt.',
    year: '2009',
    dimensions: '24x60',
    medium: 'Acrylic',
    support: 'Canvas',
    framed: false,
    price: '3000', },
  { title: 'Man in Lake',
    description: 'It is a man in the lake.',
    year: '2010',
    dimensions: '24x60',
    medium: 'Acrylic',
    support: 'Canvas',
    framed: false,
    price: '3000', },
])