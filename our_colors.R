# ===============================================
# Anæstesiologisk Forskningsenhed – farver
# Version 2025-10-14
# ===============================================

# Definer farver

main_color      <- "#004aad"  # blå
secondary_color <- "#c6302c"  # rød
accent_color    <- "#0d6256"  # grøn
text_color      <- "#343434"  # sort
background_color <- "#ffffff" # hvid

# Vektor med alle farver (valgfri)
our_colors <- c(
  blue   = main_color,
  red  = secondary_color,
  green = accent_color,
  black = text_color,
  white = background_color
)


# Hjælpefunktion (info om farvekoder osv.)

 info <- function(...) {
  cols <- c(...)
  if (length(cols) == 0) return(our_colors)
  our_colors[cols]
}

# ============================================================
# BASE R: defaults for plots
# ============================================================
our_defaults <- function() {
  # Sæt farver for tekst, akser, labels og hovedtekst
  par(
    col       = text_color,
    col.axis  = text_color,
    col.lab   = text_color,
    col.main  = text_color,
    bg        = background_color
  )
  message("Farver loaded: base R bruger nu standardfarver til plots, tekst, baggrund osv.")
}

# Hjælpefunktion for basale plots
our_plot <- function(x, y, main = "Our Plot", ...) {
  plot(x, y,
       col = main_color,
       pch = 19,
       main = main,
       fg = text_color,
       col.axis = text_color,
       col.lab = text_color,
       col.main = text_color,
       col.sub = text_color,
       bg = background_color,
       ...)
}

# ============================================================
# GGPLOT2: optional helpers
# ============================================================
our_ggplot <- function(...) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("Installér ggplot2 for at bruge company_ggplot()")
  }
  ggplot2::ggplot(...) +
    ggplot2::scale_color_manual(values = c(main_color, secondary_color, accent_color)) +
    ggplot2::scale_fill_manual(values = c(main_color, secondary_color, accent_color))
}

# ============================================================
# Message ved load
# ============================================================
message("Setup loaded: main_color=", main_color, ", secondary_color=", secondary_color)
