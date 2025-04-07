# myTermuXNeovimConfig

Con este setup tengo el NeoVim listo para poder escribir y compilar LaTeX en el celu en *TermuX*.

New setup:
- Para que los colorthemes se vean bien. La terminal tiene que soportar truecolor.

- Hacer `pkg install ripgrep`, para poder _grep_ear.

- En el archivo tex.lua está la solución para que funcione el latexindent, más o menos:
    * Tengo que usar directo del repo: git clone https://github.com/cmhughes/latexindent.pl
    * Puse el repo como `~/.latexindent/`.
    * El comando en `tex.lua` para ejecutar busca `~/.latexindent/latexindent.pl`
