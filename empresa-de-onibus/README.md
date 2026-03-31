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

### Dados inseridos

| id | Modelo           | Cadeiras | Banheiro | Som | Ar-condicionado |
|----|------------------|----------|----------|-----|-----------------|
| 1  | Marcopolo G7     | 46       | sim      | sim | sim             |
| 2  | Volare W9        | 28       | nao      | nao | sim             |
| 3  | Comil Campione   | 50       | nao      | sim | sim             |
| 4  | Irizar i6        | 42       | sim      | sim | sim             |
| 5  | Busscar El Buss  | 48       | sim      | nao | nao             |
| 6  | Neobus Mega      | 36       | nao      | nao | nao             |

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

3. **Abra o arquivo** `empresa_onibus.sql` localizado nesta pasta.

4. **Execute o script completo** com `Cmd + Shift + Enter` para criar o banco, as tabelas e inserir os dados.

5. Para explorar os dados, utilize queries como:
```sql
   SELECT * FROM onibus;
   SELECT * FROM onibus WHERE ar_condicionado = 'sim';
   SELECT modelo, quantidade_cadeiras FROM onibus ORDER BY quantidade_cadeiras DESC;
```

---

##  Conceitos Aplicados

- Criação de banco de dados (`CREATE DATABASE`)
- Definição de tabelas com tipos de dados e constraints (`PRIMARY KEY`, `NOT NULL`, `AUTO_INCREMENT`)
- Inserção de registros (`INSERT INTO`)
- Consultas e filtros (`SELECT`, `WHERE`, `ORDER BY`)

---

##  Próximos passos

- [ ] Criar tabela `motoristas`
- [ ] Criar tabela `viagens`
- [ ] Criar tabela `passageiros`
- [ ] Criar tabela `passagens` (relação N:N)
- [ ] Criar tabela `financeiro`
- [ ] Adicionar `FOREIGN KEYS` entre as tabelas
- [ ] Criar queries de análise e relatórios

---

##  Licença

Projeto disponibilizado para **fins educacionais e de portfólio**.  
Reprodução deve ser feita com atribuição à autora.

---

<p align="center">
  <a href="https://github.com/cavalcantiraissas/MySQL-Workbench">← Voltar ao repositório principal</a>
</p>
