# ===============================================
# COMPANY COLORS — enkel version
# ===============================================

company_colors <- c(
  red   = "#c11111",
  blue  = "#004aad",
  green = "#0d6256",
  black = "#343434",
  white = "#ffffff"
)

company_col <- function(...) {
  cols <- c(...)
  if (length(cols) == 0) return(company_colors)
  company_colors[cols]
}


