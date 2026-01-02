{
  description = "Python development environment with Nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        
        # Crie seu ambiente Python com as dependências necessárias
        pythonEnv = pkgs.python311.withPackages (ps: with ps; [
          # Adicione aqui as dependências Python que você precisa
          fastapi
          uvicorn
        ]);
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pythonEnv
            pkgs.python311Packages.pip
          ];

          shellHook = ''
            echo "🚀 Ambiente Python carregado com Nix!"
            echo "Python version: $(python --version)"
            echo ""
            echo "Para instalar dependências adicionais com pip (temporariamente):"
            echo "  pip install --user <pacote>"
            echo ""
            echo "Para adicionar permanentemente, edite o flake.nix"
          '';
        };

        # Configuração para executar diretamente com 'nix run'
        packages.default = pkgs.writeShellScriptBin "python-app" ''
          ${pythonEnv}/bin/python main.py
        '';
      }
    );
}
