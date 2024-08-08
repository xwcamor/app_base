# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Setting.create!([
  {   name: 'APP DEMO',
      body_config: "sidebar-mini layout-navbar-fixed layout-fixed text-sm sidebar-closed sidebar-collapse pace-done",
      deleted: false,
      active: true      
  } 
])

Language.create!([
  { name: 'English',   locale: 'en', flag: 'us', deleted: false, active: true },
  { name: 'Español',   locale: 'es', flag: 'es', deleted: false, active: true },
  { name: 'Portugués', locale: 'pt', flag: 'pt', deleted: false, active: true },
  { name: 'Français',  locale: 'fr', flag: 'fr', deleted: false, active: false },
  { name: 'Italiano',  locale: 'it', flag: 'it', deleted: false, active: false },
  { name: 'Deutsch',   locale: 'de', flag: 'de', deleted: false, active: false }
])

Country.create!([
  { name: 'United States', currency: 'USD', time_zone: 'New_York',     language_id: 1, region: 'America', deleted: false, active: true },
  { name: 'Peru',          currency: 'PEN', time_zone: 'Lima',         language_id: 2, region: 'America', deleted: false, active: true },
  { name: 'Chile',         currency: 'CLP', time_zone: 'Santiago',     language_id: 2, region: 'America', deleted: false, active: true },
  { name: 'Colombia',      currency: 'COP', time_zone: 'Bogota',       language_id: 2, region: 'America', deleted: false, active: true },
  { name: 'Venezuela',     currency: 'VES', time_zone: 'Caracas',      language_id: 2, region: 'America', deleted: false, active: true },
  { name: 'Argentina',     currency: 'ARS', time_zone: 'Buenos_Aires', language_id: 2, region: 'America', deleted: false, active: true },
  { name: 'Brazil',        currency: 'BRL', time_zone: 'Sao_Paulo',    language_id: 3, region: 'America', deleted: false, active: true },
  { name: 'Spain',         currency: 'EUR', time_zone: 'Madrid',       language_id: 2, region: 'Europe' , deleted: false, active: true },
  { name: 'France',        currency: 'EUR', time_zone: 'Paris',        language_id: 4, region: 'Europe' , deleted: false, active: true },
  { name: 'Italy',         currency: 'EUR', time_zone: 'Rome',         language_id: 5, region: 'Europe' , deleted: false, active: true },
  { name: 'Germany',       currency: 'EUR', time_zone: 'Berlin',       language_id: 6, region: 'Europe' , deleted: false, active: true }
])


Profile.create(name:  "Administrador", deleted: false, active: true )
Profile.create(name:  "Usuario",       deleted: false, active: true )

Account.create(email: 'admin@demo.com', username: "admin", password: '123456', active: true, deleted: false, profile_id: 1, language_id: 1, country_id: 2, time_zone: 'Lima' )
Account.create(email: 'user@demo.com' , username: "user",  password: '123456', active: true, deleted: false, profile_id: 2, language_id: 1, country_id: 2, time_zone: 'Lima' )
Account.create(email: 'user2@demo.com', username: "user2", password: '123456', active: true, deleted: false, profile_id: 2, language_id: 1, country_id: 2, time_zone: 'Lima' )
Account.create(email: 'user3@demo.com', username: "user3", password: '123456', active: true, deleted: false, profile_id: 2, language_id: 1, country_id: 2, time_zone: 'Lima' )
Account.create(email: 'user4@demo.com', username: "user4", password: '123456', active: true, deleted: false, profile_id: 2, language_id: 1, country_id: 2, time_zone: 'Lima' )

User.create(account_id: 1, name:  "Admin"   , lastname: "FULL"     )
User.create(account_id: 2, name:  "Usuario" , lastname: "ESTANDAR" ) 
User.create(account_id: 3, name:  "Usuario2", lastname: "ESTANDAR" ) 
User.create(account_id: 4, name:  "Usuario3", lastname: "ESTANDAR" ) 
User.create(account_id: 5, name:  "Usuario4", lastname: "ESTANDAR" ) 

