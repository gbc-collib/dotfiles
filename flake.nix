{
  description = "Dev environment with Node.js, Go, Angular, bun, Neovim, zsh, kitty, plus LSP & Treesitter support";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager";  # optional
  };

  outputs = { self, nixpkgs, flake-utils, home-manager }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        # Dev shell for interactive development
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.nodejs_20           # Node.js (v20)
            pkgs.go                  # Golang
            pkgs.bun                 # bun (ensure this is available in your channel)
            pkgs.angular-cli         # Angular CLI
            pkgs.neovim              # Neovim
            pkgs.kitty               # Kitty terminal emulator
            pkgs.zsh                 # Zsh shell
            pkgs.typescript-language-server  # LSP for TypeScript
            pkgs.gopls               # Golang Language Server
            pkgs.tree-sitter         # Tree-sitter for syntax parsing
            pkgs.git                 # Git for version control
            pkgs.curl                # cURL for network operations
          ];

          shellHook = ''
            # Set editor and shell environment variables
            export EDITOR=nvim
            export SHELL=zsh
            echo "Welcome to your reproducible dev shell with full LSP & Treesitter support!"
          '';
        };

        # Optional: Home Manager configuration to symlink your dotfiles.
        # Replace "username" and home directory accordingly.
        homeConfigurations = {
          username = home-manager.lib.homeManagerConfiguration {
            pkgs = pkgs;
            modules = [
              {
                # User and home directory settings
                home.username = "username";
                home.homeDirectory = "/home/username";

                # Mapping dotfiles into ~/.config/
                home.file.".config/nvim".source = ./dotfiles/nvim;
                home.file.".config/kitty".source = ./dotfiles/kitty;
                home.file.".config/zsh".source = ./dotfiles/zsh;

                # Additional Home Manager modules or settings can be added here
              }
            ];
          };
        };
      });
}
