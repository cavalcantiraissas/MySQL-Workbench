#  Empresa de Ônibus - Banco de Dados Fictício

> Projeto pessoal de modelagem e manipulação de dados em SQL, simulando o banco de dados interno de uma empresa de transporte rodoviário. O projeto cobre o cadastro de frota, controle de viagens, passageiros e dados financeiros.

---

##  Sobre o Projeto

Este banco de dados foi desenvolvido do zero com fins educacionais e de portfólio. A proposta é simular um ambiente real de gestão de dados para uma empresa de ônibus fictícia, aplicando conceitos de modelagem relacional, inserção de dados e consultas SQL.

**Status:** 🟡 Em desenvolvimento

---

##  Estrutura do Banco de Dados

### Tabelas previstas

| Tabela         | Descrição                                              |
|----------------|--------------------------------------------------------|
| `onibus`       | Cadastro da frota com características de cada veículo  |
| `viagens`      | Registros de viagens realizadas e programadas          |
| `financeiro`   | Receitas, despesas e balanço da empresa                |
| `motoristas`   | Cadastro dos motoristas responsáveis pelas viagens     |
| `cliente`      | Cadastro dos clientes que solicitam as viagens        |
| `receita`      |  Receitas vindas de viagens ou de origem externa        |
| `despesa`      |  Despesas categorizadas da empresa  

> As tabelas serão adicionadas progressivamente conforme o projeto evolui.

---

##  Tabela: `onibus`

Armazena as características físicas e de conforto de cada veículo da frota.

### Estrutura

| Coluna                | Tipo          | Descrição                            |
|-----------------------|---------------|--------------------------------------|
| `id_onibus`           | INT (PK, AI)  | Identificador único do ônibus        |
| `modelo`              | VARCHAR(20)   | Modelo do veículo                    |
| `quantidade_cadeiras` | INT           | Número de assentos disponíveis       |
| `banheiro`            | CHAR(3)       | Possui banheiro? (`sim` / `nao`)     |
| `som`                 | CHAR(3)       | Possui sistema de som? (`sim` / `nao`) |
| `ar_condicionado`     | CHAR(3)       | Possui ar-condicionado? (`sim` / `nao`) |

##  Tabela: `motorista`

Armazena o cadastro dos motoristas da empresa.

### Estrutura

| Coluna          | Tipo         | Descrição                        |
|-----------------|--------------|----------------------------------|
| `id_motorista`  | INT (PK, AI) | Identificador único do motorista |
| `nome_motorista`| VARCHAR(50)  | Nome completo do motorista 

---

##  Tabela: `cliente`

Armazena o cadastro dos clientes que solicitam as viagens.

### Estrutura

| Coluna         | Tipo          | Descrição                      |
|----------------|---------------|--------------------------------|
| `id_cliente`   | INT (PK, AI)  | Identificador único do cliente |
| `nome_cliente` | VARCHAR(50)   | Nome completo do cliente       |
| `telefone`     | VARCHAR(20)   | Número de telefone             |
| `endereco`     | VARCHAR(100)  | Endereço completo              |
| `cpf`          | VARCHAR(14)   | CPF no formato `000.000.000-00`|

---

##  Tabela: `viagem`

Armazena os registros de viagens realizadas, com referência ao motorista responsável.

### Estrutura

| Coluna          | Tipo           | Descrição                                            |
|-----------------|----------------|------------------------------------------------------|
| `id_viagem`     | INT (PK, AI)   | Identificador único da viagem                        |
| `local_partida` | VARCHAR(20)    | Local de origem                                     |
| `local_destino` | VARCHAR(20)    | Local de destino                                    |
| `valor`         | DECIMAL(10,2)  | Valor da viagem                                    |
| `id_motorista`  | INT (FK)       | Referência ao motorista responsável (`motorista.id_motorista`) |
| `id_cliente`    | INT (FK)      | Referência ao cliente solicitante (`cliente.id_cliente`)      |

---

##  Tabela: `receita`

Armazena as receitas da empresa, geradas automaticamente por viagens ou inseridas manualmente como receitas externas.

### Estrutura

