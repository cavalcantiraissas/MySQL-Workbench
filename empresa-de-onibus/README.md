#  Empresa de Ônibus - Banco de Dados Fictício

> Projeto pessoal de modelagem e manipulação de dados em SQL, simulando o banco de dados interno de uma empresa de transporte rodoviário. O projeto cobre o cadastro de frota, motoristas, clientes, controle de viagens e financeiro.

---

##  Sobre o Projeto

Este banco de dados foi desenvolvido do zero com fins educacionais e de portfólio. A proposta é simular um ambiente real de gestão de dados para uma empresa de ônibus fictícia, aplicando conceitos de modelagem relacional, inserção de dados, consultas SQL e automação com triggers.

**Status:** 🟡 Em desenvolvimento

---

##  Estrutura do Banco de Dados

### Tabelas

| Tabela      | Status       | Descrição                                               |
|-------------|--------------|---------------------------------------------------------|
| `onibus`    |  Concluída | Cadastro da frota com características e disponibilidade |
| `motorista` |  Concluída | Cadastro dos motoristas com CNH e contato               |
| `cliente`   |  Concluída | Cadastro dos clientes que solicitam as viagens          |
| `viagem`    |  Concluída | Registros de viagens com datas, status e vínculos       |
| `receita`   |  Concluída | Receitas vindas de viagens ou de origem externa         |
| `despesa`   |  Concluída | Despesas categorizadas da empresa            

---

##  Tabela: `onibus`

Armazena as características físicas, de conforto e a disponibilidade de cada veículo da frota.

### Estrutura

| Coluna                | Tipo         | Descrição                                                    |
|-----------------------|--------------|--------------------------------------------------------------|
| `id_onibus`           | INT (PK, AI) | Identificador único do ônibus                                |
| `modelo`              | VARCHAR(20)  | Modelo do veículo                                            |
| `quantidade_cadeiras` | INT          | Número de assentos disponíveis                               |
| `banheiro`            | ENUM         | Possui banheiro? (`Sim` / `Não`)                             |
| `som`                 | ENUM         | Possui sistema de som? (`Sim` / `Não`)                       |
| `ar_condicionado`     | ENUM         | Possui ar-condicionado? (`Sim` / `Não`)                      |
| `disponibilidade`     | ENUM         | Status do veículo: `Disponível`, `Manutenção`, `Em Viagem`   |

---

##  Tabela: `motorista`

Armazena o cadastro completo dos motoristas, incluindo dados de habilitação e contato.

### Estrutura

| Coluna           | Tipo         | Descrição                                  |
|------------------|--------------|--------------------------------------------|
| `id_motorista`   | INT (PK, AI) | Identificador único do motorista           |
| `nome_motorista` | VARCHAR(50)  | Nome completo do motorista                 |
| `numero_cnh`     | VARCHAR(11)  | Número da CNH — único por motorista        |
| `validade_cnh`   | DATE         | Data de validade da CNH                    |
| `telefone`       | VARCHAR(20)  | Número de telefone para contato            |

---

##  Tabela: `cliente`

Armazena o cadastro dos clientes que solicitam as viagens.

### Estrutura

| Coluna         | Tipo         | Descrição                                  |
|----------------|--------------|--------------------------------------------|
| `id_cliente`   | INT (PK, AI) | Identificador único do cliente             |
| `nome_cliente` | VARCHAR(50)  | Nome completo do cliente                   |
| `telefone`     | VARCHAR(20)  | Número de telefone                         |
| `endereco`     | VARCHAR(100) | Endereço completo                          |
| `cpf`          | VARCHAR(14)  | CPF no formato `000.000.000-00` — único    |

---

##  Tabela: `viagem`

Armazena os registros de viagens com datas, status, e vínculos com motorista, cliente e ônibus.

### Estrutura

| Coluna          | Tipo          | Descrição                                                      |
|-----------------|---------------|----------------------------------------------------------------|
| `id_viagem`     | INT (PK, AI)  | Identificador único da viagem                                  |
| `data_partida`  | DATETIME      | Data e hora de saída                                           |
| `data_retorno`  | DATETIME      | Data e hora de retorno                                         |
| `local_partida` | VARCHAR(100)  | Cidade ou endereço de origem                                   |
| `local_destino` | VARCHAR(100)  | Cidade ou endereço de destino                                  |
| `valor`         | DECIMAL(10,2) | Valor da passagem                                              |
| `status`        | ENUM          | `Pendente`, `Confirmada`, `Em Andamento`, `Concluída`, `Cancelada` — padrão: `Confirmada` |
| `id_motorista`  | INT (FK)      | Referência ao motorista responsável (`motorista.id_motorista`) |
| `id_cliente`    | INT (FK)      | Referência ao cliente solicitante (`cliente.id_cliente`)       |
| `id_onibus`     | INT (FK)      | Referência ao ônibus designado (`onibus.id_onibus`)            |

