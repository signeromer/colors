### --- Forskningsenhedens farver --- ###

# Primære HEX-værdier
main_color       <- "#004aad"  # blå
secondary_color  <- "#c6302c"  # rød
accent_color     <- "#BBE5ED"  # lys blå
text_color       <- "#343434"  # sort
background_color <- "#ffffff"  # hvid


### --- Kort navnevektor (bruges i plots) --- ###
color_info <- c(
  "blue"   = main_color,
  "red"    = secondary_color,
  "light_blue" = accent_color,
  "black"  = text_color,
  "white"  = background_color
)

### --- Lang beskrivelsesvektor (til visning) --- ###
color_labels <- c(
  "blue"   = "Blue (main)",
  "red"    = "Red (secondary)",
  "light_blue" = "Light blue (accent)",
  "black"  = "Black (text/lines)",
  "white"  = "White (background)"
)


### --- Funktion: hent farver --- ###
our_colors <- function(...) {
  cols <- tolower(c(...))
  if (length(cols) == 0) return(unname(color_info))
  unname(color_info[cols])
}


### --- Funktion: vis farver med navn + HEX på felterne --- ###
see_colors <- function() {
  n <- length(color_info)
  names_vec <- names(color_info)
  hex_vec   <- unname(color_info)
  label_vec <- color_labels[names_vec]
  
  # Label-tekst: fx "Blue (main) #004aad"
  labels <- paste0(label_vec, "\n", hex_vec)
  
  # Print tabel i konsollen
  df <- data.frame(
    Name = label_vec,
    HEX  = hex_vec,
    stringsAsFactors = FALSE
  )
  print(df, row.names = FALSE)
  
  # Tegn farvefelter
  old_par <- par(no.readonly = TRUE)
  on.exit(par(old_par))
  par(mar = c(1, 1, 2, 1))
  
  plot(NULL, xlim = c(0, n), ylim = c(0, 1),
       xaxt = "n", yaxt = "n", bty = "n",
       main = "Forskningsenhedens farver")
  
  rect(
    xleft   = seq(0, n - 1),
    ybottom = 0,
    xright  = seq(1, n),
    ytop    = 1,
    col     = hex_vec,
    border  = "gray30"
  )
  
  # Automatisk kontrasttekst (hvid tekst på mørke farver)
  text_col <- ifelse(colSums(col2rgb(hex_vec)) / 3 > 180, "black", "white")
  
  text(
    x = seq(0.5, n - 0.5),
    y = 0.5,
    labels = labels,
    cex = 0.8,
    col = text_col
  )
  
  invisible(df)
}
