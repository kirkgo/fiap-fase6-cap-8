/*Cadastro e alteração:

    - Cadastrar os dados do usuário.
    - Alterar todos os dados do usuário, utilizando seu código como referência.
    - Cadastrar os dados para o peso do usuário.
    - Alterar todos os dados de peso do usuário, utilizando o código como referência.
    - Cadastrar os dados para a pressão arterial do usuário.
    - Alterar todos os dados de pressão arterial do usuário, utilizando o código como referência.
    - Cadastrar os dados para a atividade física do usuário.
    - Alterar todos os dados da atividade física do usuário, utilizando o código como referência.
    - Cadastrar os dados para o alimento consumido pelo usuário.
    - Alterar todos os dados para o alimento consumido pelo usuário, utilizando o código como referência.*/

-- TABELA CONTA

    -- CRIA CONTA
    INSERT INTO conta (codigo_conta, email, senha) 
        VALUES(CODIGO_CONTA.NEXTVAL, 'rm92449@fiap.com.br', 'fiap123');

    -- ALTERA SENHA
    UPDATE conta
        SET senha = 'S3nh42022!'
        WHERE codigo_conta = 3;

-- TABELA USUÁRIO

    --CRIA USUARIO
    INSERT INTO usuario (codigo_usuario, codigo_conta, nome_usuario, data_nascimento, localidade, altura, valor_peso_inicial,pressao_arterial)
        VALUES(CODIGO_USUARIO.NEXTVAL, 2, 'Kirk Patrick', TO_DATE('10/06/1980','DD/MM/YYYY'), 'Brasil', 1.90, 120.00,'12:8');

    --ALTERA PESO
    UPDATE usuario
        SET valor_peso_inicial pressao_arterial0
        WHERE codigo_usuario = 3
    
    --ALTERA PRESSÃO ARTERIAL
    UPDATE usuario
        SET pressao_arterial = '14:12'
        WHERE codigo_usuario = 8

-- TABELA META

    --CRIA META (DISPONÍVEL SOMENTE PARA O T.I.)
    INSERT INT meta (codigo_item, descricao_item, tipo_meta, unidade_medida, descricao_unidade_medida)
        VALUES(CODIGO_ITEM.NEXTVAL,'Isotonico','consumo','lt','litro(s)');

-- TABELA META USUARIO

    --CRIA META USUARIO
    INSERT INTO meta_usuario (codigo_usuario, codigo_item, data_inicio, valor_meta, data_termino_prevista)
        VALUES(1, 1, TO_DATE('08/05/2022','DD/MM/YYYY'), 1.25,TO_DATE('08/07/2022', 'DD/MM/YYYY'));

    --ALTERA O VALOR DA META
    UPDATE meta_usuario
        SET valor_meta = 2
        WHERE codigo_usuario = 1 AND codigo_item = 1;
    
    --ALTERA A DATA PARA REALIZAR A META
    UPDATE meta_usuario
        SET data_termino_prevista = TO_DATE('12/08/2022', 'DD/MM/YYYY')
        WHERE codigo_usuario = 1 AND codigo_item = 1;

-- TABELA REGISTRO META

    --CRIA REGISTRO DA META NO DIA
    INSERT INTO registro_meta(codigo_registro_meta, codigo_usuario, codigo_item, valor_realizado, data_realizacao)
        VALUES(CODIGO_REGISTRO_META.NEXTVAL,1,1,1,TO_DATE('12/05/2022','DD/MM/YYYY'));
    
    --ALTERA O VALOR REALIZADO NO DIA
    UPDATE registro_meta
     SET valor_realizado = 1.1
     WHERE codigo_registro_meta = 1 AND codigo_usuario = 1 AND codigo_item = 1;


