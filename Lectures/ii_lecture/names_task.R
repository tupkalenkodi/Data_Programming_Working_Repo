names<-c("Sophia Abbe", "Olivia Abbett", "Emma Abbey", "Ava Abbitt", "Isabella Abbot", "Mia Abbott", "Aria Abbs", "Riley Abby", "Zoe Abdon", "Amelia Able", "Layla Abner", "Charlotte Abney", "Aubrey Aborn", "Lily Abrahams", "Chloe Abram", "Harper Abram", "Evelyn Ace", "Adalyn Acey", "Emily Acker", "Abigail Ackerley", "Madison Ackerly", "Aaliyah Ackerman", "Avery Ackers", "Ella Ackert", "Scarlett Ackland", "Maya Ackland", "Mila Ackley", "Nora Acklin", "Camilla Ackroyd", "Arianna Acock", "Eliana Acomb", "Hannah Acomb", "Leah Acors", "Ellie Acre", "Kaylee Acreman", "Kinsley Acres", "Hailey Acton", "Madelyn Acuff", "Paisley Acy", "Elizabeth Adams", "Addison Adcock", "Isabelle Adcox", "Anna Addams", "Sarah Adderley", "Brooklyn Adderly", "Mackenzie Addicott", "Victoria Addington", "Luna Addy", "Penelope Ade", "Grace Ades")

names_m = str_split(names, pattern =" ", simplify = TRUE)

names_abbr = str_c(str_sub(names_m[, 1], 1, 1),
                   names_m[, 2], sep = ". ")
names_abbr

x = names_m[, 1]
x_a = str_c(x[str_ends(x, "a")], collapse = ", ")
x_e = str_c(x[str_ends(x, "e")], collapse = ", ")
x_h = str_c(x[str_ends(x, "h")], collapse = ", ")
x_collapsed = str_c(x_a, x_e, x_h)
x_collapsed  = str_split(x_collapsed, pattern = ", ", simplify = TRUE)
length(x_collapsed)
