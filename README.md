# Farver og logo i R
## Anæstesiologisk Forskning, Bispebjerg Hospital"
_2025-10-15_
____________________________________

## Hent koden

Her er en guide til at bruge forskningsenhedens farver i R. 

Farvekoderne og koden er gemt på GitHub, så for at bruge dem, skal der linkes til kildekoden i starten af din kode som vist her:

```{r source code}
source("https://raw.githubusercontent.com/signeromer/colors/refs/heads/main/our_colors_source.R")
```

Der er lige nu disse funktioner:

* Se farverne
* Brug farverne
* Tilføj logo

De er uddybet i det følgende.


## Se farverne

Hvis du vil se alle farverne sammen med deres farvekoder, kan du skrive funktionen herunder:

```{r see colors, echo=TRUE, eval=TRUE}
see_colors()
```

## Brug farverne

Så er du sådan set klar til at bruge farvene i dine plots. Hvor du normalt ville skrive navnet eller hexkoden på en farve, kan du nu blot skrive fx:

```{r use colors, echo=TRUE, eval=FALSE}
our_colors("red")

our_colors("blue")
```


## Eksempler

Herunder er nogle eksempler på, hvordan du kan bruge dem i dine plots.
Selvom det er standardfarverne, der vises i koden, er det stadig vores farver, der bruges i selve grafen.

**Først et helt simpelt bar chart:**
```{r simple bar chart, echo=TRUE, eval=TRUE}
barplot(1:5, col = our_colors("red"))
```

**Der kan også bruges flere af farverne sammen:**
```{r multicolor bar chart, echo=TRUE, eval=TRUE}
barplot(1:5, col = our_colors("blue", "red", "yellow"))
```

**Farverne kan også bruges sammen med fx ggplot2:**
```{r ggplot2, echo=TRUE, EVAL=TRUE}
library(ggplot2)

# Simuleret data med mange punkter
set.seed(42)
df <- data.frame(
  x = rnorm(500, mean = 0, sd = 5),
  y = rnorm(500, mean = 0, sd = 5),
  grp = sample(letters[1:5], 500, replace = TRUE)
)

# Scatterplot med vores farver
ggplot(df, aes(x, y, color = grp)) +
  geom_point(size = 3, alpha = 0.8) +
  scale_color_manual(
    values = our_colors("blue", "red", "yellow", "black", "white"),
    name = "Gruppe"
  ) +
  labs(
    title = "Scatterplot vores farver",
    x = "X-akse",
    y = "Y-akse"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold", color = our_colors("blue")),
    legend.position = "bottom"
  )
```

## Tilføj logo

Du kan tilføje vores logo som vist herunder:

```{r logo, echo=TRUE, eval=FALSE}
add_logo("logo")         # standard logo uden tekst
add_logo("logo_danish")  # dansk navn
add_logo("logo_english") # engelsk navn
```

Hvis det ikke specificeres, er logoet blot en fastsat størrelse. Hvis det skal tilpasses, kan placering og størrelse justeres som vist herunder:

```{r logo tilpasset, echo=TRUE, eval=FALSE}
add_logo("logo_english", x = 0.5, y = 0.9, width = 0.5, height = 0.5)
```

**Eksempel**
```{r logo eksempel, echo=TRUE, eval=TRUE}
barplot(1:5, col = our_colors("red"))
add_logo("logo")
```

På GitHub findes også alle logofiler, den bagvedliggende kode for det ovenstående samt en udgave af dette dokument.
Find det her: https://github.com/signeromer/colors/tree/main
