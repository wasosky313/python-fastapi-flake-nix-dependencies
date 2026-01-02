# python-flake-nix-dependencies

API FastAPI gerenciada com Nix Flakes - ambiente isolado e reproduzível! 🚀

## 🎯 Como usar

### Opção 1: Entrar no ambiente de desenvolvimento

```bash
nix develop
```

Isso vai:

- Instalar o Python 3.11
- Carregar FastAPI e Uvicorn
- Manter seu sistema limpo (tudo isolado no Nix)

### Opção 2: Usar com direnv (recomendado!)

Se você tem o direnv instalado:

```bash
direnv allow
```

Agora toda vez que entrar na pasta, o ambiente será carregado automaticamente!

### Opção 3: Executar a API

```bash
python main.py
```

Ou com reload automático:

```bash
uvicorn main:app --reload
```

## 🌐 Endpoints

- **GET** `/liveness` - Retorna `{"alive": true}`
- **GET** `/docs` - Documentação interativa (Swagger)
- **GET** `/redoc` - Documentação alternativa (ReDoc)

Servidor roda em: <http://localhost:8000>

## 📦 Adicionar dependências Python

Edite o arquivo `flake.nix` e adicione os pacotes na seção `pythonEnv`:

```nix
pythonEnv = pkgs.python311.withPackages (ps: with ps; [
  fastapi
  uvicorn
  requests  # adicione aqui
  # suas dependências...
]);
```

Depois rode:

```bash
direnv reload
# ou
nix develop
```

## 🧹 Vantagens

- ✅ Ambiente isolado (não polui seu sistema)
- ✅ Reproduzível (mesmas versões em qualquer máquina)
- ✅ Fácil de compartilhar
- ✅ Não precisa instalar Python globalmente
- ✅ Usa cache de binários (nixos-25.11) - instalação rápida!