>  **Índice:** `idx_conflito` criado sobre `(id_onibus, data_partida, data_retorno)` para otimizar consultas de conflito de agenda — evita que o mesmo ônibus seja alocado em duas viagens simultâneas.

---

##  Tabela: `receita`

Armazena as receitas da empresa, geradas automaticamente por viagens ou inseridas manualmente como receitas externas.

### Estrutura

| Coluna       | Tipo          | Descrição                                                      |
|--------------|---------------|----------------------------------------------------------------|
| `id_receita` | INT (PK, AI)  | Identificador único da receita                                 |
| `id_viagem`  | INT (FK)      | Referência à viagem de origem — `NULL` se receita externa      |
| `descricao`  | VARCHAR(100)  | Descrição da origem — preenchido apenas para receitas externas |
| `valor`      | DECIMAL(10,2) | Valor da receita                                               |
| `data`       | DATE          | Data do registro                                               |

>  As receitas de viagem são registradas **automaticamente** pela trigger `trg_receita_viagem` a cada nova viagem inserida.

---

##  Tabela: `despesa`

Armazena as despesas categorizadas da empresa.

### Estrutura

| Coluna       | Tipo          | Descrição                                                              |
|--------------|---------------|------------------------------------------------------------------------|
| `id_despesa` | INT (PK, AI)  | Identificador único da despesa                                         |
| `categoria`  | ENUM          | `combustivel`, `manutencao`, `salario`, `pedagio`, `outros`            |
| `descricao`  | VARCHAR(100)  | Descrição detalhada da despesa                                         |
| `valor`      | DECIMAL(10,2) | Valor da despesa                                                       |
| `data`       | DATE          | Data do registro                                                       |
| `id_viagem`  | INT (FK)      | Referência à viagem relacionada — `NULL` se não houver vínculo         |

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

   | Ordem | Arquivo                  | Descrição                         |
   |-------|--------------------------|-----------------------------------|
   | 1°    | `01_create_database.sql` | Cria o banco de dados             |
   | 2°    | `02_create_tables.sql`   | Cria todas as tabelas e a trigger |
   | 3°    | `03_insert_data.sql`     | Insere os dados fictícios         |
   | 4°    | `04_queries.sql`         | Consultas para explorar os dados  |

---

##  Conceitos Aplicados

- Criação de banco de dados (`CREATE DATABASE`)
- Definição de tabelas com tipos de dados e constraints (`PRIMARY KEY`, `NOT NULL`, `AUTO_INCREMENT`)
- Relacionamento entre tabelas (`FOREIGN KEY`, `REFERENCES`)
- Tipo enumerado (`ENUM`)
- Constraint de unicidade (`UNIQUE`)
- Valor padrão (`DEFAULT`)
- Índice para otimização (`CREATE INDEX`)
- Inserção de registros (`INSERT INTO`)
- Consultas e filtros (`SELECT`, `WHERE`, `ORDER BY`)
- Junção de tabelas (`JOIN`)
- Agregações (`SUM`, `GROUP BY`)
- Automação com trigger (`CREATE TRIGGER`, `AFTER INSERT`)

---

##  Próximos Passos

- [x] Criar tabela `onibus`
- [x] Criar tabela `motorista`
- [x] Criar tabela `cliente`
- [x] Criar tabela `viagem`
- [x] Criar tabela `receita`
- [x] Criar tabela `despesa`
- [x] Adicionar `FOREIGN KEYS` entre tabelas
- [x] Criar trigger para automação de receitas
- [x] Adicionar `ENUM` para campos controlados
- [x] Adicionar `UNIQUE` para CPF e CNH
- [x] Adicionar `INDEX` para otimização de conflitos de agenda
- [ ] Atualizar dados fictícios com os novos campos
- [ ] Criar queries de análise com `JOIN` e `SUM`
- [ ] Criar diagrama ER do banco de dados

---

##  Licença

Projeto disponibilizado para **fins educacionais e de portfólio**.  
Reprodução deve ser feita com atribuição à autora.

---

<p align="center">
  <a href="https://github.com/cavalcantiraissas/MySQL-Workbench">← Voltar ao repositório principal</a>
</p>