Access.create([
  { resource_name: 'Language', action_name: 'index'},
  { resource_name: 'Language', action_name: 'new'},
  { resource_name: 'Language', action_name: 'show'},
  { resource_name: 'Language', action_name: 'edit'},
  { resource_name: 'Language', action_name: 'delete'},
  { resource_name: 'Country' , action_name: 'index'},
  { resource_name: 'Country' , action_name: 'new'},
  { resource_name: 'Country' , action_name: 'show'},
  { resource_name: 'Country' , action_name: 'edit'},
  { resource_name: 'Country' , action_name: 'delete'},
  { resource_name: 'Setting', action_name: 'index'},
  { resource_name: 'Setting', action_name: 'new'},
  { resource_name: 'Setting', action_name: 'show'},
  { resource_name: 'Setting', action_name: 'edit'},
  { resource_name: 'Setting', action_name: 'delete'},
  { resource_name: 'Access' , action_name: 'index'},
  { resource_name: 'Access',  action_name: 'new'},
  { resource_name: 'Access',  action_name: 'show'},
  { resource_name: 'Access',  action_name: 'edit'},
  { resource_name: 'Access',  action_name: 'delete'},  
  { resource_name: 'Profile', action_name: 'index'},
  { resource_name: 'Profile', action_name: 'new'},
  { resource_name: 'Profile', action_name: 'show'},
  { resource_name: 'Profile', action_name: 'edit'},
  { resource_name: 'Profile', action_name: 'delete'},
  { resource_name: 'Account', action_name: 'index'},
  { resource_name: 'Account', action_name: 'new'},
  { resource_name: 'Account', action_name: 'show'},
  { resource_name: 'Account', action_name: 'edit'},
  { resource_name: 'Account', action_name: 'delete'},
  { resource_name: 'Product', action_name: 'index'},
  { resource_name: 'Product', action_name: 'new'},
  { resource_name: 'Product', action_name: 'show'},
  { resource_name: 'Product', action_name: 'edit'},
  { resource_name: 'Product', action_name: 'delete'},
  { resource_name: 'Position', action_name: 'index'},
  { resource_name: 'Position', action_name: 'new'},
  { resource_name: 'Position', action_name: 'show'},
  { resource_name: 'Position', action_name: 'edit'},
  { resource_name: 'Position', action_name: 'delete'},
  { resource_name: 'Employee', action_name: 'index'},
  { resource_name: 'Employee', action_name: 'new'},
  { resource_name: 'Employee', action_name: 'show'},
  { resource_name: 'Employee', action_name: 'edit'},
  { resource_name: 'Employee', action_name: 'delete'},
  { resource_name: 'TypePayment', action_name: 'index'},
  { resource_name: 'TypePayment', action_name: 'new'},
  { resource_name: 'TypePayment', action_name: 'show'},
  { resource_name: 'TypePayment', action_name: 'edit'},
  { resource_name: 'TypePayment', action_name: 'delete'},
  { resource_name: 'ReportPayment', action_name: 'index'},
  { resource_name: 'ReportPayment', action_name: 'new'},
  { resource_name: 'ReportPayment', action_name: 'show'},
  { resource_name: 'ReportPayment', action_name: 'edit'},
  { resource_name: 'ReportPayment', action_name: 'delete'},
  { resource_name: 'Customer', action_name: 'index'},
  { resource_name: 'Customer', action_name: 'new'},
  { resource_name: 'Customer', action_name: 'show'},
  { resource_name: 'Customer', action_name: 'edit'},
  { resource_name: 'Customer', action_name: 'delete'},
  { resource_name: 'Supplier', action_name: 'index'},
  { resource_name: 'Supplier', action_name: 'new'},
  { resource_name: 'Supplier', action_name: 'show'},
  { resource_name: 'Supplier', action_name: 'edit'},
  { resource_name: 'Supplier', action_name: 'delete'},
  { resource_name: 'Sale', action_name: 'index'},
  { resource_name: 'Sale', action_name: 'new'},
  { resource_name: 'Sale', action_name: 'show'},
  { resource_name: 'Sale', action_name: 'edit'},
  { resource_name: 'Sale', action_name: 'delete'}
])