| Coluna       | Tipo          | Descrição                                                     |
|--------------|---------------|---------------------------------------------------------------|
| `id_receita` | INT (PK, AI)  | Identificador único da receita                                |
| `id_viagem`  | INT (FK)      | Referência à viagem de origem — `NULL` se for receita externa |
| `descricao`  | VARCHAR(100)  | Descrição da origem — preenchido apenas para receitas externas|
| `valor`      | DECIMAL(10,2) | Valor da receita                                              |
| `data`       | DATE          | Data do registro                                              |

>  As receitas de viagem são registradas **automaticamente**

---

##  Tabela: `despesa`

Armazena as despesas categorizadas da empresa.

### Estrutura

| Coluna       | Tipo          | Descrição                                                           |
|--------------|---------------|---------------------------------------------------------------------|
| `id_despesa` | INT (PK, AI)  | Identificador único da despesa                                      |
| `categoria`  | ENUM          | Categoria: `combustivel`, `manutencao`, `salario`, `pedagio`, `outros` |
| `descricao`  | VARCHAR(100)  | Descrição detalhada da despesa                                      |
| `valor`      | DECIMAL(10,2) | Valor da despesa                                                    |
| `data`       | DATE          | Data do registro                                                    |
| `id_viagem`  | INT (FK)      | Referência à viagem relacionada — `NULL` se não houver vínculo      |

---

##  Trigger: `trg_receita_viagem`

Ao inserir uma nova viagem na tabela `viagem`, a trigger registra automaticamente a receita correspondente na tabela `receita`, sem necessidade de inserção manual.
```sql
CREATE TRIGGER trg_receita_viagem
AFTER INSERT ON viagem
FOR EACH ROW
INSERT INTO receita (id_viagem, valor, data)
VALUES (NEW.id_viagem, NEW.valor, CURDATE());
```

---

##  Como Executar

### Pré-requisitos

- [MySQL](https://dev.mysql.com/downloads/mysql/) instalado
- [MySQL Workbench](https://dev.mysql.com/downloads/workbench/) instalado

### Passo a passo

1. **Clone o repositório**
```bash
   git clone https://github.com/cavalcantiraissas/MySQL-Workbench.git
```

2. **Abra o MySQL Workbench** e conecte-se à sua instância local.

3. **Execute os arquivos na ordem abaixo**, abrindo cada um e pressionando `Cmd + Shift + Enter`:

   | Ordem | Arquivo                  | Descrição                        |
   |-------|--------------------------|----------------------------------|
   | 1°    | `01_create_database.sql` | Cria o banco de dados            |
   | 2°    | `02_create_tables.sql`   | Cria todas as tabelas            |
   | 3°    | `03_insert_data.sql`     | Insere os dados fictícios        |
   | 4°    | `04_queries.sql`         | Consultas para explorar os dados |



---

##  Conceitos Aplicados

- Criação de banco de dados (`CREATE DATABASE`)
- Definição de tabelas com tipos de dados e constraints (`PRIMARY KEY`, `NOT NULL`, `AUTO_INCREMENT`)
- Relacionamento entre tabelas (`FOREIGN KEY`, `REFERENCES`)
- Tipo enumerado (`ENUM`)
- Inserção de registros (`INSERT INTO`)
- Consultas e filtros (`SELECT`, `WHERE`, `ORDER BY`)
- Junção de tabelas (`JOIN`)
- Agregações (`SUM`, `GROUP BY`)
- Automação com trigger (`CREATE TRIGGER`, `AFTER INSERT`)
---

##  Próximos Passos

- [x] Criar tabela `onibus`
- [x] Criar tabela `motorista`
- [x] Criar tabela `viagem`
- [x] Adicionar `FOREIGN KEY` entre `viagem` e `motorista`
- [ ] Criar tabela `financeiro`
- [ ] Criar queries de análise e relatórios

---

##  Licença

Projeto disponibilizado para **fins educacionais e de portfólio**.  
Reprodução deve ser feita com atribuição à autora.

---

<p align="center">
  <a href="https://github.com/cavalcantiraissas/MySQL-Workbench">← Voltar ao repositório principal</a>
</p>
