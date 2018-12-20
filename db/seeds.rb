# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

SubventionRequest.destroy_all
Subvention.destroy_all

Subvention.create!({
    name: 'Subvention des activités sportives',
    start_date: '1/10/2018',
    end_date: '31/12/2018',
    amount: 9000
  })

Subvention.create!({
    name: 'Subvention des activités culturelles',
    start_date: '1/09/2018',
    end_date: '31/12/2018',
    amount: 12000
  })

Subvention.create!( {
    name: 'Subvention rentrée scolaire',
    start_date: '15/08/2018',
    end_date: '30/09/2018',
    amount: 6000
  })

Subvention.create!({
    name: 'Subvention des affaires de toilettes pour chat et chien',
    start_date: '15/10/2018',
    end_date: '15/02/2019',
    amount: 1700
  })

Subvention.create!({
    name: 'Subvention père noël',
    start_date: '10/12/2018',
    end_date: '23/12/2019',
    amount: 18000
  })