profile = Profile.find(1)
accesses = Access.all
accesses.each do |access|
  ProfileAccess.find_or_create_by(profile_id: 1, access_id: access.id)
end

profile2 = Profile.find(2)
accesses2 = Access.where("id IN (41,42,43,44,45) ")
accesses2.each do |access|
  ProfileAccess.find_or_create_by(profile_id: 2, access_id: access.id)
end


Position.create(name:  "Mozo",     deleted: false, active: true )
Position.create(name:  "Cocinero", deleted: false, active: true )
Position.create(name:  "Cajero",   deleted: false, active: true )

Customer.create(name: "Recurrente", deleted: false, active: true )
Customer.create(name: "Empresa", deleted: false, active: true )

Employee.create(name:  "Mozo 1",      position_id: 1, deleted: false, active: true )
Employee.create(name:  "Mozo 2",      position_id: 1, deleted: false, active: true )
Employee.create(name:  "Mozo 3",      position_id: 1, deleted: false, active: true )
Employee.create(name:  "Cocinero 1",  position_id: 2, deleted: false, active: true )
Employee.create(name:  "Cocinero 2",  position_id: 2, deleted: false, active: true )
Employee.create(name:  "Cocinero 3",  position_id: 2, deleted: false, active: true )
Employee.create(name:  "Cajero 1",    position_id: 3, deleted: false, active: true )
Employee.create(name:  "Cajero 2",    position_id: 3, deleted: false, active: true )
Employee.create(name:  "Cajero 3",    position_id: 3, deleted: false, active: true )

TypePayment.create(name:  "Efectivo",  deleted: false, active: true )
TypePayment.create(name:  "T.Credito", deleted: false, active: true )
TypePayment.create(name:  "T.Débito",  deleted: false, active: true )
TypePayment.create(name:  "Yape",      deleted: false, active: true )
TypePayment.create(name:  "Plin",      deleted: false, active: true )

ReportPayment.create(name:  "Boleta",   deleted: false, active: true )
ReportPayment.create(name:  "Factura",  deleted: false, active: true )

Product.create(name:  "1/8 Pollo", unit_price: 10, description: "Sin promoción"  , deleted: false, active: true )
Product.create(name:  "1/4 Pollo", unit_price: 15, description: "Sin promoción"  , deleted: false, active: true )
Product.create(name:  "1/2 Pollo", unit_price: 28, description: "Sin promoción"  , deleted: false, active: true )
Product.create(name:  "3/4 Pollo", unit_price: 35, description: "Sin promoción"  , deleted: false, active: true )
Product.create(name:  "1 Pollo"  , unit_price: 50, description: "Sin promoción"  , deleted: false, active: true )
Product.create(name:  "1/8 Pollo + Gaseosa + Ensalada", unit_price: 12.9, description: "1/8 Pollo - Promoción"  , deleted: false, active: true )
Product.create(name:  "1/4 Pollo + Gaseosa + Ensalada", unit_price: 17.9, description: "1/4 Pollo - Promoción"  , deleted: false, active: true )
Product.create(name:  "1/2 Pollo + Gaseosa + Ensalada", unit_price: 30.9, description: "1/2 Pollo - Promoción"  , deleted: false, active: true )
Product.create(name:  "3/4 Pollo + Gaseosa + Ensalada", unit_price: 37.9, description: "3/4 Pollo - Promoción"  , deleted: false, active: true )
Product.create(name:  "1 Pollo + Gaseosa + Ensalada"  , unit_price: 52.9, description: "1 Pollo - Promoción"    , deleted: false, active: true )