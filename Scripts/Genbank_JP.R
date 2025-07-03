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
accession_numbers <- c("EF493349.1", "EF493387.1", "EF493672.1", "MK829659.1", "MK881467.1", "MK881479.1", "MK881483.1", "MK881491.1", "MZ241502.1
")

# ========================================
# 3. Define el nombre de tu archivo multifasta de salida
# ========================================
output_file <- "Pristimantispiatua_secuencias_multifasta.fasta"

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