/*Consultas:

    - Consultar os dados de um determinado usuário (filtrar a partir do seu código).
    - Consultar todos os dados de todos os registros de peso de um determinado usuário, ordenando-os dos registros mais recentes para os mais antigos (filtrar a partir do seu código).
    - Consultar todos os dados de um único registro de peso de um determinado usuário (filtrar a partir do código do usuário e do código de peso).
    - Consultar todos os dados de todos os registros de pressão arterial de um determinado usuário, ordenando-os dos registros mais recentes para os mais antigos (filtrar a partir do seu código).
    - Consultar todos os dados de um único registro de pressão arterial de um determinado usuário (filtrar a partir do código do usuário e do código de pressão).
    - Consultar todos os dados de todos os registros de atividade física de um determinado usuário, ordenando-os dos registros mais recentes para os mais antigos (filtrar a partir do seu código).
    - Consultar todos os dados de um único registro de atividade física de um determinado usuário (filtrar a partir do código do usuário e do código de atividade).
    - Consultar todos os dados de todos os registros de alimentos ingeridos de um determinado usuário, ordenando-os dos registros mais recentes para os mais antigos (filtrar a partir do seu código).
    - Consultar todos os dados de um único registro de alimento ingerido de um determinado usuário (filtrar a partir do código do usuário e do código de alimento).
    - Consultar os dados básicos de um determinado usuário, o último peso registrado e a última pressão arterial registrada (filtrar a partir do código de usuário – consulta necessária para o dashboard. Dica: veja consulta com junções).*/

    --CONSULTAR DADOS DE USUÁRIOS
    SELECT nome_usuario AS "Usuário", data_nascimento AS "Data de Nascimento", localidade AS Localidade, altura AS Altura, pressao_arterial AS "Pressão Arterial" 
        FROM usuario
        WHERE codigo_usuario = 1;

    --CONSULTAR REGISTROS DE PESO
    SELECT valor_realizado AS "Peso", data_realizacao AS "Data" 
        FROM registro_meta
        WHERE codigo_usuario = 1 AND codigo_item = 11 ;

    --CONSULTAR UM REGISTRO DE PESO ESPECIFICO
    SELECT valor_realizado AS "Peso", data_realizacao AS "Data" 
        FROM registro_meta
        WHERE codigo_usuario = 1 AND codigo_item = 11 AND data_realizacao = TO_DATE('08/05/2022','DD/MM/YYYY');

    --CONSULTAR REGISTROS DE PRESSÃO ARTERIAL ORDENANDO POR CODIGO
    SELECT valor_realizado AS "Pressão Arterial", data_realizacao AS "Data" 
        FROM registro_meta
        WHERE codigo_usuario = 1 AND codigo_item = 12;

    --CONSULTAR UM REGISTRO DE PRESSÃO ARTERIAL
    SELECT valor_realizado AS "Pressão Arterial", data_realizacao AS "Data" 
        FROM registro_meta
        WHERE codigo_usuario = 1 AND codigo_item = 12 AND data_realizacao = TO_DATE('08/05/2022','DD/MM/YYYY');

    --CONSULTAR TODOS OS REGISTROS DE ATIVIDADE FISICA DE UM USUARIO ORDEM DECRESCENTE
    SELECT codigo_usuario AS "USUÁRIO", codigo_registro_meta AS "Atividade Física", valor_realizado AS "Medida", data_realizacao AS "Data"
        FROM registro_meta
        WHERE codigo_usuario = 1 AND codigo_item = 11 OR codigo_item = 12
        ORDER BY data_realizacao DESC;

    --CONSULTAR UM REGISTRO DE ATIVIDADE FISICA
    SELECT codigo_usuario AS "USUÁRIO", codigo_registro_meta AS "Atividade Física", valor_realizado AS "Medida", data_realizacao AS "Data"
        FROM registro_meta
        WHERE codigo_usuario = 1 AND codigo_item = 11 AND data_realizacao = TO_DATE('08/05/2022','DD/MM/YYYY');

    --CONSULTAR TODOS OS REGISTROS DE CONSUMO DE UM USUARIO ORDEM DECRESCENTE
    SELECT codigo_usuario AS "USUÁRIO", codigo_registro_meta AS "Atividade Física", valor_realizado AS "Medida", data_realizacao AS "Data"
        FROM registro_meta
        WHERE codigo_usuario = 1 AND codigo_item = 1 OR codigo_item = 2 OR codigo_item = 3 OR codigo_item = 6
        ORDER BY data_realizacao DESC;

    --CONSULTAR UM REGISTRO DE CONSUMO
    SELECT codigo_usuario AS "USUÁRIO", codigo_registro_meta AS "Atividade Física", valor_realizado AS "Medida", data_realizacao AS "Data"
        FROM registro_meta
        WHERE codigo_usuario = 1 AND codigo_item = 1 AND data_realizacao = TO_DATE('08/05/2022','DD/MM/YYYY');

