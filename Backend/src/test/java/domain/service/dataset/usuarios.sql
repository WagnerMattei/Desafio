TRUNCATE "usuario" CASCADE;

INSERT INTO usuario (id, ativo, celular, cpf, data_alteracao, data_cadastro, email, endereco, nome, permissoes, senha, criador_id, ultimo_alterador_id)
VALUES (1, true, NULL, '02542522058', null, null, 'ksjdfdjf@sdfhasdf.com', 'DFSDFGSDFDF', 'shdfsadhf', 'ADMINISTRADOR', '$2a$10$g.wT4R0Wnfel1jc/k84OXuwZE02BlACSLfWy6TycGPvvEKvIm86SG' , null, null );

INSERT INTO usuario (id, ativo, celular, cpf, data_alteracao, data_cadastro, email, endereco, nome, permissoes, senha, criador_id, ultimo_alterador_id)
VALUES (2, true, NULL, '02542528058', null, null, 'wagner.mattei@eits.com.br', 'DFSDFGSDFDF', 'shdfsadhf', 'ADMINISTRADOR', '$2a$10$g.wT4R0Wnfel1jc/k84OXuwZE02BlACSLfWy6TycGPvvEKvIm86SG' , null, null );

SELECT pg_catalog.setval('public.usuario_id_seq', 1000, TRUE);
