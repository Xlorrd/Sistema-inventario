INSERT INTO [dbo].[tbl_modelo] ([desc_modelo])
VALUES ('Laptop Dell XPS 13'),
       ('PC de escritorio HP Pavilion'),
       ('Laptop Lenovo ThinkPad X1 Carbon'),
       ('iMac 27 pulgadas'),
       ('Surface Pro 7'),
       ('MacBook Pro 15 pulgadas'),
       ('PC de escritorio Acer Aspire TC'),
       ('Laptop Asus ZenBook 14'),
       ('Chromebook HP Chromebook 14'),
       ('Mac Mini');

INSERT INTO [dbo].[tbl_marca] ([desc_marca])
VALUES ('Dell'),
       ('HP'),
       ('Lenovo'),
       ('Apple'),
       ('Microsoft'),
       ('Asus'),
       ('Acer'),
       ('Samsung'),
       ('Sony'),
       ('LG');


	   -- Generar registros en la tabla [dbo].[tbl_marcaModelo]
INSERT INTO [dbo].[tbl_marcaModelo] ([id_marca], [id_modelo])
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8),
       (9, 9),
       (10, 10);
	   -- Generar registros en la tabla [dbo].[tbl_estadoAc]
INSERT INTO [dbo].[tbl_estadoAc] ([desc_estadoAc])
VALUES ('Bueno'),
       ('Malo'),
       ('Regular'),
       ('Excelente'),
       ('Deficiente'),
       ('Óptimo'),
       ('Insatisfactorio'),
       ('Satisfactorio'),
       ('Pendiente'),
       ('Completo');

	   -- Generar registros en la tabla [dbo].[tbl_departamento]
INSERT INTO [dbo].[tbl_departamento] ([desc_departamento])
VALUES ('Recursos Humanos'),
       ('Finanzas'),
       ('Ventas'),
       ('Marketing'),
       ('Operaciones'),
       ('Desarrollo de Productos'),
       ('Servicio al Cliente'),
       ('Tecnologías de la Información'),
       ('Compras'),
       ('Logística');

	   -- Generar registros en la tabla [dbo].[tb_empleado]
INSERT INTO [dbo].[tb_empleado] ([nombre_empleado], [apellido_empleado], [correo_empleado], [id_departamento], [id_rol], [dni_empleado], [contrasena_empleado], [estado_empleado])
VALUES ('Juan', 'Perez', 'juan.perez@example.com', 1, 1, '123456789', 'password1', 'A'),
       ('Maria', 'Gomez', 'maria.gomez@example.com', 2, 2, '987654321', 'password2', 'A'),
       ('Carlos', 'Rodriguez', 'carlos.rodriguez@example.com', 3, 1, '456789123', 'password3', 'A'),
       ('Laura', 'Fernandez', 'laura.fernandez@example.com', 4, 3, '789123456', 'password4', 'A'),
       ('Pedro', 'Lopez', 'pedro.lopez@example.com', 5, 2, '321987654', 'password5', 'A'),
       ('Ana', 'Martinez', 'ana.martinez@example.com', 6, 1, '654123789', 'password6', 'A'),
       ('Jose', 'Torres', 'jose.torres@example.com', 7, 3, '987321654', 'password7', 'A'),
       ('Sofia', 'Ramirez', 'sofia.ramirez@example.com', 8, 2, '789654321', 'password8', 'A'),
       ('Diego', 'Gonzalez', 'diego.gonzalez@example.com', 9, 1, '456987123', 'password9', 'A'),
       ('Patricia', 'Sanchez', 'patricia.sanchez@example.com', 10, 3, '123789456', 'password10', 'A'),
	   ('Luis', 'Hernandez', 'luis.hernandez@example.com', 1, 2, '789456123', 'password11', 'A'),
       ('Gabriela', 'Vargas', 'gabriela.vargas@example.com', 2, 3, '654789123', 'password12', 'A'),
       ('Ricardo', 'Gomez', 'ricardo.gomez@example.com', 3, 1, '123789654', 'password13', 'A'),
       ('Fernanda', 'Diaz', 'fernanda.diaz@example.com', 4, 2, '789654123', 'password14', 'A'),
       ('Andres', 'Ortega', 'andres.ortega@example.com', 5, 3, '456789654', 'password15', 'A'),
       ('Daniela', 'Soto', 'daniela.soto@example.com', 6, 1, '321654789', 'password16', 'A'),
       ('Hugo', 'Mendoza', 'hugo.mendoza@example.com', 7, 2, '987123456', 'password17', 'A'),
       ('Mariana', 'Castillo', 'mariana.castillo@example.com', 8, 3, '456321789', 'password18', 'A'),
       ('Jorge', 'Rojas', 'jorge.rojas@example.com', 9, 1, '789456321', 'password19', 'A'),
       ('Isabel', 'Flores', 'isabel.flores@example.com', 10, 2, '123654789', 'password20', 'A');

	   -- Insertar información ficticia en la tabla [dbo].[tbl_activo]
