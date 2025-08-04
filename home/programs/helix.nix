{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    package = pkgs.helix; # Ensure this is Helix 24.07 or later (available in NixOS 25.05 or unstable)
    settings = {
      editor = {
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        auto-format = true; # Enables auto-formatting globally (ensure formatters are defined for all languages)
        lsp.display-messages = true;
      };
    };
    languages.language = [
      {
        name = "cpp";
        auto-format = true;
        language-servers = [ "clangd" ];
        formatter = {
          command = "${pkgs.clang-tools}/bin/clang-format";
          args = [ "--style=Google" ];
        };
      }
      {
        name = "c";
        auto-format = true;
        language-servers = [ "clangd" ];
        formatter = {
          command = "${pkgs.clang-tools}/bin/clang-format";
          args = [ "--style=Google" ];
        };
      }
      {
        name = "javascript";
        scope = "source.js";
        file-types = [ "js" "jsx" ];
        auto-format = true;
        language-servers = [ "typescript-language-server" ];
        formatter = {
          command = "${pkgs.biome}/bin/biome";
          args = [ "format" "--stdin" "--stdin-file-path" "file.js" ];
        };
      }
      {
        name = "typescript";
        scope = "source.ts";
        file-types = [ "ts" "tsx" ];
        auto-format = true;
        language-servers = [ "typescript-language-server" ];
        formatter = {
          command = "${pkgs.biome}/bin/biome";
          args = [ "format" "--stdin" "--stdin-file-path" "file.ts" ];
        };
      }
      {
        name = "jsx";
        scope = "source.jsx";
        file-types = [ "jsx" ];
        auto-format = true;
        language-servers = [ "typescript-language-server" ];
        formatter = {
          command = "${pkgs.biome}/bin/biome";
          args = [ "format" "--stdin" "--stdin-file-path" "file.jsx" ];
        };
      }
      {
        name = "tsx";
        scope = "source.tsx";
        file-types = [ "tsx" ];
        auto-format = true;
        language-servers = [ "typescript-language-server" ];
        formatter = {
          command = "${pkgs.biome}/bin/biome";
          args = [ "format" "--stdin" "--stdin-file-path" "file.tsx" ];
        };
      }
    ];
    languages.language-server = {
      typescript-language-server = {
        command = "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server";
        args = [ "--stdio" ];
      };
    };
  };
}
