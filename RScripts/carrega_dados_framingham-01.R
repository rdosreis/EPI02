library(readr)
framnghm <- read_table(file = "dados/framnghm.dat", 
                       col_names = c("ID",
                                     "CHD",
                                     "AGE","AGE_Lo","AGE_Up",
                                     "I_male",
                                     "SBP", "SBP10","DBP",
                                     "CHOL","FRW",
                                     "CIG",
                                     "YRS_CHD", "new_chd",
                                     "YRS_DTH","DEATH", "I_dead","CAUSE"),
                       na = ".")
