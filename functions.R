generate_stats <- function(df, subject_start, subject_end) {
  # filter the relevant subjects ids
  df = df |> filter(subject > subject_start & subject < subject_end)
  
  # check data length
  if (nrow(df) < 10) { 
    print("data is too short")
  } else {
    results = data.frame(variable = character(),
                         mean = numeric(),
                         min = numeric(),
                         max = numeric(),
                         sd = numeric(),
                         levels = character())
    # run on all variables in the df
    for (var in names(df)) {
      values = df[[var]]
      # get some metrics for numeric vars
      if (class(values) == "numeric") {
        results = rbind(results, data.frame(
          variable = var,
          mean = mean(values, na.rm = TRUE),
          min = min(values, na.rm = TRUE),
          max = max(values, na.rm = TRUE),
          sd = sd(values, na.rm = TRUE),
          levels = NA
        ))
      } else {
        # get levels for factor vars
        factor_values = factor(values)
        results <- rbind(results, data.frame(
          variable = var,
          mean = NA,
          min = NA,
          max = NA,
          sd = NA,
          levels = paste(levels(factor_values), collapse = ", ")
        ))
      }
    }
    
    return(results)    
  }
}

