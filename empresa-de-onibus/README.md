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
- Inserção de registros (`INSERT INTO`)
- Consultas e filtros (`SELECT`, `WHERE`, `ORDER BY`)
- Junção de tabelas (`JOIN`)

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
