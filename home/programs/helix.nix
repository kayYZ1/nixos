{ pkgs, ... }:

{
  # Enable Helix and configure it for C/C++ development
  programs.helix = {
    enable = true;
    package = pkgs.helix; # Use the default Helix package from nixpkgs
    settings = {
      editor = {
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        auto-format = true;
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
    ];
  };
}
