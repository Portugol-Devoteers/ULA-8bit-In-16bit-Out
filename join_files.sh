#!/bin/bash

# Arquivo final
output_file="ula1.sv"

# Arquivos de entrada
input_files=(
  "mux.sv"
  "flag.sv"
  "math.sv"
  "ula_comparassion_block.sv"
  "divisor.sv"
  "multiplier.sv"
  "ula.sv"
  "adder.sv"
  "ula_logic_block.sv"
)

# Limpa o arquivo de saída antes de começar
> "$output_file"

# Loop pelos arquivos de entrada
for file in "${input_files[@]}"; do
  if [[ -f $file ]]; then
    echo "// Content from $file" >> "$output_file" # Nome do arquivo como comentário
    cat "$file" >> "$output_file"                # Conteúdo do arquivo
    echo -e "\n" >> "$output_file"               # Adiciona uma linha em branco
  else
    echo "Warning: $file not found." >&2         # Mostra aviso se o arquivo não for encontrado
  fi
done

echo "Merged content into $output_file"