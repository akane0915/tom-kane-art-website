# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Painting.create!([
  { title: 'Cherry Blossoms With Wind',
    description: 'Frame Optional',
    year: '2017',
    dimensions: '11 x 14 inches',
    medium: 'Acrylic',
    support: 'Canvas',
    framed: false,
    price: '1500',
    image: 'cherry-blossoms-with-wind.jpg',
    style: 'landscape'
  },
  { title: 'Connecticut',
    description: 'Frame Optional',
    year: '2010',
    dimensions: '16 x 20 inches',
    medium: 'Acrylic',
    support: 'Canvas',
    framed: false,
    price: '2000',
    image: 'connecticut.jpg',
    style: 'landscape'},
  { title: 'Connectivity',
    description: 'Frame Optional',
    year: '2017',
    dimensions: '9 x 12 inches',
    medium: 'Acrylic',
    support: 'Canvas',
    framed: false,
    price: '1000',
    image: 'connectivity.jpg',
    style: 'portrait'},
  { title: 'Dead Indian Memorial Road',
    description: 'Frame Optional',
    year: '2015',
    dimensions: '9 x 12 inches',
    medium: 'Acrylic',
    support: 'Canvas',
    framed: false,
    price: '2250',
    image: 'dead-indian-memorial-road.jpg',
    style: 'portrait'},
  { title: 'Edinburgh',
    description: 'N/A',
    year: '2017',
    dimensions: '12 x 16 inches',
    medium: 'Acrylic',
    support: 'Paper',
    framed: false,
    price: '2000',
    image: 'edinburgh.jpg',
    style: 'portrait'},
  { title: 'Grand Canal - Dublin',
    description: 'N/A',
    year: '2017',
    dimensions: '16 x 20 inches',
    medium: 'Acrylic',
    support: 'Canvas',
    framed: false,
    price: '3000',
    image: 'grand-canal.jpg',
    style: 'landscape'},
  { title: 'Irises',
    description: 'N/A',
    year: '2013',
    dimensions: '22 x 24 inches',
    medium: 'Acrylic',
    support: 'Canvas',
    framed: false,
    price: 'Not For Sale',
    image: 'irises.jpg',
    style: 'portrait'},
  { title: 'Iveagh Gardens - Dublin',
    description: 'Frame Optional',
    year: '2010',
    dimensions: '16 x 20 inches',
    medium: 'Acrylic',
    support: 'Canvas',
    framed: false,
    price: '2000',
    image: 'iveagh-gardens.jpg',
    style: 'portrait'},
  { title: 'LA Winter',
    description: 'Frame Optional',
    year: '2011',
    dimensions: '16 x 20 inches',
    medium: 'Acrylic',
    support: 'Canvas',
    framed: false,
    price: '3000',
    image: 'la-winter.jpg',
    style: 'landscape'},
  { title: 'Manuel Antonio, Costa Rica',
    description: 'Frame Optional',
    year: '2013',
    dimensions: '16 x 20 inches',
    medium: 'Acrylic',
    support: 'Canvas',
    framed: false,
    price: '2000',
    image: 'manuel-antonio-costa-rica.jpg',
    style: 'landscape'},
  { title: 'Mature',
    description: 'N/A',
    year: '1961',
    dimensions: '18 x 24 inches',
    medium: 'Pastel',
    support: 'Paper',
    framed: false,
    price: 'Not For Sale',
    image: 'mature.jpg',
    style: 'portrait'},
  { title: 'On A Bad Day',
    description: 'N/A',
    year: '2007',
    dimensions: '18 x 24 inches',
    medium: 'Acrylic',
    support: 'Canvas',
    framed: false,
    price: 'Not For Sale',
    image: 'on-a-bad-day.jpg',
    style: 'portrait'},
  { title: 'Portland Weather',
    description: 'Frame Optional',
    year: '2017',
    dimensions: '20 x 30 inches',
    medium: 'Acrylic',
    support: 'Canvas',
    framed: false,
    price: '2500',
    image: 'portland-weather.jpg',
    style: 'landscape'},
  { title: 'St. Stephens Green - Dublin',
    description: 'Frame Optional',
    year: '2010',
    dimensions: '16 x 20 inches',
    medium: 'Acrylic',
    support: 'Canvas',
    framed: false,
    price: '1750',
    image: 'st-stephens-green.jpg',
    style: 'portrait'},
  { title: 'Woman In Traffic',
    description: 'N/A',
    year: '2017',
    dimensions: '12 x 16 inches',
    medium: 'Acrylic',
    support: 'Paper',
    framed: false,
    price: '1750',
    image: 'woman-in-traffic.jpg',
    style: 'portrait'},
])
