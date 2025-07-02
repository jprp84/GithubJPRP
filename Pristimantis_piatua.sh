
#Realizar un blast de las secuencias para saber que especies tienen secuencias similares 
# Cargas Blast

module load blast+/2.11.0

#Con los codigos de accesion generados en el BLAST, utilizo un scrpit en R, para descargarlos
#en formato .fasta las secuencias con los numeros de accesion.

## ========================================
# 1. Instalar y cargar el paquete rentrez
# ========================================
Instala si aún no lo tienes
install.packages("rentrez")

library(rentrez)

# ========================================
# 2. Define tus números de accesión
# ========================================
# Ejemplo: reemplaza con tus accesiones reales
accession_numbers <- c("AY123456", "AY234567", "AY345678")

# ========================================
# 3. Define el nombre de tu archivo multifasta de salida
# ========================================
output_file <- "mis_secuencias_multifasta.fasta"

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

#alinear las secuencias con muscle

# Alinear secuencias
for gene in *.fasta
do
./muscle3.8.31_i86linux64 -in $gene -out muscle_$gene -maxiters 1 -diags
done

# Crear directorio IQTREE
mkdir IQTREE

# mover archivos alienados
mv muscle_*.fasta MUSCLE

#Cargar IQTREE
module load iqtree/2.2.2.6

#Hacer filogenia
for muscle in muscle_*
do
iqtree2 -s ${muscle}
done

echo "Creando Directorios"

## Astral 1024  iqtree2 -t Astral.Pristimantis_Piatua.tree  -p MUSCLE --scfl 100 --prefix SClf.concord
 1020  module load iqtree/2.2.2.6
 1021  iqtree2 -t Astral.Pristimantis_Piatua.tree --gcf PristimantisPiatua.tree --prefix GCF.concord


1032  iqtree2 -t Astral.Pristimantis_Piatua.tree  -p MUSCLE --scfl 100 --prefix SClf.concord
 1033  iqtree2 -t Astral.Pristimantis_Piatua.tree  -p muscle --scfl 100 --prefix SClf.concord


