# Semana 5: criando um banco MySQL no Amazon RDS (lab 4)

Meu passo a passo para o lab de RDS:

1. Ao criar o banco de dados, habilitar o **acesso público**.
2. Definir o nome do usuário (de preferência "admin"), criar uma senha e dar um nome ao banco nas configurações avançadas.
3. Após a criação, ir em **VPC security groups**, abrir o grupo e adicionar uma regra de entrada para **MySQL/Aurora** (não é preciso liberar todas as regras de MySQL, fiz por precaução).
4. No RDS, copiar o **endpoint**, a **porta**, o usuário, a senha e o nome do banco.
5. No MySQL Workbench, criar uma nova conexão com esses dados e testar a conexão.
6. Com o teste bem-sucedido, clicar em OK e abrir a conexão pelo menu principal.
