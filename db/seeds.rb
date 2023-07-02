# Seeds de clientes
Client.create(full_name: 'Isaac Villalobos Gonzalez', address: 'Condominio Lomas del Bosque',
    email: 'isaacs@gmail.com', password: 'teo1234', client_state: 1)

Client.create(full_name: 'David Hidalgo Arias', address: 'San Juan',
    email: 'davids@gmail.com', password: 'david1234', client_state: 1)

State.create(ontime: 10, overtime: 15, late: 20)