INSERT INTO [dbo].[tbl_activo] ([cod1_activo], [cod2_activo], [tipo_activo], [id_marca], [id_modelo], [serial_activo], [ubicacion_activo], [id_estadoAc], [observacion_activo], [estado_uso])
VALUES ('ACT001', 'ACT001-001', 'Laptop', 1, 1, 'SN12345', 'Oficina A', 1, 'Buena condición', 'A'),
       ('ACT002', 'ACT002-001', 'Impresora', 2, 2, 'SN67890', 'Oficina B', 2, 'Requiere mantenimiento', 'A'),
       ('ACT003', 'ACT003-001', 'Monitor', 3, 3, 'SN54321', 'Oficina C', 3, 'Dañado en la pantalla', 'A'),
       ('ACT004', 'ACT004-001', 'Proyector', 4, 4, 'SN09876', 'Sala de Conferencias', 4, 'Sin problemas', 'A'),
       ('ACT005', 'ACT005-001', 'Teléfono IP', 5, 5, 'SN45678', 'Recepción', 5, 'Necesita actualización de software', 'A'),
       ('ACT006', 'ACT006-001', 'Switch de red', 6, 6, 'SN78901', 'Cuarto de Servidores', 6, 'Requiere configuración', 'A'),
       ('ACT007', 'ACT007-001', 'Cámara de seguridad', 7, 7, 'SN23456', 'Exterior del Edificio', 7, 'Necesita reemplazo de lente', 'A'),
       ('ACT008', 'ACT008-001', 'Servidor', 8, 8, 'SN56789', 'Centro de Datos', 8, 'Requiere actualización de memoria', 'A'),
       ('ACT009', 'ACT009-001', 'Escáner', 9, 9, 'SN89012', 'Oficina D', 9, 'Problemas de alimentación de papel', 'A'),
       ('ACT010', 'ACT010-001', 'Mouse', 10, 10, 'SN12345', 'Oficina E', 10, 'Sin problemas', 'A');

	   -- Insertar información ficticia en la tabla [dbo].[tbl_custodio]
INSERT INTO [dbo].[tbl_custodio] ([id_activo], [id_empleado], [fecha_entrega], [fecha_recepcion], [estado_custodio], [observacion])
VALUES (1, 1, '2022-01-01', '2022-01-05', 'A', 'Entregado al empleado para uso temporal'),
       (2, 2, '2022-02-01', '2022-02-05', 'A', 'Entregado al empleado para uso temporal'),
       (3, 3, '2022-03-01', '2022-03-05', 'A', 'Entregado al empleado para uso temporal'),
       (4, 4, '2022-04-01', '2022-04-05', 'A', 'Entregado al empleado para uso temporal'),
       (5, 5, '2022-05-01', '2022-05-05', 'A', 'Entregado al empleado para uso temporal'),
       (6, 6, '2022-06-01', '2022-06-05', 'A', 'Entregado al empleado para uso temporal'),
       (7, 7, '2022-07-01', '2022-07-05', 'A', 'Entregado al empleado para uso temporal'),
       (8, 8, '2022-08-01', '2022-08-05', 'A', 'Entregado al empleado para uso temporal'),
       (9, 9, '2022-09-01', '2022-09-05', 'A', 'Entregado al empleado para uso temporal'),
       (10, 10, '2022-10-01', '2022-10-05', 'A', 'Entregado al empleado para uso temporal');
	 

	 EXECUTE listar_activo
	 EXECUTE buscaMasiva_activo "laptop"
