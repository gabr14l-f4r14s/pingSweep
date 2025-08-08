# pingSweep.sh

## Descrição

`pingSweep.sh` é uma ferramenta simples escrita em Bash para realizar varreduras de rede (ping sweep) em diferentes faixas de IP. O script permite escanear redes de classes A, B e C para identificar quais hosts estão ativos, exibindo os IPs que responderam e o total de hosts ativos encontrados.

---

## Funcionalidades

- Varredura pequena (Classe C - /24): escaneia de `.1` a `.254` em uma subnet de 3 octetos.
- Varredura média (Classe B - /16): escaneia de `.0.1` a `.255.254` em uma subnet de 2 octetos.
- Varredura grande (Classe A - /8): escaneia de `.0.0.1` a `.255.255.254` em uma subnet de 1 octeto.
- Exibe os hosts ativos que responderam ao ping.
- Exibe o total de hosts ativos encontrados ao final da varredura.

---

## Requisitos

- Sistema operacional baseado em Linux.
- Bash shell.
- Comando `ping` disponível e com permissão para execução.

---

## Como usar

1. git clone https://github.com/gabr14l-f4r14s/pingSweep.git

2. Dê permissão de execução:

    ```bash
    chmod +x pingSweep.sh
    ```

3. Execute o script:

    ```bash
    ./pingSweep.sh
    ```

4. Siga as instruções na tela:

    - Escolha o tipo de varredura (1, 2 ou 3).
    - Digite o IP base da rede (exemplo: `192.168.0.0`).

5. Aguarde o término da varredura, que exibirá os hosts ativos e o total encontrado.

---

## Exemplo de uso

```bash
Escolha o tipo de varredura:
[1] Varredura pequena (Classe C - /24)
[2] Varredura média   (Classe B - /16)
[3] Varredura grande  (Classe A - /8)
Opção: 1
Digite o IP base da rede (ex: 192.168.0.0): 192.168.0.0
192.168.0.1 ativo
192.168.0.44 ativo
192.168.0.129 ativo
Total de hosts ativos: 3
