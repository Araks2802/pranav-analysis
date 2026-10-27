# Shared helpers for the cricket analysis pipeline.
# Reusable across future match articles: theme, palette, validation, saving.

suppressMessages({
  library(ggplot2)
})

# ---- Brand palette (matches the website visual identity) -------------------
brand <- list(
  navy    = "#0b1220",  # near-black foundation
  panel   = "#0f1830",  # slightly lighter panel
  ink      = "#e8edf6",  # off-white text on dark
  muted   = "#9aa7bd",  # muted grey-blue
  grid    = "#22314f",  # subtle gridline
  lime    = "#c6f432",  # cricket accent (energetic lime)
  lime_d  = "#9ac41f",
  cyan    = "#36d0c4",  # football accent
  red     = "#ff5d5d",  # emphasis / wickets
  gold    = "#ffcf5c"
)

# India / NZ team colours used consistently in the article charts
col_india <- brand$lime
col_nz    <- brand$cyan

# ---- Editorial ggplot theme (dark) -----------------------------------------
theme_editorial <- function(base_size = 14) {
  theme_minimal(base_size = base_size) +
    theme(
      plot.background  = element_rect(fill = brand$navy, colour = NA),
      panel.background = element_rect(fill = brand$navy, colour = NA),
      panel.grid.major = element_line(colour = brand$grid, linewidth = 0.3),
      panel.grid.minor = element_blank(),
      text         = element_text(colour = brand$ink),
      plot.title   = element_text(face = "bold", size = base_size * 1.35, colour = brand$ink),
      plot.subtitle= element_text(size = base_size * 0.95, colour = brand$muted, margin = margin(b = 10)),
      plot.caption = element_text(size = base_size * 0.72, colour = brand$muted, hjust = 0),
      axis.text    = element_text(colour = brand$muted),
      axis.title   = element_text(colour = brand$ink),
      legend.text  = element_text(colour = brand$ink),
      legend.title = element_text(colour = brand$ink),
      legend.position = "top",
      plot.margin  = margin(16, 18, 12, 14)
    )
}

# ---- Save helper: export SVG + PNG at consistent sizing --------------------
save_fig <- function(plot, name, width = 8, height = 5, dpi = 200,
                     dir = "analysis/cricket/figures") {
  dir.create(dir, showWarnings = FALSE, recursive = TRUE)
  png_path <- file.path(dir, paste0(name, ".png"))
  ggsave(png_path, plot, width = width, height = height, dpi = dpi, bg = brand$navy)
  out <- png_path
  # SVG is nice-to-have; only export if svglite is available.
  if (requireNamespace("svglite", quietly = TRUE)) {
    svg_path <- file.path(dir, paste0(name, ".svg"))
    ggsave(svg_path, plot, width = width, height = height, bg = brand$navy)
    out <- c(svg_path, png_path)
  }
  message("saved: ", paste(out, collapse = " + "))
  invisible(out)
}

# ---- Validation helper ------------------------------------------------------
check <- function(label, condition, detail = "") {
  status <- if (isTRUE(condition)) "PASS" else "FAIL"
  cat(sprintf("[%s] %s%s\n", status, label,
              if (nzchar(detail)) paste0("  (", detail, ")") else ""))
  if (!isTRUE(condition)) {
    stop("Validation failed: ", label, " ", detail, call. = FALSE)
  }
  invisible(condition)
}
