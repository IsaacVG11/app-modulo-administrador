# Seeds de usuarios
User.create(first_name: 'Administrador', last_name: 'admin1', email: 'admin@example.com', password: 'admin1234', role: 1)

User.create(first_name: 'Cocinero', last_name: 'cocinero1', email: 'chef@example.com', password: 'chef1234', role: 0)

# Seeds de clientes
Client.create(full_name: 'Isaac Villalobos Gonzalez', address: 'Condominio Lomas del Bosque',
    email: 'isaacs@gmail.com', password: 'teo1234', client_state: 1)

Client.create(full_name: 'David Hidalgo Arias', address: 'San Juan',
    email: 'davids@gmail.com', password: 'david1234', client_state: 1)