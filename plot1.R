data <- read_delim("./data/hpc.txt", delim = ";", na = "?", col_types = "ctnnnnnnn")
mutate(data, Date = as.Date(strptime(Date, format = "%d/%m/%Y")))