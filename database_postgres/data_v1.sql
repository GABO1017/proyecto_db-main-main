\c mande_db

\c mande_db

INSERT INTO Labor (labor_nombre) VALUES
('Plomero/a'),
('Cerrajero/a'),
('Pintor/a'),
('Profesor de ingles'),
('Mesero/a'),
('Chef'),
('Niñero/a'),
('Paseador/a de mascotas'),
('Empleado/a doméstico/a');

INSERT INTO Ubicacion(ubica_direccion, ubica_ciudad, ubica_departamento, ubica_latitud, ubica_longitud) VALUES 
('calle 48 #35-48', 'Cali', 'Valle', 41.40338, 2.17403),
('calle 45 #35-45', 'Cali', 'Valle', 41.40338, 2.17403),
('calle 43 #35-48', 'Cali', 'Valle', 41.40338, 2.17403),
('calle 5 #35-58', 'Cali', 'Valle', 41.40338, 2.17403),
('calle 8 #34-48', 'Cali', 'Valle', 41.40338, 2.17403);


INSERT INTO Persona(persona_nombre, persona_apellido,persona_email,persona_password, persona_celular, persona_ubica_direccion, persona_tarjeta_usuario, persona_cvc) VALUES
('yo', 'cys', 'yo@gmail.com', '12345','456784135','calle 48 #35-48' ,'12345678', '123'),
('a', 'non', 'cys@gmail.com', '87925','466785135',  'calle 5 #35-58','32155578', '312'),
('bebesis', 'bebesos', 'somos@gmail.com', '96245','456784305', 'calle 43 #35-48' , '77655578', '456'),
('puesyo', 'casañas', 'assda@gmail.com', '36971','456784789', 'calle 45 #35-45' , '78945623', '012'),
('qnpa', 'diosito', 'ywqewq@gmail.com', '78945','456780123',  'calle 48 #35-48' ,'01334863', '987');

INSERT INTO Cliente(cliente_celular, cliente_recibo) VALUES
('456784135', 'cjs'),
('466785135', 'cjs'),
('456784305', 'cjs'),
('456784789', 'cjs'),
('456780123', 'cjs');
