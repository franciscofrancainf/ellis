# 1. Usar uma imagem oficial do Python como imagem base
FROM python:3.10-slim

# 2. Definir o diretório de trabalho no container
WORKDIR /app

# 3. Copiar o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# 4. Instalar as dependências
# --no-cache-dir: Desativa o cache, o que pode reduzir o tamanho da imagem.
# -r requirements.txt: Instala os pacotes a partir do arquivo de requisitos.
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copiar o restante do código da aplicação para o diretório de trabalho
COPY . .

# 6. Expor a porta 8000 para o mundo fora deste container
EXPOSE 8000

# 7. Definir o comando para executar a aplicação
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]