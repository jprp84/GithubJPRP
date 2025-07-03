# ========================================
# 1. Instalar y cargar el paquete rentrez
# ========================================
Instala si aún no lo tienes
install.packages("rentrez")

library(rentrez)

# ========================================
# 2. Define tus números de accesión
# ========================================
# Ejemplo: reemplaza con tus accesiones reales
accession_numbers <- c("OP476263.1", "MK881477.1", "MK881491.1", "OP476263.1", "EF493529.1", "MZ241505.1", "AY326005.1", "MK881476.1", "MK881491.1", "MK881471.1", "MT636524.1", "MT636525.1", "MT636532.1", "MK881479.1", "MK881466.1", "MK881482.1", "MK881479.1", "MK881483.1", "MK881467.1", "MK881407.1", "MT635670.1", "MK881491.1", "EF493387.1", "EF493389.1", "EF493672.1", "EF493389.1", "MN128392.1", "EU186670.1", "MN128393.1", "EF493387.1", "MK829659.1", "OP476268.1", "EF493529.1", "EF493387.1", "EU186670.1", "EF493672.1", "MZ241502.1", "OP476267.1", "EF493387.1", "EF493349.1", "MK829659.1", "OP476261.1", "EU186663.1")

# ========================================
# 3. Define el nombre de tu archivo multifasta de salida
# ========================================
output_file <- "Pristimantis_Piatua.fasta"

# Si quieres sobrescribir cualquier archivo existente, puedes borrar primero:
if (file.exists(output_file)) {
  file.remove(output_file)
}

# ========================================
# 4. Descarga cada secuencia y agrégala al archivo
# ========================================
for (acc in accession_numbers) {
  cat("Descargando", acc, "...\n")
  
  # Descarga la secuencia en formato FASTA
  fasta_seq <- entrez_fetch(db = "nuccore",
                            id = acc,
                            rettype = "fasta",
                            retmode = "text")
  
  # Añade la secuencia al archivo multifasta
  cat(fasta_seq, file = output_file, append = TRUE)
}

# ========================================
# 5. Mensaje final
# ========================================
cat("✅ Todas las secuencias fueron guardadas en:", output_file, "\n")
